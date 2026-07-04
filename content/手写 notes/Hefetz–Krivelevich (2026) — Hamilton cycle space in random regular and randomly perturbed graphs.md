---
authors: Dan Hefetz, Michael Krivelevich
year: 2025
arxiv: "2507.04488"
pages: 17
subjects: math.CO
tags:
  - hamiltonicity
  - cycle_space
  - random_regular_graphs
  - randomly_perturbed_graphs
  - expanders
  - pseudorandom_graphs
  - parity_switcher
  - Hamilton_generated
sources:
  - "[arXiv:2507.04488](https://arxiv.org/abs/2507.04488)"
  - "[[Hefetz-etal-2025-The-Hamilton-cycle-space-of-random-regular-graphs-and-randomly-perturbed-graphs.pdf]]"
---

# Main results

>[!danger] **Theorem 1.1 (Main Theorem, odd order).**
>存在整数 $d_0$，使得对任意 $d\ge d_0$，若 $G\sim G_{n,d}$ 且 $n$ 为奇数，则 a.a.s. $C_n(G)=C(G)$。


>[!tip] **Theorem 1.2 (even order).**
>存在整数 $d_0$，使得对任意 $d\ge d_0$，若 $G\sim G_{n,d}$ 且 $n$ 为偶数，则 a.a.s. $C_{n-1}(G)=C(G)$。

这里因为偶数阶时 Hamilton 圈本身带有奇偶性障碍，所以作者改为证明长度 $n-1$ 的圈已经足以张成整个 cycle space。


>[!danger] **Theorem 1.3 (Randomly perturbed graph).**
>对任意常数 $\delta>0$，存在 $C=C(\delta)$ 使得下述成立。若 $H$ 是一个 $n$ 阶图，满足 $n$ 为奇数且 $\delta(H)\ge \delta n$，再令 $G\sim G(n,p)$ 且 $p\ge C/n$，则 a.a.s. $C_n(H\cup G)=C(H\cup G)$。


---

# Survey

| 文章 / 工具                                                               | 主要结果                                                   | 在本文中的作用                                                                        |
| --------------------------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------ |
| **Robinson–Wormald / 随机正则图 Hamiltonicity**                            | 固定 $d\ge 3$ 时，随机 $d$-正则图 a.a.s. Hamiltonian。           | 本文以 Hamiltonicity 为起点，进一步证明 Hamilton 圈生成整个 cycle space。                        |
| **Friedman Theorem + [[Spectral expander]]**                          | 随机正则图 a.a.s. 有接近最优的第二特征值，从而给出 mixing lemma。            | 支撑 Lemma 2.3，并在后续证明 large cross degree、joined in $R$、扩张性等性质时反复使用。              |
| **Christoph–Nenadov–Petrova / Hamilton space of pseudorandom graphs** | 提供 parity-switcher 这类处理 Hamilton cycle space 的方法背景。    | 本文沿用“反设得到 $R$，再构造 [[Parity-switcher]]”的证明框架。                                   |
| **Hefetz–Krivelevich, The Hamilton cycle space of random graphs**     | 处理 binomial random graph 中 Hamilton cycle space 的对应问题。 | 和本文是相邻方向：一个处理 $G(n,p)$，本文处理 random regular 和 randomly perturbed graph。         |
| **Bohman–Frieze–Martin, randomly perturbed Hamiltonicity**            | 线性最小度图加入 $G(n,C/n)$ 后 a.a.s. Hamiltonian。              | Theorem 1.3 可看作其 cycle-space 加强版：不仅 Hamiltonian，而且 Hamilton 圈张成整个 cycle space。 |
| **Draganic–Krivelevich–Nenadov, Rolling Backwards**                   | 给出稀疏扩张图中的点不交路径嵌入工具。                                    | 本文通过 [[Disjoint paths 工具]] 连接 parity-switcher 中的镜像端点。                          |



---

# Tools and Definitions

## 重要的反证假设——[[Parity-switcher]]

>[!warning] Definition 2.1 (cycle space)
对图 $G=(V,E)$，其 edge space 是 $\mathbb F_2^E$。cycle space $C(G)$ 是由所有圈的边指示向量在 $\mathbb F_2$ 上张成的子空间。更一般地，对任意 $3\le k\le |V(G)|$，记$C_k(G)$ 为所有长度为 $k$ 的圈张成的子空间。


