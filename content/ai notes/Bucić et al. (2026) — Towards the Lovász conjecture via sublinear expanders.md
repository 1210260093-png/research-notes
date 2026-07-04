---
title: "Towards the Lovász conjecture via sublinear expanders"
authors: "Matija Bucić, Micha Christoph, Alexey Pokrovskiy, Raphael Steiner"
year: 2026
arxiv: "2606.09742"
status: "temporary note"
cssclasses:
  - paper-note
tags:
  - ai_draft
  - hamiltonicity
  - vertex_transitive_graphs
  - lovasz_conjecture
  - longest_paths
  - expanders
  - sublinear_expanders
---

# Towards the Lovász conjecture via sublinear expanders

> [!summary] 读完先记住什么
> 这篇论文研究 Lovász 猜想的一条弱化路线：不是直接证明每个连通 vertex-transitive graph 有 Hamilton path/cycle，而是先保证它一定有很长的 cycle。作者证明：每个足够大的 $n$ 阶连通 vertex-transitive graph 含有长度至少 $n^{2/3-o(1)}$ 的 cycle。这把此前的 $n^{9/14}$ 推进到 $2/3$ 指数附近，并且达到目前 longest-path-transversal 方法的自然极限。

## 背景：问题是什么

Lovász 猜想说：

> 每个连通 vertex-transitive graph 都有 Hamilton path。

更强的 Thomassen 版本说：

> 除了有限多个例外，每个连通 vertex-transitive graph 都有 Hamilton cycle。

这里 vertex-transitive graph 的意思是：从任意一个顶点看出去，图的结构都一样。循环图、超立方体、Cayley graph 都是典型例子。

完整猜想很难，所以人们先研究一个弱问题：

> 若 $G$ 是 $n$ 阶连通 vertex-transitive graph，那么至少能保证多长的 cycle？

记 $\ell(n)$ 为所有 $n$ 阶连通 vertex-transitive graph 中必然存在的最长 cycle 下界。历史进展大致是：

| 结果 | 下界 |
| --- | --- |
| Babai | $\Omega(n^{1/2})$ |
| DeVos | $\Omega(n^{3/5})$ |
| Groenland et al. | $\Omega(n^{13/21})$ |
| Norin et al. | $\Omega(n^{9/14})$ |
| 本文 | $n^{2/3-o(1)}$ |

本文主定理：

> [!theorem] Theorem 1.1
> 对任意 $\varepsilon>0$，当 $n$ 足够大时，每个 $n$ 阶连通 vertex-transitive graph 都含有长度至少
> $$
> n^{2/3-\varepsilon}
> $$
> 的 cycle。

## 核心视角：longest paths 的超图

对任意连通图 $G$，考虑由所有 longest paths 组成的集合族。可以把它看成一个超图 $\mathcal H_G$：

- 顶点集是 $V(G)$；
- 每条超边是一条 longest path 的顶点集。

于是

$$
\operatorname{lpt}(G)=\tau(\mathcal H_G),
$$

也就是说，$\operatorname{lpt}(G)$ 可以看作 longest paths 这族超边上的一种 vertex cover of such paths。

换句话说，$\operatorname{lpt}(G)$ 是最少需要多少个顶点，才能打中所有 longest paths。

这个视角很重要，因为本文的主要中间结果就是：

> [!theorem] Theorem 1.2
> 若 $G$ 是连通图，$\ell$ 是 $G$ 中 longest path 的长度，则
> $$
> \operatorname{lpt}(G)\le \ell^{1/2+o(1)}.
> $$

也就是说，虽然 longest paths 可能非常多，但总能用大约 $\sqrt{\ell}$ 个点全部拦住。

注意：任意两条 longest paths 在连通图中必相交，这是经典事实。但仅仅 pairwise intersecting 并不能推出很小的 hitting set。本文的内容更强：longest paths 不是任意相交集合族，它们来自图的路径结构，因此有更强的 transversal bound。

## 从 longest-path transversal 到 Lovász 下界

设 $G$ 是 $n$ 阶连通 vertex-transitive graph，$\ell$ 是最长路径长度。

已有结果给出：

$$
\ell \ge \frac{n}{\operatorname{lpt}(G)}-1.
$$

直观解释：

- 如果 $t=\operatorname{lpt}(G)$ 个点能打中所有 longest paths；
- vertex-transitive graph 的每个点地位一样；
- 把这个 hitting set 通过自同构搬来搬去，会迫使 longest path 覆盖足够多的图；
- 因而得到 roughly
  $$
  n\lesssim (\ell+1)t.
  $$

再代入本文的 bound：

$$
t=\operatorname{lpt}(G)\le \ell^{1/2+o(1)}.
$$

所以

$$
n\lesssim (\ell+1)\ell^{1/2+o(1)}
=\ell^{3/2+o(1)}.
$$

于是

$$
\ell\ge n^{2/3-o(1)}.
$$

这先得到 long path。最后利用 vertex-transitive graph 的连通性性质和 Bondy-Locke 的定理，把 long path 转成同阶 long cycle。

因此主定理的逻辑是：

