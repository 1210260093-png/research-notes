---
tags:
  - ai_draft
  - hamiltonicity
  - expanders
  - regularity_lemma
  - kelly_conjecture
category: theorems-tools-methods
---

## Definition (Kühn–Osthus 2013)

$\forall\varepsilon>0$，图 $G$ 是 **$\varepsilon$-robust expander**，如果对所有 $S\subseteq V(G)$ 满足 $\varepsilon n\le|S|\le n/2$，有
$$
|N_G(S)|\ge\varepsilon|S|/\log^2 n.
$$

**与普通 expander 的区别**：普通 expander 对所有 $|S|\le n/2$ 保证线性增长；robust expander 对小集合（$|S|<\varepsilon n$）不做要求，但对**中等大小**集合（$\ge\varepsilon n$）保证弱扩张（多一个 $1/\log^2 n$ 因子）。

这个弱化换取了一个关键性质：**robustness**——即使从图中删除一部分边/顶点，剩余图仍然是 robust expander。

## Key Property: Robustness Under Edge Removal

若 $G$ 是 $\varepsilon$-robust expander，$H\subseteq G$ 满足 $\Delta(H)\le\delta$（$\delta$ 足够小），则 $G\setminus E(H)$ 仍是 $\varepsilon'$-robust expander（$\varepsilon'$ 略大于 $\varepsilon$）。

这意味着可以"剥洋葱"：每次剥离一个 Hamilton 圈（移除 $n$ 条边，每顶点少 2 度），剩余图仍是 robust expander → 可以继续剥离下一个 Hamilton 圈 → 最终分解为 $\approx d/2$ 个边不交的 Hamilton 圈。

## Applications

1. **Hamilton 分解**（Kühn–Osthus 2013）：$d$-正则 robust expander → 边分解为 $\lfloor d/2\rfloor$ 个 Hamilton 圈 + 至多一个 1-因子
2. **Kelly 猜想**：大正则 tournament 有 Hamilton 分解
3. **随机图 Hamilton 分解**（Knox–Kühn–Osthus 2013）：$G(n,p)$ 在 $p\ge C\log n/n$ 时 whp 是 robust expander → 边分解为 $(1-o(1))np/2$ 个 Hamilton 圈

## See also
- [[Kühn–Osthus (2013) — Hamilton decompositions of regular expanders a proof of Kelly's conjecture for large tournaments]]
- [[Knox et al. (2013) — Edge-disjoint Hamilton cycles in random graphs]]
- [[C-expander]] — 组合扩张器，更强但不够 robust
- [[Spectral expander]] — 谱扩张器