>[!info] Reference
>其中的 key lemma 是本文证明的关建。

## 其它工具

>[!tip] **Regular Hamiltonian.**
>设 $G\sim \mathcal{G}_{n,d}$，其中 $d\ge 3$。则 $G$ 以高概率是 Hamiltonian 的。


下面这个引理是[[Spectral expander]]中的 mixing lemma 的一个直接推论，再结合[[Friedman Theorem（随机正则图的第二特征值）]]：

$\mathcal{G}_{n,d}$ 是一个 $(n,d,\lambda)$-图，并且以高概率有 $\lambda(\mathcal{G}_{n,d})\le 2\sqrt{d-1}+\varepsilon$，其中 $\varepsilon>0$ 是任意小但固定的常数。


>[!tip] **Lemma 2.3 (mixing).**
>设 $G\sim \mathcal{G}_{n,d}$，其中 $d$ 是一个充分大的常数。则以下性
>质以高概率成立：
>
>a) 对任意两个不交集合 $A,B\subseteq V(G)$，都有
>$$
>\left|e_G(A,B)-\frac{|A||B|d}{n}\right|\le 3\sqrt{d\,|A|\,|B|}.
>$$
>
>(b) 对任意集合 $A\subseteq V(G)$，都有
>$$
>\left|e_G(A)-\frac{d}{n}\binom{|A|}{2}\right|\le 3\sqrt{d}\,|A|.
>$$


---


# Lemmas and its proof outline

>[!example] **Lemma 3.1 (large cross degree).**
>设 $\varepsilon>0$ 是任意小常数，且令 $G\sim G_{n,d}$，其中 $d$ 是一个充分大的常数。则几乎必然地（a.a.s.），对任意满足 $|A|\ge \varepsilon n$ 的顶点集 $A\subseteq V(G)$，以及任意满足 $B\subseteq V(G)\setminus A$ 且 $|B|=0.59n$ 的顶点集 $B$，都存在一个顶点 $u\in A$，使得 $\deg_{G}(u,B)\ge 0.51d$。
>
>这里 $\deg_G(u,B)$ 表示：顶点 $u$ 在集合 $B$ 中的邻点个数。


>[!tip] Proof idea
>只需要应用 mixing lemma 中的第一条来估计 $e_G(A,B)$ 就可以证明该 lemma。

---

>[!example] A Partition Lemma, 详见 [[A Partition Lemma]]
设 $G=(V,E)$ 是一个有 $n$ 个顶点、最大度为 $\Delta$ 的图。设 $Y\subseteq V$ 是一个包含 $m=a+b$ 个顶点的点集，其中 $a,b$ 是正整数。假设对每个 $v\in V$ 都有 $\deg_G(v,Y)\ge \delta$。如果
>$$\Delta^2\cdot \left\lceil \frac{m}{\min\{a,b\}} \right\rceil \cdot 2 \cdot e^{1-\frac{\min\{a,b\}^2}{5m^2}\delta}<1,$$
那么存在 $Y$ 的一个划分 $Y=A\cup B$，使得以下性质成立：
>
>(1) $|A|=a$ 且 $|B|=b$；
>
>(2) 对每个 $v\in V$，都有 $\deg_G(v,A)\ge \frac{a}{3m}\deg_G(v,Y)$；
>
>(3) 对每个 $v\in V$，都有 $\deg_G(v,B)\ge \frac{b}{3m}\deg_G(v,Y)$。

---

>[!danger] **Lemma 3.3 (subgraph maintain expanding).**
>对任意 $\alpha\in[0,1)$ 和 $\delta\in(0,1]$，都存在常数 $c:=c(\alpha,\delta)$ 使得下述结论成立。设 $G\sim G_{n,d}$，其中 $d$ 是一个充分大的常数。设 $H$ 是 $G$ 的一个子图（不一定是生成子图），并且满足最小度条件 $\delta(H)\ge \delta d$。那么几乎必然地（a.a.s.），对任意边集 $F\subseteq E(H)$ 和任意顶点集 $X\subseteq V(H)$，只要 $|X|\le n/d$ 且对每个 $x\in X$ 都有 $|F\cap \partial_H(x)|\le \alpha\cdot \deg_H(x)$，就有 $|N_{H\setminus F}(X)|\ge c|X|d$。

