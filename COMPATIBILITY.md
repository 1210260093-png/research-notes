# Obsidian Compatibility Notes

This site renders an Obsidian vault with a browser-side compatibility layer.

Important rules:

- Preserve TeX display math before Markdown rendering.
- Render callout bodies through the same math-preserving path as normal notes.
- Keep Markdown soft line breaks disabled, because automatic `<br>` insertion can corrupt multiline TeX.
- Convert Obsidian-specific syntax before final Markdown rendering:
  - `[[note]]` links
  - `![[asset.png|width]]` embeds
  - `>[!type]` callouts
  - `==highlight==`
  - `%%comments%%`

When adding new syntax support, prefer transforming the original Markdown before `marked.parse`.
