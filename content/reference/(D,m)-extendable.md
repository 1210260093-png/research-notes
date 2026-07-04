---
tags:
  - embedding_universality
category: concepts
---

这个定义最早来自[[Friedman–Pippenger (1987) — expanders contain small bounded-degree trees]]，是 [[Extendable method]] 和 [[Roll-back]] 的核心基础概念。
## Definition.

设 $D,m$ 是正整数，且 $D\ge 3$。设 $G$ 是一个图，$H\subseteq G$ 是其一个子图，并满足 $\Delta(H)\le D$。如果对每个满足 $1\le |S|\le 2m$ 的集合 $S\subseteq V(G)$，都有
$$
|\Gamma_G(S)\setminus V(H)|
\ge
(D-1)|S|-\sum_{u\in S\cap V(H)}(d_H(u)-1),
$$
则称 $H$ 在 $G$ 中是 **$(D,m)$-extendable** 的。


直观上，这个定义是在量化一句话：  
  
> **$S$ 虽然已经占用了一些顶点和边，但它还没有把局部扩张性用光。**  

---

## Proposition.

设 $d,m\in \mathbb{N}$，满足 $d\ge 3$ 且 $m\ge 1$。设图 $G$ 包含一个子图 $S$，并且 $S$ 的最大度至多为 $d$。如果每个满足 $|U|\le 2m$ 的集合 $U\subseteq V(G)$ 都满足  
$$  
|N(U,V(G)\setminus V(S))|\ge d|U|,  
$$  
那么 $S$ 在 $G$ 中是 $(d,m)$-extendable 的。

## See also
- [[Extendable method]] — 基于此定义的嵌入方法
- [[Roll-back]] — 允许撤销已嵌入边的推进机制
- [[Reserved connector theorem]] — 利用 extendable 构造连接器