>这里，$\partial_H(x)$ 表示图 $H$ 中与顶点 $x$ 关联的边集，$N_{H\setminus F}(X)$ 表示集合 $X$ 在图 $H\setminus F$ 中的邻集。

**Proof.**

设 $X\subseteq V(H)$ 满足 $|X|\le n/d$，并设 $F\subseteq E(H)$ 满足对每个 $x\in X$ 都有 $|F\cap \partial_H(x)|\le \alpha\deg_H(x)$，但反过来假设 $|N_{H\setminus F}(X)|<c|X|d$。由引理的前提以及 **Lemma 2.3 (mixing)** 可知，几乎必然地有

$$
|X|(1-\alpha)\delta d
\le \sum_{x\in X}\deg_{H\setminus F}(x)
\le 2e_G(X)+e_G\bigl(X,N_{H\setminus F}(X)\bigr).
$$

接下来分别估计右边两项。继续由**Lemma 2.3 (mixing)**，

$$
2e_G(X)+e_G\bigl(X,N_{H\setminus F}(X)\bigr)
\le \left(\frac{d|X|^2}{n}+6\sqrt d\,|X|\right)
+\left(\frac{d|X|\cdot c|X|d}{n}+3\sqrt{cd}\,|X|\right).
$$

由于 $|X|\le n/d$，上式进一步得到

$$
2e_G(X)+e_G\bigl(X,N_{H\setminus F}(X)\bigr)
\le |X|\bigl(1+6\sqrt d+cd+3\sqrt{cd}\bigr).
$$

于是

$$
|X|(1-\alpha)\delta d
\le |X|\bigl(1+6\sqrt d+cd+3\sqrt{cd}\bigr).
$$

但当 $d$ 取得充分大、并且相对于 $\delta$ 和 $1-\alpha$ 而言 $c$ 取得充分小时，上述不等式不可能成立，这就得到矛盾。证毕。

#### Remark.

>[!quote] Remark
>这段证明的思路其实很简单：我们反设 $X$ 在删边后的邻集太小，即 $|N_{H\setminus F}(X)|<c|X|d$。另一方面，由于 $H$ 的最小度至少是 $\delta d$，并且在 $X$ 中每个点只删去了至多 $\alpha$ 比例的关联边，所以 $X$ 中每个点在 $H\setminus F$ 里仍至少保留了 $(1-\alpha)\delta d$ 量级的度，从而总出边数至少是 $|X|(1-\alpha)\delta d$。
>
>可如果邻集真的很小，那么这些边只能落在两类地方：一类是 $X$ 内部的边，另一类是从 $X$ 连到这个很小邻集的边。引理 4.2 告诉我们，这两部分边数都不会太大，于是总边数至多只有 $|X|(1+6\sqrt d+cd+3\sqrt{cd})$。当 $d$ 很大且 $c$ 很小时，这个上界比下界 $|X|(1-\alpha)\delta d$ 小得多，于是矛盾成立。

---

>[!example] **Lemma 3.4 (joined in R).**
>设 $G\sim G_{n,d}$，其中 $d$ 是一个充分大的常数。则几乎必然地，下述结论成立。设 $R$ 是 $G$ 的一个子图，并且对任意 $A\subseteq V(G)$ 都满足 $e_R\bigl(A,V(G)\setminus A\bigr)\ge e_G\bigl(A,V(G)\setminus A\bigr)/2$，那么，对任意两个不交的顶点集 $A,B\subseteq V(G)$，只要 $|A|=|B|=2n/5$，就有$e_R(A,B)>0$。

**Proof.**

任取两个不交的点集 $A,B\subseteq V(G)$，满足 $|A|=|B|=2n/5$，并令 $D=V(G)\setminus (A\cup B)$。于是 $|D|=n/5$。

由**Lemma 2.3 (mixing)**，几乎必然地有
$$
e_G\bigl(A,V(G)\setminus A\bigr)\ge \frac{d|A||V(G)\setminus A|}{n}-3\sqrt{d|A||V(G)\setminus A|}\ge \frac{6}{25}dn-2\sqrt d\,n,
$$
并且
$$
e_G(A,D)\le \frac{d|A||D|}{n}+3\sqrt{d|A||D|}\le \frac{2}{25}dn+\sqrt d\,n.
$$

