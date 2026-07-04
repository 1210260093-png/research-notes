---
authors: Noga Alon, Michael Krivelevich, Benny Sudakov
year: 2007
arxiv: "0706.4100"
pages: 14
subjects: math.CO
tags:
  - pseudorandom_graphs
  - random_graphs
  - bounded_degree_trees
  - expanders
  - embedding
  - spanning_trees
sources:
  - "[arXiv:0706.4100](https://arxiv.org/abs/0706.4100)"
  - "[[Alon-etal-2007-Embedding-nearly-spanning-bounded-degree-trees.pdf]]"
---




## Main results

### Theorem 1 (Random graph)
If $D\ge 2$ and $0<\varepsilon<1/2$, then there exists $c=c(D,\varepsilon)$ such that a.a.s. 
$G(n,c/n)$ contains every tree $T$ with $|T|=(1-\varepsilon)n$ and $\Delta(T)\le D$.

### Theorem 2 ($(n,d,\lambda)$-graph)
If $G$ is an $(n,d,\lambda)$-graph and
$$
\frac d\lambda \ge \frac{160 d^{2.5}\log(2/\varepsilon)}{\varepsilon},
$$
then $G$ contains every tree $T$ with $(1-\varepsilon)n$ vertices and $\Delta(T)\le D$.


## Lemmas  
在上述随机图和伪随机图中提取一个 expanding 性质：
### Definition $(\alpha,c)$-expander 
An $(\alpha,c)$-expander means that every set $X$ with $|X|\le \alpha |V(G)|$ satisfies
$$
|\Gamma_G(X)|\ge c|X|.
$$
This is only used here as a local expansion notion; for my purposes, the more relevant notion is [[C-expander]].


### Key lemma
Let $d\ge 2$ and $0<\varepsilon<1/2$. Let $G=(V,E)$ be a graph on $n$ vertices with minimum degree $\delta=\delta(G)$ and maximum degree $\Delta=\Delta(G)$. Assume that:

1. $n \ge \dfrac{480d^3\log(2/\varepsilon)}{\varepsilon}$.

2. $\Delta^2 \le \dfrac{1}{K} e^{\delta/(8K)-1}$, where
   $$
   K=\frac{20d^2\log(2/\varepsilon)}{\varepsilon}.
   $$

3. Every induced subgraph $G_0$ of $G$ with minimum degree at least
   $$
   \frac{\varepsilon \delta}{40d^2\log(2/\varepsilon)}
   $$
   is a $\left(\frac{1}{2d+2},\, d+1\right)$-expander.

Then $G$ contains a copy of every tree $T$ on at most $(1-\varepsilon)n$ vertices with maximum degree at most $d$.

三个条件分别是：size 足够大，几乎正则，local expansion. 
GPT 认为第二条的设计很可能来自 [[LLL]]。
## Proof outline

### Proof of key lemma
#### 准备工作
- 先把要嵌入的树 T 划分为一些子树，$T_1,T_2,\dots,T_s$满足$s =O(d^2)$， 并且每个子树都只通过一条边连到之前（下标）的某棵树。
- 再通过 [[LLL]] ，（通过随机方法，依正概率可以）取 s 个不交点集$S_1,S_2,\dots,S_s$ 使得 G 中所有点都在 $S_i$ 中保持最小度。在后续使用中，$S_i$ 的作用是一个内核，用来保证任何合适的包含它的较大点集所诱导子图仍具有足够大的最小度。
- 实际上我们每次嵌入的不只是 $T_i$ ，而是它以及它在后续子树中的领居（也就是后续树的 root），也不是将 $T_i$  嵌入 $S_i$ 而是上文提到的更大的子图。
- 每次嵌入都是在引用[[Friedman–Pippenger () — expanders contain small bounded-degree trees]]
#### 嵌入
假设已经嵌入了前 i-1 个子树，现在嵌入第 i 个。因为该子树的 root 节点已经在之前被嵌入了，现在我们需要嵌入其余点。任意选取一个点集 $U_i$ 满足以下条件：
- $|U_i|=\Theta(|V(T_i)|\,d)$
- $S_i \subseteq U_i$
- 其他 $S_j$ 与$U_i$ 不交
- 刚才的 root 节点在$U_i$中
- 允许 $U_i$ 与 $U_j$ 有交点，但是要保持内核不交。该集合在一次嵌入结束后实际上就被“遗忘”了
---
由于 $S_i$ 是 $U_i$ 的内核，所以 $G_0=G[U_i]$ 有较大的最小度，key lemma 的第三条（local expansion）告诉我们 $G_0$ 内部具有强的扩展性。于是由[[Friedman–Pippenger () — expanders contain small bounded-degree trees]]的一个改版，可以定向的把 $T_i$ 以及其在后续子树中的领居，嵌入到 $G_0$ 中，保持把根节点打到刚才的点。