$$
\operatorname{lpt}(G)\le \ell^{1/2+o(1)}
\Rightarrow
\text{vertex-transitive graph has path length } n^{2/3-o(1)}
\Rightarrow
\text{it has cycle length } n^{2/3-o(1)}.
$$

## 真正的技术核心：圆圈加匹配

本文真正难的地方是下面这个组合命题。

> [!theorem] Theorem 1.3
> 令 $L$ 是一个 $2n$ 个点的 cycle，顶点按顺序为
> $$
> v_1,\dots,v_{2n}.
> $$
> 令 $M$ 是前半部分 $\{v_1,\dots,v_n\}$ 与后半部分 $\{v_{n+1},\dots,v_{2n}\}$ 之间的任意 perfect matching。  
> 则在 $L\cup M$ 中存在一条 path，使用至少 $n^{1-\varepsilon}$ 条 matching edges。

人话版：

> 一个大圆圈上加了很多从前半边连到后半边的弦。不管这些弦怎么乱连，总能找到一条路，吃掉几乎线性多条弦。

Norin et al. 之前证明过一个较弱版本，只能吃掉 $n^{0.8}$ 条左右的 matching edges。本文把它加强到 $n^{1-\varepsilon}$。

这个定理为什么有用？

这里的降维逻辑大概是：

### 1. 反设：longest paths 不能被少数点打中

为了证明

$$
\operatorname{lpt}(G)\le \ell^{1/2+o(1)},
$$

可以反过来想：假如 $\operatorname{lpt}(G)$ 很大，说明没有一个小点集能打中所有 longest paths。

这意味着：

> 不管你选一个多小的候选拦截点集，总还有一条 longest path 完全避开它。

所以 longest paths 这族对象在图中分布得很“散”，不能被局部集中地拦住。

### 2. 先找到一个打中所有 longest paths 的 cycle

Norin et al. 的前置工具说明：如果 $\operatorname{lpt}(G)>1$，那么图中存在一个 cycle $C$，它打中所有 longest paths。

也就是说，虽然一个点未必能打中所有 longest paths，但至少可以找到一个 cycle $C$，所有 longest paths 都碰到它。

于是问题变成：

> 在这个 cycle $C$ 上，能不能找一个不大的点集，打中所有 longest paths？

如果可以，就得到 $\operatorname{lpt}(G)$ 的上界。  
如果不可以，说明很多 longest paths 会以复杂方式穿过 $C$。

### 3. 从“复杂穿过 cycle”抽出 transaction

论文使用一个叫 transaction 的结构。人话说就是：

> 在 cycle $C$ 的两个不相交弧段 $A,B$ 上，有很多条互不相交的路径，从 $A$ 连到 $B$。

形式上，可以把它想象成：

$$
a_1,\dots,a_k\in A,\qquad b_1,\dots,b_k\in B,
$$

并且有互不相交的连接路径

$$
P_i:a_i\leadsto b_i.
$$

这些 $P_i$ 不沿着 $C$ 走，而是在 $G$ 的其他地方从 $A$ 跳到 $B$。它们就是“跨越关系”。

为什么会出现很多这样的跨越关系？  
因为如果没有很多跨越关系，就可以用较少的点把所有 longest paths 拦住。反过来说，$\operatorname{lpt}(G)$ 很大时，cycle $C$ 上必须存在一个高阶 transaction。

### 4. transaction 变成“圆圈加匹配”

现在只看 cycle $C$ 上的这些端点：

$$
a_1,\dots,a_k,b_1,\dots,b_k.
$$

沿着 $C$ 的顺序，它们分布在两个弧段上。把 cycle $C$ 看作那个大圆圈 $L$，把每条外部连接路径 $P_i$ 暂时压缩成一条 matching edge $a_i b_i$。

于是得到一个模型：

> 一个 cycle，加上一组从一边连到另一边的 matching edges。

这正是 Theorem 1.3 的输入。

注意这里的 matching edge 在原图里不一定是一条边；它可能是一整条路径 $P_i$。但在组合模型中可以先把它当作一条弦，等找到想要的路径后再展开回原图。

### 5. Theorem 1.3 说：可以吃掉很多跨越路径

Theorem 1.3 保证，在这个“cycle + matching”模型里，存在一条 path，使用很多 matching edges。

翻译回原图就是：

> 可以沿着 $C$ 的若干段，再穿插很多条外部连接路径 $P_i$，拼成一条很长的路径。

这里“使用很多 matching edges”很关键，因为每使用一条 matching edge，回到原图时就等于使用了一条外部连接路径 $P_i$。这些外部路径提供了额外长度。

### 6. 为什么会矛盾？

原来 $\ell$ 是 longest path 的长度。  
如果 transaction 的阶数太大，Theorem 1.3 会让我们拼出一条路径，它比 $\ell$ 还长。

这不可能。

所以 transaction 的阶数不能太大。  
而 transaction 不太大又意味着 cycle $C$ 上可以找到一个较小的点集，打中所有 longest paths。

最终得到：

$$
\operatorname{lpt}(G)\le \ell^{1/2+o(1)}.
$$

