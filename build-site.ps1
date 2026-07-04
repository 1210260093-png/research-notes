param(
  [string]$VaultPath = "C:\Users\aaazl\OneDrive\ObsidianVaults\research",
  [string]$SitePath = $PSScriptRoot
)

$ErrorActionPreference = "Stop"

function Convert-ToRelativePath {
  param([string]$BasePath, [string]$FullPath)
  $baseUri = [Uri]([IO.Path]::GetFullPath($BasePath).TrimEnd('\') + '\')
  $fileUri = [Uri]([IO.Path]::GetFullPath($FullPath))
  [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($fileUri).ToString()).Replace('/', '\')
}

function Convert-ToSitePath {
  param([string]$Path)
  $Path.Replace('\', '/')
}

function Get-Excerpt {
  param([string]$Text)
  $plain = $Text `
    -replace '(?s)^---\s*\n.*?\n---\s*', ' ' `
    -replace '(?s)```.*?```', ' ' `
    -replace '\$\$[\s\S]*?\$\$', ' ' `
    -replace '\[\[|\]\]|[#*_`>|$\\-]', ' ' `
    -replace '\s+', ' '
  $plain.Trim().Substring(0, [Math]::Min(180, $plain.Trim().Length))
}

function Get-Title {
  param([string]$RelativePath, [string]$Text)
  $heading = [regex]::Match($Text, '(?m)^#\s+(.+?)\s*$')
  if ($heading.Success) {
    return $heading.Groups[1].Value.Trim()
  }
  return [IO.Path]::GetFileNameWithoutExtension($RelativePath)
}

function Get-Tags {
  param([string]$Text)
  $tags = New-Object System.Collections.Generic.HashSet[string]
  foreach ($match in [regex]::Matches($Text, '(?<![\w/])#([A-Za-z0-9_\-/\u4e00-\u9fa5]+)')) {
    [void]$tags.Add($match.Groups[1].Value)
  }
  $frontmatter = [regex]::Match($Text, '(?s)^---\s*\n(.*?)\n---')
  if ($frontmatter.Success) {
    foreach ($match in [regex]::Matches($frontmatter.Groups[1].Value, '(?m)^\s*-\s*([A-Za-z0-9_\-/\u4e00-\u9fa5]+)\s*$')) {
      [void]$tags.Add($match.Groups[1].Value)
    }
  }
  return @($tags | Sort-Object)
}

function Get-Outlinks {
  param([string]$Text)
  $links = New-Object System.Collections.Generic.HashSet[string]
  foreach ($match in [regex]::Matches($Text, '!?\[\[([^\]|#]+)(?:#[^\]|]+)?(?:\|[^\]]+)?\]\]')) {
    $target = $match.Groups[1].Value.Trim()
    if ($target) { [void]$links.Add(([IO.Path]::GetFileNameWithoutExtension($target))) }
  }
  return @($links | Sort-Object)
}

$contentPath = Join-Path $SitePath "content"
$assetPath = Join-Path $SitePath "assets"
$dataPath = Join-Path $SitePath "site-data"

foreach ($path in @($contentPath, $assetPath, $dataPath)) {
  if (Test-Path -LiteralPath $path) {
    Remove-Item -LiteralPath $path -Recurse -Force
  }
  New-Item -ItemType Directory -Path $path | Out-Null
}

$excludedPattern = '\\(\.obsidian|\.claude|\.claudian|\.repair-backup-[^\\]+|pdf library)(\\|$)'
$allFiles = Get-ChildItem -LiteralPath $VaultPath -Recurse -File -ErrorAction SilentlyContinue |
  Where-Object { $_.FullName -notmatch $excludedPattern }
$paperReportName = -join ([char[]](0x8BBA, 0x6587, 0x5E93, 0x5206, 0x533A, 0x62A5, 0x544A, 0x2E, 0x6D, 0x64))

$notes = @()
$assets = @()
$skipped = @()

foreach ($file in $allFiles) {
  $relative = Convert-ToRelativePath -BasePath $VaultPath -FullPath $file.FullName
  $relativeSite = Convert-ToSitePath $relative
  if ($file.Name -eq $paperReportName) {
    continue
  }
  if ($file.Extension -ieq ".md") {
    $destination = Join-Path $contentPath $relative
    New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
    try {
      Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
      $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    } catch {
      $skipped += $relativeSite
      continue
    }
    $id = $relativeSite -replace '\.md$', ''
    $notes += [ordered]@{
      id = $id
      title = Get-Title -RelativePath $relative -Text $text
      path = $relativeSite
      url = "content/$relativeSite"
      folder = Convert-ToSitePath ([IO.Path]::GetDirectoryName($relative))
      tags = @(Get-Tags -Text $text)
      outlinks = @(Get-Outlinks -Text $text)
      excerpt = Get-Excerpt -Text $text
      updatedAt = $file.LastWriteTime.ToString("o")
    }
  } else {
    $destination = Join-Path $assetPath $relative
    New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
    try {
      Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
    } catch {
      $skipped += $relativeSite
      continue
    }
    $assets += [ordered]@{
      name = $file.Name
      path = $relativeSite
      url = "assets/$relativeSite"
      extension = $file.Extension.ToLowerInvariant()
      size = $file.Length
      updatedAt = $file.LastWriteTime.ToString("o")
    }
  }
}

$tagCounts = @{}
$folderCounts = @{}
foreach ($note in $notes) {
  foreach ($tag in $note.tags) {
    if (-not $tagCounts.ContainsKey($tag)) { $tagCounts[$tag] = 0 }
    $tagCounts[$tag] += 1
  }
  $folder = $note.folder
  if ($folder) {
    $parts = $folder -split '/'
    for ($i = 0; $i -lt $parts.Count; $i++) {
      $folderName = ($parts[0..$i] -join '/')
      if (-not $folderCounts.ContainsKey($folderName)) { $folderCounts[$folderName] = 0 }
      $folderCounts[$folderName] += 1
    }
  }
}

$tags = @(
  foreach ($tag in $tagCounts.Keys) {
    [ordered]@{ name = $tag; count = $tagCounts[$tag] }
  }
) | Sort-Object -Property @{ Expression = "count"; Descending = $true }, @{ Expression = "name"; Ascending = $true }

$folders = @(
  foreach ($folder in $folderCounts.Keys) {
    [ordered]@{
      name = $folder
      label = (($folder -split '/')[-1])
      count = $folderCounts[$folder]
    }
  }
) | Sort-Object -Property name

$data = [ordered]@{
  generatedAt = (Get-Date).ToString("o")
  sourceVault = $VaultPath
  notes = @($notes | Sort-Object path)
  assets = @($assets | Sort-Object path)
  tags = @($tags)
  folders = @($folders)
}

$json = $data | ConvertTo-Json -Depth 8
Set-Content -LiteralPath (Join-Path $dataPath "index.json") -Value $json -Encoding UTF8

Write-Host "Built research site:"
Write-Host "  Notes:  $($notes.Count)"
Write-Host "  Assets: $($assets.Count)"
Write-Host "  Tags:   $($tags.Count)"
Write-Host "  Skipped offline/unavailable files: $($skipped.Count)"
Write-Host "  Output: $SitePath"
