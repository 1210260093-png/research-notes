---
tags:
  - expanders
  - embedding_universality
  - roll_back
category: theorems-tools-methods
---

## Background

这是一种新的**嵌入推进机制**。传统的 sequential embedding 往往是：每一步把一个对象嵌进去，然后继续往前走。一旦中间某一步把局部结构“用坏了”，后面就可能卡住。本文的方法允许：

- 先按照某个顺序逐步嵌入；
- 当发现当前局部选择阻碍了后续构造时，
- 可以**按顺序撤回前面若干步**；
- 再利用释放出来的空间，重新完成后续嵌入。

所以它的思想不是单纯“贪心嵌入”，而是“**可回退的嵌入**”。

与 Friedman–Pippenger 的方法 [[Friedman–Pippenger () — expanders contain small bounded-degree trees]] 的关系：是对 Friedman–Pippenger 树嵌入技术的一种增强。粗略地说：

- Friedman–Pippenger 提供了在扩张图中嵌入树的基本框架；
- 因而能够处理更灵活的嵌入任务，而不只是一次性静态地嵌入一棵树。

## Theorem
设 $d,m \in \mathbb{N}$ 满足 $d \ge 3$ 且 $m \ge 1$，设 $G$ 是一个图，$S$ 是 $G$ 的一个子图。进一步地，假设存在顶点 $s \in V(S)$ 和 $y \in N_G(s)\setminus V(S)$，使得图 $S+ys$ 是 $(d,m)$-extendable 的。那么 $S$ 也是 $(d,m)$-extendable 的。
### Proof.

设 $S' := S+ys$。由假设，$S'$ 是 $(d,m)$-extendable。任取 $X\subseteq V(G)$，满足 $|X|\le 2m$。由于 $S'$ 是 $(d,m)$-extendable，有

$$
|N_G(X)\setminus V(S')|
\ge
(d-1)|X|-\sum_{x\in X\cap V(S')}\bigl(d_{S'}(x)-1\bigr).
$$

我们要推出

$$
|N_G(X)\setminus V(S)|
\ge
(d-1)|X|-\sum_{x\in X\cap V(S)}\bigl(d_S(x)-1\bigr).
$$

注意到 $V(S')=V(S)\cup\{y\}$，且 $d_{S'}(s)=d_S(s)+1$，而对其余 $x\in V(S)$ 有 $d_{S'}(x)=d_S(x)$。

于是分情况讨论 $X$ 是否包含 $y,s$：

- 若 $y\notin X$ 且 $s\notin X$，则右边不变，而左边不减。
- 若 $y\notin X$ 且 $s\in X$，则右边增加 $1$，但左边也因顶点 $y\in N_G(s)\setminus V(S)$ 而增加 $1$。
- 若 $y\in X$ 且 $s\in X$，则左边增加 $1$，右边第一项与求和项的变化恰好相抵。
- 若 $y\in X$ 且 $s\notin X$，则左边不减，而右边因 $y$ 不再属于 $V(S)$ 而减小。

因此，对一切满足 $|X|\le 2m$ 的 $X$，所需不等式都成立，故 $S$ 是 $(d,m)$-extendable。

## See also
- [[(D,m)-extendable]] — roll-back 操作所保持的不变量
- [[Extendable method]] — roll-back 是其区别于传统贪心嵌入的关键引理
- [[Friedman–Pippenger (1987) — expanders contain small bounded-degree trees]] — 原始 Friedman–Pippenger 框架