把这两个估计合起来，得到
$$
e_R(A,B)=e_R\bigl(A,V(G)\setminus A\bigr)-e_R(A,D).
$$
由假设，对任意割 $A, V(G)\setminus A$，都有 $e_R\bigl(A,V(G)\setminus A\bigr)\ge e_G\bigl(A,V(G)\setminus A\bigr)/2$；另一方面，显然 $e_R(A,D)\le e_G(A,D)$。因此
$$
e_R(A,B)\ge e_G\bigl(A,V(G)\setminus A\bigr)/2-e_G(A,D).
$$
再代入上面的两个界，
$$
e_R(A,B)\ge \left(\frac{3}{25}dn-\sqrt d\,n\right)-\left(\frac{2}{25}dn+\sqrt d\,n\right).
$$
当 $d$ 充分大时，右边严格大于 $0$，于是 $e_R(A,B)>0$。证毕。

>[!quote] Remark
>这段证明的核心想法是：
>先看从 $A$ 向外发出的所有边。因为 $|A|=2n/5$，所以在随机图 $G$ 里，$A$ 与外部 $V(G)\setminus A$ 之间应该有大约 $\frac{6}{25}dn$ 条边；而 $A$ 与那个“剩下的中间部分” $D$ 之间只有大约 $\frac{2}{25}dn$ 条边。现在由于 $R$ 至少保留了每个割的一半边，所以 $A$ 向外在 $R$ 中仍至少有大约 $\frac{3}{25}dn$ 条边；再减去其中可能落到 $D$ 里的边，仍然还会剩下一些边连到 $B$。因此 $A$ 和 $B$ 之间不可能完全没有边。

---
  
>[!danger] **Lemma 3.5 (short R-path).**
>设 $G\sim G_{n,d}$，其中 $d$ 是一个充分大的常数。则几乎必然地，下述结论成立。设 $R$ 是 $G$ 的一个子图，并且其最小度满足 $\delta(R)\ge d/2$。那么存在一个绝对常数 $K$，使得对任意满足下列条件的点集 $S\subseteq V(G)$：  
>
>- $|S|=o(n)$；  
>- 对每个顶点 $u\in V(G)$，都有 $\deg_G(u,S)\le d/100$，  
  >
>以及对任意两个顶点 $x,y\in V(G)\setminus S$，在图 $R\setminus S$ 中都存在一条连接 $x$ 和 $y$ 的路，其长度至多为 $K\log n/\log d$。

**Proof.**

任取一个点集 $S\subseteq V(G)$，满足 $|S|=o(n)$，并且对每个 $u\in V(G)$ 都有 $\deg_G(u,S)\le d/100$。又由于引理假设给出 $\delta(R)\ge d/2$，所以对每个 $x\in V(G)\setminus S$，都有$\deg_{R\setminus S}(x)\ge 0.49d$。

对每个 $x\in V(G)\setminus S$ 和每个非负整数 $i$，记$N^i_{R\setminus S}(x)=\{u\in V(G)\setminus S:\operatorname{dist}_{R\setminus S}(x,u)\le i\}$。

现在从任意一个顶点 $x\in V(G)\setminus S$ 出发。反复应用 **Lemma 3.3 (subgraph maintain expanding)**，并取其中 $\alpha=0$、$H=R\setminus S$，可知几乎必然地存在某个整数 $t\le \dfrac{\log n}{\log(cd)}$，这里 $c:=c(0,0.49)$ 是 **Lemma 3.3** 保证存在的常数，使得$|N^t_{R\setminus S}(x)|\ge cn$。

我们声称，几乎必然地还有 $|N^{t+1}_{R\setminus S}(x)|\ge 2n/5$。

事实上，若不然，则可以在$V(G)\setminus \bigl(S\cup N^{t+1}_{R\setminus S}(x)\bigr)$中取到一个大小为 $0.59n$ 的集合 $B$，并且
$E_{R\setminus S}\bigl(N^t_{R\setminus S}(x),B\bigr)=\varnothing$。

