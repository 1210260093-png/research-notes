---
authors: Nemanja Draganić, Michael Krivelevich, Rajko Nenadov
year: 2022
arxiv: "2007.08332"
pages: 22
subjects: math.CO
tags:
  - expanders
  - embedding
  - roll_back
  - online_algorithm
  - topological_minor
  - spectral_graph_theory
  - size_Ramsey
sources:
  - "[arXiv:2007.08332](https://arxiv.org/abs/2007.08332)"
  - "[[Draganic-etal-2022-Rolling-backwards-can-move-you-forward-On-embedding-problems-in-sparse-expanders.pdf]]"
---

 
#Nemanja_Draganic #Michael_Krivelevich #Rajko_Nenadov  #TAMS

#expanders  #embedding #roll_back #online_algorithm #topological_minor #spectral_graph_theory #size_Ramsey

#level_2 #unfinished

- **标题**：Rolling Backwards Can Move You Forward: On Embedding Problems in Sparse Expanders

---

## Main Result

### Abstract 主旨

本文发展了一种适用于**稀疏扩张图**的通用嵌入方法。这个方法建立在 Friedman–Pippenger 的树嵌入技术及其算法版本之上，并进一步加入了一个 **roll-back（回滚）** 思想：允许按照顺序撤销之前已经执行的一些嵌入步骤，再重新推进后续构造。

作者用这一方法证明了三类结果：

1. 证明了**有界最大度图的对数长度 subdivision** 的 [[Size-Ramsey number]] 与其顶点数线性相关，从而解决了 Pak 的一个猜想。
2. 给出了一个**确定性的多项式时间在线算法**，用于在扩张图中，为给定的若干对端点寻找指定长度的两两点不交路径，从而回答了 Alon 和 Capalbo 的一个问题。
3. 证明了：如果一个 $d$-正则图的谱比 $\lambda/d$ 足够小，那么它必然包含一个 $K_t$ 的 topological minor，其中 $t=(1-o(1))d$；同时作者也构造了例子说明，即使 $\lambda=O(\sqrt d)$，理论上的最大值 $t=d+1$ 也未必能达到。

---


## Roll-back 

这篇文章最核心的地方：[[Roll-back]]

与 Friedman–Pippenger 的方法 [[Friedman–Pippenger () — expanders contain small bounded-degree trees]] 的关系：本文方法是对 Friedman–Pippenger 树嵌入技术的一种增强。粗略地说：
- Friedman–Pippenger 提供了在扩张图中嵌入树的基本框架；
- 本文在这个框架上加入了算法化和回滚机制；
- 因而能够处理更灵活的嵌入任务，而不只是一次性静态地嵌入一棵树。
---

## 结果一：size-Ramsey 问题

### 结论

作者证明：有界最大度图的**对数长度 subdivision** 的 size-Ramsey number 是线性的。

### 意义

这说明这类图在 Ramsey 意义下仍然比较“便宜”——不需要太多边就能强制出现单色拷贝。这里的重要点在于：

- 原图允许最大度有界；
- 每条边被替换成长度为对数量级的路径；
- 即便做了这种 subdivision，size-Ramsey number 依然只是线性级别。

这解决了 Pak 的一个猜想。

---

## 结果二：指定长度的点不交路径

### 结论

作者给出一个**确定性的多项式时间在线算法**，在扩张图中连接给定的若干对端点，并且每条连接路径的长度可以预先指定，同时这些路径两两点不交。

### 这个结果为什么强

这不只是存在性结论，而是一个：

- **deterministic** 的，
- **polynomial-time** 的，
- **online** 的

算法性结果。

这意味着它不仅说明“这种路径系统存在”，而且说明“可以有效地构造出来”，并且适应逐步到来的输入要求。

---

## 结果三：topological minor 与谱条件

### 结论

若一个 $d$-正则图满足相对较弱的谱条件，也就是 $\lambda/d$ 足够小，那么它包含一个 $K_t$ 的 topological minor，其中

$$
t=(1-o(1))d.
$$

### 补充说明

作者还构造了反例，表明即使

$$
\lambda = O(\sqrt d),
$$

也不能保证达到理论上最大的

$$
t=d+1.
$$

### 意义

这说明：

- 谱扩张性已经足够强，可以推出相当大的 complete graph topological minor；
- 但这个推出并不是无损的；
- 即使谱性质已经很好，也依然可能差一点达不到最极限的 minor 大小。

---

## 文章中的关键词

### Sparse expanders

本文所有结果都围绕**稀疏扩张图**展开。这里的关键不是“边很多”，而是“虽然图稀疏，但仍有足够强的扩张性”，从而支持复杂嵌入。

### Embedding

整篇文章的统一主题是 embedding：怎样把树、路径系统、subdivision 或 topological minor 嵌入到扩张图里。

### Algorithmic aspect

摘要中特别强调，原始技术有算法版本，而本文的结果里也包含明确的算法性输出。因此这篇文章不只是纯存在性证明，也有明显的算法图论色彩。

---

## 直观理解

这篇文章可以理解成在说：

> 扩张性提供“空间”，  
> Friedman–Pippenger 方法提供“推进框架”，  
> roll-back 提供“纠错机制”，  
> 于是就能在稀疏扩张图中完成更复杂、更鲁棒的嵌入任务。

如果只会一直向前贪心走，那么局部失误很可能导致整体失败；而如果允许适度回退，就能重新分配资源，让整体构造继续进行。

---

## 可作为后续阅读重点的地方

### 1. roll-back 的精确定义

如果后面细读正文，最值得先抓住的是：

- 什么叫一次 embedding step；
- 什么情况下需要回滚；
- 回滚时撤销到哪里；
- 为什么回滚之后仍能保持已经建立的全局控制。

### 2. 路径连接定理的参数设计

第二个值得重点看的是点不交路径算法中的参数安排：

- 每条路径长度如何控制；
- 扩张性如何防止冲突；
- 在线输入如何与“预留空间”配合。

### 3. topological minor 结果里谱条件如何转成扩张性

第三个重点是：

- 从 $\lambda/d$ 小到某种扩张性质；
- 再从扩张性质推进到 large topological minor。

这部分和伪随机图、谱图理论的联系很紧。

---

## 一句话总结

这篇文章的核心贡献是：提出了一种带有 **roll-back** 思想的稀疏扩张图嵌入方法，并用它统一解决了 subdivision 的 size-Ramsey、指定长度点不交路径的算法构造，以及大 topological minor 的存在性这三类问题
