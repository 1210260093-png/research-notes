---
tags:
  - expanders
  - disjoint_paths
  - embedding
category: theorems-tools-methods
sources:
  - "[[ai notes/Draganic–Krivelevich–Nenadov (2022) — Rolling Backwards — Embedding Problems in Sparse Expanders]]"
  - "[[Hefetz–Krivelevich (2026) — Hamilton cycle space in random regular and randomly perturbed graphs]]"
---

## Background

这个工具来自 [[ai notes/Draganic–Krivelevich–Nenadov (2022) — Rolling Backwards — Embedding Problems in Sparse Expanders]]。在 Hefetz–Krivelevich 的 Hamilton cycle space 论文中，它被重新表述成一个不需要算法部分的弱版本，用来完成 [[Parity-switcher]] 中的点不交路径部分。

>[!quote] 直观理解
>如果一个图有足够强的稀疏扩张性，并且指定端点集不会在任何一个顶点附近过度集中，那么可以同时连接许多指定端点对，并让这些连接路径两两点不交。

---


>[!example] **Expansion after local deletion**
>设图 $G=(V,E)$。若对任意 $|X|\le n'$ 和任意边集 $F\subseteq E$，只要对每个 $x\in X$ 都有 $|F\cap\partial_G(x)|\le \alpha\deg_G(x)$，就有
>$$
>|N_{G\setminus F}(X)|\ge 2d'|X|,
>$$
>则称 $G$ 具有性质 $P_\alpha(n',d')$。
>
>这个定义可以理解为：即使从 $X$ 中每个点局部删掉一部分边，小集合 $X$ 仍然必须向外扩张。


>[!danger] **Disjoint paths lemma**
>设图 $G$ 具有性质 $P_\alpha(n',d')$，其中 $3\le d'<n'$。再设任意两个不交点集 $A,B\subseteq V(G)$，只要 $|A|,|B|\ge n'(d'-1)/16$，就有 $e_G(A,B)>0$。
>
>设 $S\subseteq V(G)$，并且对任意顶点 $x\in V(G)$ 都有
>$$
>|N_G(x)\cap S|\le \beta\deg_G(x).
>$$
>
>再设 $a_1,\dots,a_t,b_1,\dots,b_t$ 是 $S$ 中的 $2t$ 个顶点，其中
>$$
>t\le \frac{d'n'\log d'}{15\log n'}.
>$$
>若 $\beta<2\alpha-1$，则 $G$ 中存在两两点不交的路径 $P_1,\dots,P_t$，使得对每个 $1\le i\le t$，路径 $P_i$ 的两个端点分别是 $a_i$ 和 $b_i$。

---

## 在 Hefetz–Krivelevich 中的用法

>[!tip] **用于构造 parity-switcher 的路径部分**
>在 [[Hefetz–Krivelevich (2026) — Hamilton cycle space in random regular and randomly perturbed graphs]] 中，先找到一个短偶圈
>$$
>C=(v_1,\dots,v_{2k}),
>$$
>然后在辅助图 $G_1$ 中应用这个 disjoint paths lemma，得到两两点不交的路径 $P_2,\dots,P_k$，其中 $P_i$ 连接 $v_i$ 和 $v_{2k-i+2}$。
>
>这些路径把短偶圈上的镜像顶点成对连接起来，形成 [[Parity-switcher]] 需要的内部结构。

## See also

- [[Roll-back]] — disjoint paths 工具背后的稀疏扩张图嵌入机制
- [[(D,m)-extendable]] — roll-back 方法中常用的不变量
- [[Parity-switcher]] — 本工具在 Hamilton cycle space 证明中的直接应用位置