于是，对每个 $v\in N^t_{R\setminus S}(x)$，由于它在 $R\setminus S$ 中与 $B$ 没有邻边，又因为 $\deg_G(v,S)\le d/100$，且 $R$ 的最小度至少为 $d/2$，便得到
$\deg_G(v,B)\le 0.51d$。

但这与 **Lemma 3.1 (large cross degree)** 矛盾，因为 **Lemma 3.1** 表明：对大小至少为 $\varepsilon n$ 的集合，总能找到一个点对任意大小为 $0.59n$ 的外部集合 $B$ 有至少 $0.51d$ 个邻点。这里 $N^t_{R\setminus S}(x)$ 的大小至少为 $cn$，正好可取 $\varepsilon=c$。因此上述坏情况发生的概率是 $o(1)$。

于是，对任意两个顶点 $x,y\in V(G)\setminus S$，上面的论证都说明几乎必然地 $|N^{t+1}_{R\setminus S}(x)|\ge 2n/5$ and $|N^{t+1}_{R\setminus S}(y)|\ge 2n/5$。

如果 $N^{t+1}_{R\setminus S}(x)\cap N^{t+1}_{R\setminus S}(y)\ne\varnothing$，那么在 $R\setminus S$ 中，$x$ 与 $y$ 之间就有一条长度至多 $2t+2$ 的路，因此其长度小于 $3\dfrac{\log n}{\log(cd)}$。否则，这两个集合不交，且都至少有 $2n/5$ 个点。由 **Lemma 3.4 (joined in R)** 可知，几乎必然地它们之间在 $R$ 中有一条边，于是在 $R\setminus S$ 中也能把从 $x$ 到该边一端的路、这条边、以及从另一端到 $y$ 的路拼接起来，得到一条长度至多 $2t+3$ 的路。特别地，$2t+3\le 3\dfrac{\log n}{\log(cd)}$。

因此，对任意两个顶点 $x,y\in V(G)\setminus S$，在 $R\setminus S$ 中都存在一条长度至多常数倍 $\dfrac{\log n}{\log d}$ 的路相连。证毕。

>[!quote] Remark
>这段证明的主线很清楚：先利用Lemma 3.3 反复做“球扩张”，说明从任意一点 $x$ 出发，半径大约为 $\log n/\log d$ 的邻域很快就能长到线性大小 $cn$。接着用 Lemma 3.1 把这个线性大小的集合进一步推进到大小至少 $2n/5$：否则就会出现一个大小为 $0.59n$ 的集合 $B$，使得这个大邻域里的每个点对 $B$ 的邻接都太少，这与 Lemma 3.1 冲突。
>
>这样一来，从 $x$ 和 $y$ 出发都能在很小半径内长出两个大小至少为 $2n/5$ 的大集合。若它们相交，就直接得到一条短路；若它们不交，就用 Lemma 3.4 保证这两个大集合之间必有边，从而也得到一条短路。



---

>[!warning] **Lemma 3.6 (neighborhoods).**
>设 $G \sim \mathcal{G}_{n,d}$，其中 $d \ge 3$ 是一个整数。则几乎必然地，对 $G$ 中任意一条顶点数至多为 $\log n / \log d$ 的路径 $P$，以及
>1. 任意顶点 $u \in V(G)\setminus V(P)$，都有 $\deg_G(u, V(P)) \le 3$；
>2. 任意顶点 $u \in V(P)$，都有 $\deg_G(u, V(P)) \le 8$。

我们的证明要用到下面这个关于随机正则图边分布的已知结果。为叙述这个结果，我们用 $\mathcal{G}_{n,d}^*$ 表示顶点集为 $[n]$ 的随机 $d$-正则多重图的均匀概率空间。  

>[!example] **Configuration model estimate.**
>设 $d\ge 3$ 是一个整数，$E_0$ 是 $[n]$ 中若干对元素组成的集合，且 $m\le dn/4$。则  
>$$  
>\mathbb{P}\bigl(E_0\subseteq E(\mathcal{G}_{n,d}^*)\bigr)\le \left(\frac{2d}{n}\right)^m.  
>$$

**Proof of Lemma 3.6**
  
众所周知，如果某个性质在 $\mathcal{G}_{n,d}^*$ 中几乎必然成立，那么它在 $\mathcal{G}_{n,d}$ 中也几乎必然成立。因此，只需对 $\mathcal{G}_{n,d}^*$ 证明对应结论。