所以这一步的核心不是说原图本身长得像“圆圈加匹配”，而是：

> 如果 longest paths 太难拦截，原图中就会强迫出现一个高阶 transaction；这个 transaction 可以抽象成“圆圈加匹配”；而 Theorem 1.3 会把它拼成一条过长的路径，从而矛盾。

所以：

$$
\text{cycle + matching 拼长路}
\Rightarrow
\operatorname{lpt}(G)\le \ell^{1/2+o(1)}.
$$

## Theorem 1.3 的证明路线

证明 Theorem 1.3 是全文最硬的部分。大致流程如下。

### Step 1：压缩圆圈

把原来的 cycle $L$ 分成很多连续小段，然后把每个小段压缩成一个点。

这样做的目的：

- 原图中 matching edges 很多；
- 压缩后顶点数减少；
- matching edges 变成辅助图里的边；
- 辅助图的平均度变得比较高。

高平均度是后面使用 expander decomposition 的入口。

### Step 2：做 sublinear expander decomposition

对压缩后的辅助图使用 Letzter-Methuku-Sudakov 类型的 sublinear expander decomposition。

得到若干个几乎覆盖大部分顶点的 pieces，每个 piece 内部都有足够好的扩张性。

直观上：

> 虽然整个辅助图未必是 expander，但可以从中分解出很多局部 expander 块。

### Step 3：在 expander pieces 里找很多 disjoint paths

在每个 expander piece 内部，利用已有的 sublinear expander 路径嵌入工具，连接许多指定端点，得到很多互不相交的小路径。

这些小路径的作用是：

- 吃掉许多 matching edges；
- 在局部 expander 中完成“可控连接”；
- 为全局拼接准备 path segments。

### Step 4：用 Eulerian/cycle decomposition glue lemma 拼接

现在有很多小路径散落在不同 pieces 中。作者证明一个关于 Eulerian multigraph 和 cycle decomposition 的技术 lemma，用来选择并组织这些 pieces 中的路径，使它们可以被串成一条大路径。

这一步的功能是全局 glue：

> 局部 expander 给路径段，Eulerian/cycle decomposition 负责把路径段排成一条可展开的大路径。

### Step 5：展开回原图

最后把压缩图中的路径展开回原来的 $L\cup M$。

因为每个压缩点对应原 cycle 上的一段，展开时可以沿着原 cycle 的小段走，从而得到原图中的一条真正 path。

并且这条 path 使用了至少 $n^{1-\varepsilon}$ 条 matching edges。

## 整体证明链

全文可以压缩成下面这条链：

$$
\text{sublinear expander decomposition}
\Rightarrow
\text{cycle + matching 中拼出吃很多匹配边的 path}
$$

$$
\Rightarrow
\operatorname{lpt}(G)\le \ell^{1/2+o(1)}
$$

$$
\Rightarrow
\text{vertex-transitive graph 中存在 } n^{2/3-o(1)} \text{ 长 path}
$$

$$
\Rightarrow
\text{vertex-transitive graph 中存在 } n^{2/3-o(1)} \text{ 长 cycle}.
$$

## 这篇文章的意义

这篇论文的意义不只是把指数从 $9/14$ 推到 $2/3$。更重要的是，它把目前最长路径 transversal 方法能达到的上限基本打满了。

为什么 $2/3$ 是自然屏障？

因为这条路线的核心不等式是：

$$
n\lesssim \ell\cdot \operatorname{lpt}(G).
$$

如果能证明

$$
\operatorname{lpt}(G)\lesssim \sqrt{\ell},
$$

那么最多就得到

$$
n\lesssim \ell^{3/2},
$$

也就是

$$
\ell\gtrsim n^{2/3}.
$$

本文证明的是 $\ell^{1/2+o(1)}$，所以基本达到了这套方法的极限。

要继续突破 $2/3$，可能需要新的机制，而不只是继续优化 longest-path transversal。

## 我自己的理解

这篇可以用一句话概括：

> 作者把 Lovász 猜想中的“对称图里找长圈”问题，转化成“所有最长路径能否被少数点打中”的 transversal 问题；再把 transversal 问题转化成“圆圈加匹配中能否拼出吃很多匹配边的路径”的组合问题；最后用 sublinear expander decomposition 完成拼路。

我觉得最值得记住的是超图视角：

> longest paths 形成一个超图，$\operatorname{lpt}(G)$ 就是这个超图的 vertex cover number。本文证明这个特殊超图的 vertex cover number 至多是 $\ell^{1/2+o(1)}$。

这个表述很干净，也方便和别的 hitting/transversal 问题联系起来。

## 后续可追的问题

1. Theorem 1.3 是否有更直接的证明，不经过完整 sublinear expander decomposition？
2. $\operatorname{lpt}(G)\le O(\sqrt{\ell})$ 是否可能去掉 $o(1)$？
3. 若想突破 vertex-transitive graph 中的 $n^{2/3}$ 长圈屏障，需要什么额外结构？
4. longest paths hypergraph 是否还有更强的结构性质，例如 fractional cover、matching number 或 Helly-type 性质？
