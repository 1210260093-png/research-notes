---
title: "Dirac subgraphs of powers of cycles are Hamiltonian"
authors: "Richard Lang, Alp Müyesser, Mathias Schacht, Carl Schildkraut"
year: 2026
source: "arXiv:2606.07471"
arxiv: "2606.07471"
url: "https://arxiv.org/abs/2606.07471"
zotero: "zotero://select/library/items/6NVUELJ2"
status: "temporary note"
cssclasses:
  - paper-note
tags:
  - hamiltonicity
  - absorbing_method
  - dirac_type
  - resilience_perturbation
---

# Dirac subgraphs of powers of cycles are Hamiltonian

> [!summary] 读完先记住什么
> 这篇文章证明：对任意 $\varepsilon>0$，当 $k$ 足够大时，$C_n^k$ 的任意生成子图 $G$ 只要最小度至少 $(1+\varepsilon)k$，就一定 Hamiltonian。由于 $C_n^k$ 是 $2k$-正则图，这相当于说：删掉每个点附近不到一半的边，Hamilton 圈仍然存在。

## 背景：问题是什么

$C_n^k$ 是 $n$-圈的 $k$ 次幂：两个顶点只要在原来的圈 $C_n$ 上距离不超过 $k$，就在 $C_n^k$ 中连边。它是一个 $2k$-正则图，局部看很稠密，整体却远比完全图稀疏。

作者研究的是 **local resilience of Hamiltonicity**：一个 Hamiltonian host graph 允许每个顶点附近被删掉多少边，仍然保证任意剩下的图都有 Hamilton 圈？

Dirac 定理可以看成完全图 $K_n$ 的 local resilience：

$$
\delta(G)\ge n/2 \quad \Longrightarrow \quad G \text{ is Hamiltonian}.
$$

对 $C_n^k$，自然猜想是阈值也应该在一半附近。Espuny Díaz--Lichev--Wesolek 猜想：$C_n^k$ 的任意子图只要最小度至少 $k+1$，就有 Hamilton 圈。

## 主定理

> [!theorem] Theorem 1.2
> 存在常数 $k_0$，使得对每个 $\varepsilon>0$，只要整数 $n,k$ 满足
>
> $$
> n\ge k\ge \max\{\varepsilon^{-121},k_0\},
> $$
>
> 则 $C_n^k$ 的每个 $(1/2+\varepsilon)$-subgraph 都是 Hamiltonian。

文章后面改用等价说法：称 $G\subseteq C_n^k$ 是 $\alpha$-Dirac，如果

$$
\delta(G)\ge (1+\alpha)k.
$$

主定理就是：当 $k$ 足够大时，每个 $\alpha$-Dirac 子图都含 Hamilton 圈。

## 定义与符号

| 符号 | 含义 | 备注 |
| --- | --- | --- |
| $C_n^k$ | cycle $C_n$ 的 $k$ 次幂 | 圈上距离 $\le k$ 的点连边 |
| $\alpha$-Dirac | $\delta(G)\ge(1+\alpha)k$ | 等价于 $C_n^k$ 的 $(1+\alpha)/2$-subgraph |
| $U(X,p)$ | $p$-biased 随机子集 | 本文主要不用这个记号，但思想相近 |
| distributed set | 在每个长度 $\le 2k+1$ 的区间中密度稳定 | 用来模拟均匀随机储备集 |
| locally sparse | 在每个长度 $\le 2k+1$ 的区间中不太集中 | 端点集、删除集需要满足 |
| absorber | 可吸收任意 $S'\subseteq S$ 的路径结构 | 最后把剩余顶点并入 Hamilton 圈 |

**Distributed.** 对 $X\subseteq V(G)$，若它在每个长度至多 $2k+1$ 的区间中都接近期望密度，并且对共同邻域 $N_G(x)\cap N_G(y)$ 也有正确密度，就称 $X$ 是 distributed。  
直觉：它不是全局均匀，而是沿着 cycle 的局部几何均匀。

**Absorber.** 对 $S\subseteq V(G)$ 和 $x,y\notin S$，集合 $A\supseteq\{x,y\}$ 是 $(x,y;S)$-absorber，如果对任意 $S'\subseteq S$，图 $G[A\cup S']$ 都有一条从 $x$ 到 $y$ 的 spanning path。  
直觉：$A$ 是一条“可变形路径”，最后可以按需要吃掉 $S$ 里的任意剩余点。

## 证明流程

> [!route] 总体路线
> 证明是一个 absorption strategy：
>
> $$
> \text{reserve } S,R
> \Rightarrow
> \text{build absorber in } R
> \Rightarrow
> \text{path-decompose remaining graph}
> \Rightarrow
> \text{connect paths using } S
> \Rightarrow
> \text{absorb leftover vertices}
> \Rightarrow
> \text{Hamilton cycle}.
> $$

### Step 1: 分出两个均匀储备集

先把顶点集分成三部分

$$
V(C_n)=X\sqcup R\sqcup S.
$$

其中 $R$ 用来构造 absorber，$S$ 用来最后连接路径并吸收剩余顶点。关键是 $R,S$ 都要 distributed，即在每个局部区间里都有足够点。这个由 Lemma 2.3 完成，证明用 Lovász local lemma。

### Step 2: 在 $R$ 中构造 $S$-absorber

Lemma 2.4 说：如果 $R$ distributed，$S$ sufficiently sparse/distributed，那么可以在 $R$ 中找到一个 $(x,y;S)$-absorber。