设 $G^*\sim \mathcal{G}_{n,d}^*$。取 $G^*$ 中一个长度为 $k\le \log n/\log d$ 的顶点序列 $v_1,\dots,v_k$，再取任意顶点 $u\in V(G^*)\setminus \{v_1,\dots,v_k\}$。设 $B$ 是 $\{v_1,\dots,v_k\}$ 的任意一个大小为 $4$ 的子集。令 $E_0=\{\{v_i,v_{i+1}\}:1\le i\le k-1\}\cup \{\{u,z\}:z\in B\}$。

记 $m=|E_0|$，注意到 $m=k+3$。由 **Configuration model estimate** 可得  
$$
\mathbb{P}\bigl(E_0\subseteq E(G^*)\bigr)\le \left(\frac{2d}{n}\right)^m=\left(\frac{2d}{n}\right)^{k+3}.  
$$
现在对所有可能的 $k$、所有序列 $v_1,\dots,v_k$、所有大小为 $4$ 的集合 $B$，以及所有顶点 $u\in V(G^*)\setminus \{v_1,\dots,v_k\}$ 作并合界，可知：存在一条顶点数至多为 $\log n/\log d$ 的路径 $P$，以及一个顶点 $u\in V(G^*)\setminus V(P)$，使得 $\deg_{G^*}(u,V(P))\ge 4$ 的概率至多为  
$$  
\sum_{k=4}^{\log n/\log d} n^k \binom{k}{4} n \left(\frac{2d}{n}\right)^{k+3}  
\le (\log n)^5 (2d)^{\log n/\log d+3} n^{-2}  
= o(1).  
$$
因此，几乎必然地，对任意顶点数至多为 $\log n/\log d$ 的路径 $P$，以及任意顶点 $u\in V(G)\setminus V(P)$，都有 $\deg_G(u,V(P))\le 3$。

**对于 2.** 固定 $G$ 中一条路径 $P=(v_1,\dots,v_k)$，其中 $k\le \log n/\log d$，并固定某个 $1\le i\le k$。为方便起见，设 $i\notin \{1,k\}$（其余情形类似，而且实际上更容易）。于是  $P$ 可写成  $P=P_1v_{i-1}v_iv_{i+1}P_2$，其中 $P_1$ 是（可能为空的）路径 $(v_1,\dots,v_{i-2})$，而 $P_2$ 是路径 $(v_{i+2},\dots,v_k)$。  
  
由 1. 可知，几乎必然地，$\deg_G(v_i,V(P_1))\le 3$ 且 $\deg_G(v_i,V(P_2))\le 3$。再结合它在路径 $P$ 中的两个邻点，即 $v_{i-1}$ 和 $v_{i+1}$，便得到所需估计 $\deg_G(v_i,V(P))\le 8$。

---


>[!danger] **Lemma 3.7 (disjoint paths).** 详见 [[Disjoint paths 工具]]
>设图 $G$ 具有性质 $P_\alpha(n',d')$，其中 $3\le d'<n'$。再设对任意两个不交点集 $A,B\subseteq V(G)$，只要 $|A|,|B|\ge n'(d'-1)/16$，就有 $e_G(A,B)>0$。
>设 $S\subseteq V(G)$ 是一个点集，并且对任意顶点 $x\in V(G)$ 都有 $|N_G(x)\cap S|\le \beta\cdot \deg_G(x)$。再设 $a_1,\dots,a_t,b_1,\dots,b_t$ 是 $S$ 中的 $2t$ 个顶点，其中 $t\le \dfrac{d'n'\log d'}{15\log n'}$。若 $\beta<2\alpha-1$，则 $G$ 中存在两两点不交的路径 $P_1,\dots,P_t$，使得对每个 $1\le i\le t$，路径 $P_i$ 的两个端点分别是 $a_i$ 和 $b_i$。


其中 定义如下：

**Definition.** 

>[!example] 性质 $P_\alpha(n',d')$
设图 $G=(V,E)$。若对任意满足 $|X|\le n'$ 的点集 $X\subseteq V$，以及任意边集 $F\subseteq E$，只要对每个 $x\in X$ 都有 $|F\cap \partial_G(x)|\le \alpha\cdot \deg_G(x)$ 都有$|N_{G\setminus F}(X)|\ge 2d'|X|$，则称图 $G$ 具有性质 $P_\alpha(n',d')$。

