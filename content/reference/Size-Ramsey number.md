---
tags:
  - extremal_ramsey_turan
  - probabilistic_method
  - graph_theory
category: theorems-tools-methods
---

## 定义

设 $H$ 是一个图。$H$ 的 **size-Ramsey number**，记作 $\hat r(H)$，定义为满足下述性质的最小边数：
存在一个图 $G$，使得 $e(G)=m$，并且无论把 $G$ 的每条边染成红色或蓝色中的哪一种颜色，$G$ 中都一定包含一个单色的 $H$。也就是说，
$$
\hat r(H)=\min\{e(G): G\to (H)_2\}.
$$
这里记号
$$
G\to (H)_2
$$
表示：对图 $G$ 的边做任意红蓝 $2$-染色后，$G$ 中总能找到一个单色的 $H$。

###  $q$ 色版本

也可以定义 $q$ 色的 size-Ramsey number：
$$
\hat r_q(H)=\min\{e(G): G\to (H)_q\}.
$$

这里
$$
G\to (H)_q
$$
表示：对 $G$ 的边做任意 $q$ 色染色，总能找到一个单色的 $H$。

因此，前面的定义只是 $q=2$ 的特殊情形。

---

### 与普通 Ramsey number 的区别

普通的 Ramsey number $r(H)$ 定义为：
$$
r(H)=\min\{N: K_N\to (H)_2\}.
$$

也就是说，普通 Ramsey number 研究的是：最小要多少个顶点，才能保证在完全图 $K_N$ 的任意红蓝边染色中出现单色 $H$。

因此两者的区别是：

- $r(H)$ 关心的是 **顶点数**；
- $\hat r(H)$ 关心的是 **边数**。

更直观地说：

- 普通 Ramsey 数固定宿主图是完全图，只问点数要多大；
- size-Ramsey 数不要求宿主图是完全图，而是在所有可能的宿主图中，寻找一个边数最省的 Ramsey 图。

---

## 直观理解

size-Ramsey number 研究的是一种“最经济的 Ramsey 宿主图”。

普通 Ramsey 理论中，宿主图是完全图，所以非常稠密。  
而 size-Ramsey 理论问的是：要想强制出现单色 $H$，是不是可以不使用完全图，而改用一个边更少的图？

所以这个参数衡量的是：

> 为了保证任意 $2$-染色下都出现单色 $H$，最少需要多少条边。

size-Ramsey number 本质上是在问 **Ramsey 性质的边复杂度**。

### 一个例子

如果 $H=K_t$ 是完全图，那么要强制出现单色 $K_t$，宿主图通常必须比较稠密，因此 $\hat r(K_t)$ 往往很大。

但对于稀疏图，情况就很不一样。例如路径 $P_n$：

- 普通 Ramsey number $r(P_n)$ 是线性的；
- 更令人惊讶的是，size-Ramsey number 也仍然是线性的，即
  $$
  \hat r(P_n)=O(n).
  $$

这说明：虽然要求“任意红蓝染色下都出现单色长路径”看起来很强，但实际上只需要线性条边就能做到。这也是 size-Ramsey 理论中最经典的现象之一。

---


## 具体问题
### subdivision of bounded graph

由于我们距离一般有界度图的 size-Ramsey 数的理解还相当遥远，因此朝这个方向迈出的一个自然步骤，就是考虑这些图的细分。

**Subdivision.**
给定一个图 $H$ 和一个函数 $\sigma:E(H)\to \mathbb N$，$H$ 的 $\sigma$-细分 $H^\sigma$ 定义为：把每一条边 $e\in E(H)$ 替换成一条连接 $e$ 的两个端点、长度为 $\sigma(e)$ 的路径，并要求所有这些路径两两点不相交（端点处可能相交除外）所得到的图。换句话说，每条边 $e\in E(H)$ 都被细分了 $\sigma(e)-1$ 次。若 $\sigma(e)=q$ 是一个常值函数，则我们简记为 $H^q$ 来表示这样的图 $H^\sigma$。

“短”细分的 size-Ramsey 数最早由 Kohayakawa、Retter 和 Rödl 研究。我们在最近的一篇论文 [20] 中改进了他们的界，证明了：对于给定常数 $q,k$ 以及任意一个有 $n$ 个顶点的有界度图 $H$，都有 $\hat R_k(H^q)\le O(n^{1+1/q})$。这就去掉了他们原有界中的一个 polylogarithmic 因子，并回答了他们提出的问题。

更一般地，细分图在 Ramsey 理论中的研究可以追溯到 Burr 和 Erdős [14]，以及 Alon [3]；而更近一些，这类问题也出现在 tournament 的 Ramsey 理论背景下，见 [21,31]。

在第 3.1 节（定理 1）中，我们证明：有界度图的长细分，其 size-Ramsey 数与它本身的阶是线性的，从而解决了 Pak [48] 的如下猜想。

**猜想 1.2**（[48]）  
对任意 $k,D\in\mathbb N$，存在常数 $C,L>0$，使得如果 $H$ 是一个满足 $\Delta(H)\le D$ 的图，并且对每条边 $e\in E(H)$ 都有 $\sigma(e)=\ell\ge L\log(v(H^\sigma))$，那么 $\hat R_k(H^\sigma)\le C\,v(H^\sigma)$。

Pak [48] 证明了 $\hat R_k(H^\sigma)=O\bigl(v(H^\sigma)\log^3(v(H^\sigma))\bigr)$；而当 $H$ 是一个固定的（小）图且 $\sigma(e)$ 增长时的特殊情形，则已经由 Donadelli、Haxell 和 Kohayakawa [19] 解决。为了陈述我们的结果，我们先回顾 $\eta$-uniform 图这一概念。
## 小结

size-Ramsey number $\hat r(H)$ 是图 $H$ 的一个 Ramsey 型参数，定义为
$$
\hat r(H)=\min\{e(G): G\to(H)_2\}.
$$
它和普通 Ramsey number 的区别在于：

- 普通 Ramsey number 研究“最少多少个点”；
- size-Ramsey number 研究“最少多少条边”。

这个概念特别适合处理稀疏图的 Ramsey 问题，也是概率方法、随机图、伪随机图在 Ramsey 理论中的一个重要应用场景。

另一方面，很多 size-Ramsey 上界都是通过构造一个随机图 $G$，再证明它几乎必然满足
$$
G\to (H)_2
$$
得到的。这也是该领域最核心的方法之一。

### 研究意义

size-Ramsey number 之所以重要，是因为它连接了多个方向：

- **Ramsey 理论**：研究任意染色下必然出现的结构；
- **极值图论**：研究逼出某种结构所需的最少边数；
- **概率方法**：很多上界构造来自随机图；
- **伪随机图理论**：很多“稀疏但足够均匀”的图可以作为 Ramsey 宿主图。

因此，它特别适合研究下面这些对象的 Ramsey 性质：

- 路；
- 树；
- 圈；
- 有界度图；
- 随机图和伪随机图中的单色嵌入问题。

## Key tools
- [[Chernoff Bound]] — 上界构造中随机图的度数/边数集中
- [[Janson inequality]] — 证明随机图中某个候选结构 whp 存在
- [[Lovász Local Lemma (LLL)]] — 规避局部坏事件，构造 Ramsey 宿主图