构造的基本单元是 **beehive absorber**。每个 $s\in S$ 对应一个小 gadget，它有两种 spanning path：一种经过 $s$，一种绕开 $s$。把这些 beehive 串起来，就能吸收任意子集 $S'\subseteq S$。

### Step 3: 删除 absorber 后结构仍然 Dirac

设 absorber 使用了 $A\subseteq R$，把 $S\cup A$ 暂时拿走。因为这个删除集是 locally sparse，Lemma 2.5 保证剩余诱导子图仍然是稍弱一点的 Dirac subgraph of a power of a cycle。

这是非常关键的稳定性步骤：删除少量局部均匀的点，不会破坏 cycle-power 几何和最小度结构。

### Step 4: 把剩余图分解成少量路径

Lemma 2.6 是证明中最关键的组件之一：剩余的 $\alpha$-Dirac 子图有一个 spanning linear forest，而且端点 multiset locally sparse。

证明思路大致是：

1. 先证明 $\delta(G)\ge k+1$ 的子图满足 Hall 条件。
2. 用 bipartite double cover 把 Hall 条件转成 matching 结构。
3. 用 nibble / semi-random method 找 well-distributed matching。
4. 把匹配沿 cluster 顺序拼起来，得到覆盖全部顶点的路径分解。

端点 locally sparse 很重要，因为下一步要把这些端点两两连接起来；如果端点在某个短区间里过度集中，储备集 $S$ 会不够用。

### Step 5: 安排路径端点的连接顺序

Lemma 2.7 是一个纯组合排序引理。给定路径端点的配对关系，作者能安排一个环状连接顺序，使得连接所用的区间不会在任何顶点处重叠太多。

人话：不是随便把路径接起来；要选一个“沿着 cycle 不太拥挤”的接法。

### Step 6: 用 $S$ 中的点连接路径

Lemma 2.8 负责把端点对用 internally vertex-disjoint paths 连起来，内部点都来自 $S$。

证明用到 $C_n^k$ 的局部稠密性：如果两个点在 cycle 上距离不太远，那么它们在 $G$ 中有很多共同邻居。具体地，Lemma 3.1 证明：

$$
\operatorname{dist}_C(x,y)=d<2\alpha k
\quad\Longrightarrow\quad
|N_G(x)\cap N_G(y)|\ge 2\alpha k-d-1.
$$

这就是本文连接器的核心来源。

### Step 7: 吸收剩余点，闭合成 Hamilton 圈

路径分解和连接步骤得到一条从 $y$ 到 $x$ 的大路径，覆盖除了部分 $S$ 和 absorber 内部可调部分之外的顶点。最后用 $(x,y;S)$-absorber 选择一条从 $x$ 到 $y$ 的路径，刚好吸收没有被连接步骤使用的 $S$ 顶点。两条路径拼起来就是 Hamilton cycle。

## 技术核心

1. **局部稠密替代全局扩展。**  
   $C_n^k$ 不是全局 expander，但局部窗口内很稠密。作者把所有操作设计成沿着 cycle 的局部区间进行。

2. **Distributed / locally sparse bookkeeping.**  
   整个证明反复维护“储备集足够均匀、端点集不太集中”。这类似 sparse expander 里维护 connector reservoir。

3. **Beehive absorber.**  
   吸收器不是依赖随机边，而是依赖 $C_n^k$ 的强局部共同邻域。

4. **Path decomposition 是瓶颈。**  
   Lemma 2.6 要从 Dirac 条件中提取 spanning linear forest，并控制端点分布。这一步最技术。

## 与我的研究的关联

- 和 expander Hamiltonicity 一样，它也是“局部或伪随机结构 + 吸收法 + connector”的组合。
- 这里的 host graph 是 locally dense but globally sparse，和 sparse expander 不同；比较二者的 absorber / connector 构造可能有启发。
- 端点 locally sparse 的控制很像 connector reservation 里防止需求集中。
- Lemma 3.1 的共同邻域下界是本文连接器的原子工具，值得和 pseudorandom graph 中的 common neighborhood / expansion 条件对照。

## 可追踪问题

> [!question] 继续追的问题
> 1. Lemma 2.6 的 path decomposition 是否可以在一般 locally dense graph 中成立？
> 2. $C_n^k$ 的局部区间能否替换成高维几何图中的 ball？
> 3. Beehive absorber 和 expander 中的 roll-back / reserved connector absorber 是否有统一模板？
> 4. Conjecture 1.1 的 exact 版本，即最小度 $k+1$，困难到底在哪一步？
> 5. 对 $C_n^k$ 的随机稀疏子图，是否能同时保持 local resilience 和 Hamiltonicity？

## 下一步精读

- Section 2.2：proof sketch，先把 Lemma 2.3--2.8 的依赖关系画出来。
- Section 5：beehive absorber 的构造，最值得学习。
- Sections 6--7：Lemma 2.6 的 path decomposition，技术最重，但可能最有方法价值。

## 日记

这篇文章的核心不是把 $C_n^k$ 当作 expander，而是充分利用它“局部像完全图、全局像稀疏图”的一维几何。证明里的 distributed / locally sparse 语言很适合描述 reservoir 和 endpoint demand 的平衡。对我来说，最值得借鉴的是：在没有全局扩展的情况下，如何用局部共同邻域和排序引理来完成 connector 任务。