以上结论来自 [[手写 notes/Draganic–Krivelevich–Nenadov (2022) — Rolling Backwards — Embedding Problems in Sparse Expanders]]。不过，原定理还带有一个我们这里不需要的算法性部分。因此，我们在这里把它重新表述成一个更适合当前用途的较弱版本。

---


# Proof of Main Theorem

首先固定随机正则图的基本性质：

设 $G\sim \mathcal{G}_{n,d}$，其中 $d$ 是一个充分大的常数。反设 $\mathcal{C}_n(G)\ne \mathcal{C}(G)$。

因为下列事件都以 $o(1)$ 的概率失效，所以我们假设 $G$ 都满足：
-  **Lemma 3.1 (large cross degree)**
-  **Lemma 2.3 (mixing lemma)**
-  令 $R$ 如 [[Parity-switcher]] 的前提中所述。
-  **Lemma 3.5 (short R-path)**

>[!danger] **Claim.  (even short cycle)**
> $(G,R)$ 中存在一个理想的偶圈 $C$ 以及常数 $K$ ，其满足以下性质:
>   1.  $|C|$ 是偶数，且 $|E(C)\setminus E(R)|=1$；  
>   2.  $|C|\le K\dfrac{\log n}{\log d}$；  
>   3. 对每个 $u\in V(C)$，都有 $\deg_G(u,V(C))\le K$；  
>   4. 对每个 $u\in V(G)\setminus V(C)$，都有 $\deg_G(u,V(C))\le K$。  

## Proof of Claim

我们分两种情形讨论。  
### Case 1  $R$ 是二部图

设 $A\cup B$ 是 $R$ 的一个二部划分。由于引理假设中对任意划分 $V(G)=A\cup B$ 都有 $R\ne G[A,B]$，所以存在顶点 $x\in A$ 和 $y\in B$，使得 $xy\in E(G)\setminus E(R)$。

由 **Lemma 3.5 (short path lemma)** 可知，在 $R$ 中存在一条连接 $x,y$ 的路，其长度 $\ell\le K'\dfrac{\log n}{\log d}$，其中 $K'$ 是一个绝对常数。由于 $R$ 是二部图，$\ell$ 必为奇数。因此，将这条路与边 $xy$ 合起来，就得到一个满足性质 (1) 和 (2) 的圈 $C$。  
  
令 $r=(\ell+1)\dfrac{\log d}{\log n}=\Theta(1)$，并令 $K=\max\{K',8r\}$。把圈 $C$ 分成 $r$ 段首尾相接、两两点不交的路 $P_1,\dots,P_r$，每一段的顶点数都至多为 $\dfrac{\log n}{\log d}$。由**Lemma 3.6 (neighborhoods)** 可知:
> 对每个 $u\in V(G)\setminus V(C)$，都有 $\deg_G(u,V(C))\le 3r$，从而得到性质 (4)，对每个 $u\in V(C)$，都有 $\deg_G(u,V(C))\le 8r$，从而得到性质 (3)。  
  
### Case 2  $R$ 不是二分图

设 $C'=(x_1,\dots,x_{2t-1},x_1)$ 是 $R$ 中一个最短奇圈。注意到 $|C'|\le 3K'\dfrac{\log n}{\log d}$，其中 $K'$ 是 **Lemma 3.5 (short path)** 所保证存在的常数。事实上，若反设 $|C'|>3K'\dfrac{\log n}{\log d}$，则由 **Lemma 3.5** 可知，在 $R$ 中存在一条连接 $x_1$ 和 $x_t$ 的路 $P$，其长度至多为 $K'\dfrac{\log n}{\log d}$。但是，$P\cup C'$ 中会包含一个比 $C'$ 更短的奇圈，这与 $C'$ 的最短性矛盾。  
  
由于引理假设中还有 $R\ne G$，所以存在一条边 $xy\in E(G)\setminus E(R)$。我们声称，存在一个顶点 $u\in V(C')$，使得在图 $(R\setminus (V(C')\cup\{y\}))\cup\{x,u\}$ 中，存在一条从 $x$ 到 $u$ 的路 $P_x$，其长度至多为 $K'\dfrac{\log n}{\log d}$。和前一种情形类似，由于 $|C'|\le 3K'\dfrac{\log n}{\log d}$，存在常数 $K''$，使得对每个 $w\in V(G)$ 都有 $\deg_G(w,V(C')\cup\{y\})\le K''$。于是所需的路 $P_x$ 存在。  
  
