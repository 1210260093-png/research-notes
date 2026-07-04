---
tags:
  - expanders
  - embedding_universality
  - roll_back
  - spanning_trees
category: theorems-tools-methods
---

## 核心想法  

**Extendable method** 的目标是：在嵌入一个大结构时，我们分步嵌入它。在此过程中始终维持一个“还可以继续安全扩展”的性质，即 [[(D,m)-extendable]]。也就是说，我们不是只关心“当前已经嵌进去了什么”，而是更关心：  
  
> 当前这部分结构，是否还保留了足够多的外部邻居与自由度，使得后面还能继续接路径、接叶子、接树，而不会把自己堵死。 

最常见的套路是：  
  
1. 先构造一个很小的 extendable 初始子图 $S$；  
2. 反复往 $S$ 上加叶子、加短树、加连接路径；  
3. 每一步都保证新得到的子图仍然 extendable；  
4. 最后把目标结构分块嵌完。 
  
对应的技术引理通常是：  
  
1. **加叶子后仍 extendable**；
2. **把一棵有界度树嵌进去后仍 extendable**；
3. **在两个指定点之间接一条给定长度的路径后仍 extendable**。
  
所以这个方法的精髓不是“找到一条路径”或“嵌入一棵树”本身，而是：  
  
> 每做完一步，系统仍然处于可继续施工的状态。 


---  

## Lemmas

### Add one edge ($P_1$)

#### Lemma 1.
`Glebov`   `Johannsen`  `Michael_Krivelevich` 
设 $d,m\in \mathbb{N}$，满足 $d\ge 3$ 且 $m\ge 1$；设 $G$ 是一个图，$S$ 是 $G$ 的一个 $(d,m)$-extendable 子图。假设每个满足 $m\le |U|\le 2m$ 的顶点集 $U\subseteq V(G)$ 都满足
$$
|N_G'(U)|\ge |S|+2dm+1.
$$
那么，对每个满足 $d_S(s)\le d-1$ 的顶点 $s\in V(S)$，都存在一个顶点 $y\in N_G(s)\setminus V(S)$，使得图 $S+sy$ 仍然是 $(d,m)$-extendable 的。



#### Corollary.
设 $d,m\in \mathbb{N}$，满足 $d\ge 3$ 且 $m\ge 1$；设 $G$ 是一个有 $n$ 个顶点的 $m$-joined 图。设 $S$ 是 $G$ 的一个 $(d,m)$-extendable 子图，并且满足
$$
|S|\le n-2dm-3m-1.
$$
那么，对每个满足 $d_S(s)\le d-1$ 的顶点 $s\in V(S)$，都存在一个顶点 $y\in N_G(s)\setminus V(S)$，使得图 $S+sy$ 是 $(d,m)$-extendable 的。

**证明.** 若 $U\subseteq V(G)$，则 $U$ 与 $V(G)\setminus (U\cup N(U))$ 之间没有边。因此，由于 $G$ 是 $m$-joined 的，若 $|U|\ge m$，则
$$
|V(G)\setminus (U\cup N(U))|<m.
$$
于是，当 $m\le |U|\le 2m$ 时，
$$
|N(U)|\ge n-|U|-m\ge n-3m\ge |S|+2dm+1.
$$
因此，对每个满足 $m\le |U|\le 2m$ 的集合 $U\subseteq V(G)$，条件 (3) 都成立。于是该推论由引理 3.3 立得。 $\square$


---

### Add a rooted tree

#### Lemma 2.

设 $d,m\in \mathbb{N}$，满足 $d\ge 3$ 且 $m\ge 1$。设 $T$ 是一棵树，其最大度至多为 $d/2$，并且包含顶点 $t\in V(T)$。设 $G$ 是一个 $m$-joined 图，并设 $R$ 是 $G$ 的一个 $(d,m)$-extendable 子图，且其最大度至多为 $d/2$。取 $v\in V(R)$，并假设
$$
|R|+|T|\le |G|-2dm-3m.
$$
那么，在图 $G-(V(R)\setminus\{v\})$ 中存在一份 $T$ 的拷贝 $S$，其中顶点 $t$ 被拷贝到 $v$，并且 $R\cup S$ 在 $G$ 中仍然是 $(d,m)$-extendable 的。

**证明：**

众所周知，任意一棵至少有两个顶点的树都至少有两个叶子。因此，我们可以不断从 $T$ 中删去不等于 $t$ 的叶子，从而得到一列树

$$
T_n = T \supset T_{n-1} \supset \cdots \supset T_1 = I(\{t\}),
$$

其中 $n = |T|$，并且对每个 $i$，$T_i$ 都是由 $T_{i-1}$ 添加入一个叶子得到的。

回忆 $v \in V(R)$。从 $S_0 := I(v)$ 出发，对每个 $2 \le i \le n$，将推论 3.5 应用于 $(d,m)$-extendable 子图 $R \cup S_{i-1}$，我们可以把 $S_{i-1}$ 扩张为 $S_i$。这里 $S_i$ 是 $T_i$ 的一个拷贝，并且它位于

$$
G - (V(R)\setminus \{v\})
$$

中；同时，$R \cup S_i$ 在 $G$ 中仍然是 $(d,m)$-extendable 的，而且 $t$ 对应到 $v$。

当这一过程完成后，取 $S = S_n$，就得到了满足该推论要求的子图。

### Add a closed path

#### Lemma 3 (roll-back) [[Roll-back]]
设 $d,m \in \mathbb{N}$ 满足 $d \ge 3$ 且 $m \ge 1$，设 $G$ 是一个图，$S$ 是 $G$ 的一个子图。进一步地，假设存在顶点 $s \in V(S)$ 和 $y \in N_G(s)\setminus V(S)$，使得图 $S+ys$ 是 $(d,m)$-extendable 的。那么 $S$ 也是 $(d,m)$-extendable 的。
#### Lemma 4
设 $d,m \in \mathbb{N}$ 满足 $d \ge 3$ 且 $m \ge 1$，设 $G$ 是一个图，且 $S$ 是 $G$ 的一个 $(d,m)$-extendable 子图。若 $s,t \in V(S)$ 满足 $d_S(s), d_S(t) \le d-1$，并且 $st \in E(G)$，那么 $S+st$ 在 $G$ 中仍是 $(d,m)$-extendable 的。


## Algorithmic Friedman-Pippenger with roll-backs.

## See also
- [[(D,m)-extendable]] — extendable 方法的底层定义
- [[Roll-back]] — 允许撤销已嵌入步骤的核心引理
- [[Reserved connector theorem]] — extendable 方法的重要应用：嵌入 sorting-network-based 连接器
- [[Friedman–Pippenger (1987) — expanders contain small bounded-degree trees]] — 方法源头