这样归纳地做直到完全嵌入树 $T$。

#### Remark
- 感觉这里最重要的是设计数量：要把取的内核大小设计好，以保证后续取的 induced subgraph 的最小度。也就是要适配[[Friedman–Pippenger () — expanders contain small bounded-degree trees]]
- 因为嵌入的树是 almost spanning，所以我们在把树划分成小块后实际上就是在指定子图里嵌入一个更小（比该子图的 size 远小）的子树。
### Proof of Theorem 2
由 expander mixing lemma，我们不难验证 key lemma 中的第三条成立。反证假设其不成立，则存在 induced subgraph $G_0$满足上述最小度条
件但是不是$\left(\frac{1}{2d+2},\, d+1\right)$-expander。于是存在点集 $X\subseteq G_0$其领居集$\Gamma_{G_0}(X)$不够大，分别考虑$e(X,\Gamma_{G_0}(X))$ 以及 $e(X,G_0\setminus(X\cup \Gamma_{G_0}(X)))$即可。

### Proof of Theorem 1
整个证明分两步：  
0. 先用 [[Chernoff Bound]] 得到这两个基本随机图性质：  
- 两个足够大的不交点集之间，边数与期望 $p|A||B|$ 同数量级；  
- 一个较小点集内部，不会有过多边。 

1. 证明：在随机图 $G(n,p)$ 中提取一个大的子图 $G^*$，使它满足：  
- 顶点数仍然接近 $n$；  
- 所有点的度都落在 $[D,10D]$ 之间；  
- 任意最小度足够大的 induced subgraph 都有局部扩张性。

2. 再验证 $G^*$ 满足前面的 key lemma 的条件，从而推出 Theorem 1。

--- 

##### cleaning，得到度数控制  
  
先删掉度数过大的点，再不断删掉度数过小的点。  
  
这里上述来自[[Chernoff Bound]]的随机图性质可以保证：  
  
- 度数过大的点不可能太多，否则某个较小集合内部或它与外界之间会出现异常多的边；  
- 度数过小的点也不可能删掉太多，否则会出现两个较大的集合之间边数异常少。  
  
因此最后留下来的子图 $G^*$ 仍然有至少 $(1-\theta)n$ 个点，并且满足  
$$
D\le \delta(G^*)\le \Delta(G^*)\le 10D.  
$$


##### 证明 local expansion  
  
接下来要证明：$G^*$ 的任意一个最小度足够大的 induced subgraph 都是一个  
$$
\left(\frac{1}{2d+2},d+1\right)\text{-expander}.  
$$
反设不然，则存在一个坏集合 $X$，它的邻居集过小。由于所在 induced subgraph 的最小度很大，$X$ 的很多边就只能被压缩在一个很小的区域里。  
  
这时根据 $t$ 的大小分两种情况：small 的坏结构需要单独做概率估计；而 large 的坏结构本质上是两个较大集合之间边数异常少，因此与上述的[[Chernoff Bound]]结论同一类型。 因此这样的坏集合不存在，于是所需的 local expansion 成立。  

#### 应用 key lemma
 应用 key lemma，就得到 $G^*$ 包含每棵有 $(1-\varepsilon)n \le (1-o(1))|V(G^*)|$ 个顶点、最大度有界的树。由于 $G^*\subseteq G(n,p)$，Theorem 1 也随之成立。

## Remarks

### Question
[[AKS Question—Universal of bounded spanning trees in expander]]
