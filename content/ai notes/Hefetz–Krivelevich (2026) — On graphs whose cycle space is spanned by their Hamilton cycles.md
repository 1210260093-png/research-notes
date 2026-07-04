---
title: "On graphs whose cycle space is spanned by their Hamilton cycles"
authors: "Dan Hefetz, Michael Krivelevich"
year: 2026
arxiv: "2606.05835"
tags:
  - Hamilton cycles
  - cycle space
  - parity switcher
  - Chvatal-Erdos
  - bipartite independence number
---

## 讨论定位

这篇文章研究什么时候 Hamilton cycles 张成整个 cycle space：

$$
\mathcal C_n(G)=\mathcal C(G).
$$

这里 $\mathcal C(G)$ 是 $G$ 的 cycle space，也就是所有圈的边集向量在 $\mathbb F_2$ 上张成的空间；$\mathcal C_n(G)$ 是 Hamilton cycles 张成的子空间。

由于 Hamilton cycle 的长度是 $n$，若 $n$ 为偶且图非二部，会有明显 parity obstruction；因此文章的非二部结论都要求 $n$ 为奇数，二部图则单独处理。

## 总体证明框架

这篇文章采用 Christoph--Nenadov--Petrova 的 parity switcher 框架。

反设 $\mathcal C_n(G)\ne \mathcal C(G)$。由框架可得到一个 spanning subgraph $R\subseteq G$，满足每条 Hamilton cycle 都含偶数条 $R$-边，并且 $R$ 对每个 cut 至少占一半边。之后要构造一个小型奇偶开关，使得可以把某条 Hamilton cycle 经过 $R$ 的奇偶性翻转，从而矛盾。

实际需要完成三步：

1. 找一条特殊短偶圈 $C=(v_1,\dots,v_{2r},v_1)$，使得 $|E(C)\setminus E(R)|$ 为奇数；
2. 为每个 $2\le i\le r$，找点不交 path $P_i$，连接 $v_i$ 和 $v_{2r-i+2}$，从而把 $C$ 扩成 parity switcher；
3. 在删去 switcher 内部点后的剩余图中，找一条从 $v_1$ 到 $v_{r+1}$ 的 Hamilton path。

这份笔记只记录每个条件下作者如何完成这三步。

## 公共工具：Lemma 3.6 找短 parity-defect 偶圈

Lemma 3.6 负责完成第 3 节几个结果中的第一步。它的输入是

$$
\kappa(G)\ge 12\alpha(G)+8
$$

以及由反设得到的 $R$。结论是存在一条偶圈

$$
C=(v_1,\dots,v_{2r},v_1)
$$

使得

$$
|E(C)\setminus E(R)|
$$

为奇数，并且

$$
|C|\le 10\alpha(G)+8.
$$

因为 $C$ 是偶圈，$|E(C)\setminus E(R)|$ 为奇数等价于 $|E(C)\cap E(R)|$ 也是奇数。这样的圈就是后面 parity switcher 的核心：它提供了一个可以翻转 Hamilton cycle 经过 $R$ 的奇偶性的局部结构。

证明可以理解成两件事：

1. 先证明这样的偶圈一定存在；
2. 再证明它可以选得很短，长度只依赖于 $\alpha(G)$。

### 先证 parity-defect 偶圈存在

**Case 1  $R$ 是二部图**   

设它的二部划分为 $A\cup B$。由 Lemma 2.1 的性质，$R\ne G[A,B]$，所以 $G$ 中存在一条跨边

$$
xy\in E(G)\setminus E(R).
$$

由于 $x,y$ 位于 $R$ 的两侧，在 $R$ 中连接 $x,y$ 的 path 必为奇长。把这条 $R$-path 加上非 $R$ 边 $xy$，得到一条偶圈，并且圈上恰好有一条边不属于 $R$。这正是想要的 parity defect。

**Case 2  $R$ 不是二部图**

则 $R$ 中有奇圈。先取 $R$ 中一条最短奇圈。这个奇圈本身不是目标，因为目标必须是偶圈；但它提供了一个“奇性来源”。

若这条奇圈很长，则可以在其上隔点选出超过 $\alpha(G)$ 个点，于是其中两点在 $G$ 中相邻，形成一条 chord。若这条 chord 不在 $R$，那么 chord 加上奇圈上的某一段就可以切出一个偶圈，并且非 $R$ 边数为奇数。

剩下的困难是：最短奇圈本身不直接给出目标，或者 chord 没有立刻给出目标。作者于是看奇圈外部 $U$ 上的 $(G\setminus R)[U]$。

若 $(G\setminus R)[U]$ 也含有奇圈，那么现在有两个奇性来源：一个在 $R$ 里，一个在 $G\setminus R$ 里。利用图的连通性把二者接起来，再分别选择两条奇圈上的合适弧段，就能拼出一条偶圈，并使其相对于 $R$ 的边数奇偶性满足要求。

若 $(G\setminus R)[U]$ 是二部图，则外部没有可用的非 $R$ 奇圈。作者改用 Hamilton-connectedness：先在 $R[U]$ 中找一条较长 path，再在剩余图中用 Hamilton path 接回去形成一个 Hamilton cycle。由于所有 Hamilton cycle 都含偶数条 $R$-边，这个大圈带有固定的 parity 约束。然后在那条长 path 上利用 $\alpha(G)$ 找 chord，将大圈切开，得到目标偶圈。

### 再用 $\alpha(G)$ 把圈切短

前面只证明了目标偶圈存在，但它可能很长。于是取一条满足条件的最短目标圈 $C$。如果 $|C|$ 仍然太大，就在 $C$ 的偶数下标顶点中分出几块，每块大小都超过 $\alpha(G)$。每块内部必有 chord。

拿到多条 chord 后，用抽屉原理保证至少两条 chord 在两个方面类型一致：

- chord 是否属于 $R$；
- chord 对应的圈上弧段含 $R$-边数的奇偶性。

于是可以用这两条 chord 替换掉原圈上的两段弧，得到一条更短的偶圈，而且仍保持 $|E(C)\setminus E(R)|$ 为奇数。这与 $C$ 的最短性矛盾。

所以这条 lemma 的核心消化版是：作者不是直接找短偶圈，而是先证明图里一定存在某个能改变 $R$-parity 的偶圈；然后用 independence number 小这一事实反复制造 chord，说明任何太长的候选圈都可以被切短。因此最终得到一个长度 $O(\alpha(G))$ 的 parity-defect 偶圈。