类似地，也可证明存在一条路 $P_y$，它位于 $(R\setminus (V(C')\cup V(P_x)))\cup\{y,v\}$ 中，连接 $y$ 和某个顶点 $v\in V(C')\setminus\{u\}$，并且其长度至多为 $K'\dfrac{\log n}{\log d}$。  
  
最后把路径 $uP_xxyP_yv$（其中恰好只有一条边属于 $E(G)\setminus E(R)$）与 $C'$ 中连接 $u,v$ 的两条路中的一条合并起来，就得到一个圈 $C$，它满足性质。

## 分块

由上述 Claim 我们选取偶圈 $C=(v_1,\dots,v_{2k})$，并且把 $Y:=V(G)\setminus V(C)$ 划分成两个集合，使得每个顶点在这两个集合中都各有很多邻点：

由 **Claim** 中的性质 (2)(3)(4)，我们可以将 **Lemma 3.2 (partition Lemma)** 应用于 $G$ 和 $Y$，从而得到一个集合 $A\subseteq Y$，其大小为 $n/2$ 以及一个集合 $B:=V(G)\setminus A$ 使得对每个 $u\in V(G)$ 都有 $\deg_G(u,A)\ge d/9$ and $\deg_G(u,B)\ge d/9$。

令 $G_1$ 为由 $G[B]$ 通过删去顶点 $v_1$、$v_{k+1}$ 以及圈 $C$ 的所有边（但不删去 $C$ 的其他顶点）得到的图；注意到
$\delta(G_1)\ge d/9-4\ge d/10$。

于是由 **Lemma 3.3 (subgraph maintain expanding)** 可知，$G_1$ 满足性质 $P_{2/3}(n/d,cd/2)$ 其中
$c:=c(2/3,1/10)$ 是 **Lemma 3.3** 所保证存在的常数。此外，由 **Lemma 2.3 (mixing Lemma)** 可知，$V(G_1)$ 的任意两个不交子集，只要它们的大小都至少为 $cn/40$，则 $G_1$ 在这两个子集之间都有一条边。

令 $S=\{v_2,\dots,v_k,v_{k+2},\dots,v_{2k}\}$，注意到由 **Claim** 的性质 (3)(4)，并结合我们关于 $d$ 足够大的假设，对任意顶点 $x\in V(G_1)$ 都有$|N_{G_1}(x)\cap S|\le d/100$。

## 连路

因此，由 **Lemma 3.7 (disjoint paths)** 可知，$G_1$ 存在两两顶点不交的路径
$P_2,\dots,P_k$，使得对每个 $2\le i\le k$，路径 $P_i$ 的端点分别是 $v_i$ 和 $v_{2k-i+2}$。

最后令
$$
W=\bigl(\{v_1,\dots,v_{2k}\}\cup V(P_2)\cup \cdots \cup V(P_k)\bigr)\setminus \{v_1,v_{k+1}\},
$$
并令$G_2=G[V(G)\setminus W]$。由于 $A\subseteq V(G)\setminus W$，可得$\delta(G_2)\ge d/9$。

因此，由 **Lemma 2.3 (mixing)** 和 **Lemma 3.3 (subgraph maintain expanding)**，以及我们关于 $d$ 足够大的假设，可知 $G_2$ 是一个 $c'$-扩张图，其中 $c'$ 是一个充分大的常数，如 [[Draganić–Montgomery–Munhá Correia–Pokrovskiy–Sudakov (2024) — Hamiltonicity of expanders]] 所要求的那样，于是 $G_2$ 存在一条 Hamilton 路，其端点是 $v_1$ 和 $v_{k+1}$。

---

#  Remarks

- 是否可以把这种 parity-switcher 方法推广到更一般的 long cycle space 问题？
- 对于伪随机图，是否存在一个更结构性的充分条件，直接推出 $C_n(G)=C(G)$ 而不必回到随机模型？
- 这里的 expander 输入是否能用我更熟悉的 [[C-expander]] 语言重写？
