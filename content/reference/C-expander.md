---
tags:
  - expanders
category: concepts
---

设 $G$ 是一个有 $n$ 个顶点的图，且 $n\ge 3$。若满足下列条件，则称 $G$ 是一个 $C$-expander：  
  
(a) 对任意顶点集 $X\subseteq V(G)$，只要 $|X|<\frac{n}{2C}$ 就有  
$$  
|N(X)|\ge C|X|.  
$$
(b) 对任意两个互不相交的顶点集 $X,Y\subseteq V(G)$，只要 $|X|,|Y|\ge \frac{n}{2C}$ 则 $X$ 与 $Y$ 之间至少存在一条边。

## See also
- [[Spectral expander]] — 当 $d/\lambda$ 充分大时，$(n,d,\lambda)$-graph 也是 $C$-expander
- [[DFS algorithm]] — DFS 方法经常利用 C-expander 的两条性质推出长路径

