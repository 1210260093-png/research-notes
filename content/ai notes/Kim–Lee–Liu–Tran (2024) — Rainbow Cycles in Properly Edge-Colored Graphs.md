---
type: paper
title: "Rainbow Cycles in Properly Edge-Colored Graphs"
authors:
  - Jaehoon Kim
  - Joonkyung Lee
  - Hong Liu
  - Tuan Tran
year: 2024
journal: "Combinatorica 44, 909--919"
arxiv: "2211.03291"
doi: "10.1007/s00493-024-00101-7"
date: 2026-06-24
tags:
  - rainbow-turan
  - properly-edge-colored
  - cycles
  - extremal-graph-theory
  - homomorphism-counting
  - regularization
category: papers
status: discussed
related:
  - "[[正则化]]"
  - "[[Survey - Rainbow Turan Problems for Cycles]]"
---


> [!summary] 一句话版本
> 这篇文章证明 properly edge-colored graphs 中 rainbow cycles 的两个上界：若边数至少 $32n\log^2(5n)$，则存在某个 rainbow cycle；若边数至少 $10^5k^3n^{1+1/k}$，则存在 rainbow $C_{2k}$。核心机制是：没有 rainbow $C_{2k}$ 时，所有闭 $2k$-walk 都必须退化；而所有退化闭 walk 可以通过 Cauchy--Schwarz 压到 star homomorphism count。

---

## 1. 问题定位

本文研究 rainbow Turan number：

$$
\operatorname{ex}^*(n,H),
$$

即 properly edge-colored 的 $n$ 点图中，不含 rainbow copy of $H$ 时最多有多少边。

这里：

- **properly edge-colored**：同一顶点 incident 的边颜色两两不同；
- **rainbow subgraph**：目标子图中所有边颜色互不相同。

本文关注两条路线：

| 路线 | 问题 | 本文结果 |
|------|------|----------|
| 固定偶圈 | $\operatorname{ex}^*(n,C_{2k})$ | $O(k^3n^{1+1/k})$ |
| 所有圈 | $\operatorname{ex}^*(n,\mathcal C)$ | $O(n\log^2 n)$ |

---

## 2. 主定理

> [!theorem] Theorem 1.1, all rainbow cycles
> 若 $G$ 是 properly edge-colored $n$ 点图，且
> $$
> e(G)\ge 32n\log^2(5n),
> $$
> 则 $G$ 含有一个 rainbow cycle。

> [!theorem] Theorem 1.2, fixed even cycle
> 对 $k\ge 2$，若 $G$ 是 properly edge-colored $n$ 点图，且
> $$
> e(G)\ge 10^5k^3n^{1+1/k},
> $$
> 则 $G$ 含有一个 rainbow $C_{2k}$。

> [!corollary] Even-cycle supersaturation
> 若 $n$ 点图 $G$ 的平均度 $d\ge 2\cdot 10^5k^3n^{1/k}$，则 $G$ 中至少有
> $$
> \frac12(2^{12}k)^{-k}d^{2k}
> $$
> 个 $C_{2k}$。

---

## 3. 核心思想

一个闭 $2k$-walk 写成

$$
v_0v_1\cdots v_{2k},\qquad v_0=v_{2k}.
$$

如果它没有中途重复顶点，也没有重复颜色，那么它就是一个 rainbow $C_{2k}$。因此若没有 rainbow $C_{2k}$，每个闭 $2k$-walk 都必须“撞车”：

1. **vertex-degenerate**：某两个中间位置重复顶点；
2. **color-degenerate**：某两条边重复颜色。

本文的核心转化是：

> 无 rainbow $C_{2k}$  
> $\Longrightarrow$ 所有 closed $2k$-walk 都退化  
> $\Longrightarrow$ closed $2k$-walk 数量可由 star 数量控制。

也就是：

$$
|\operatorname{Hom}(C_{2k},G)|
\le
(2k)^{2k}|\operatorname{Hom}(S_k,G)|.
$$

人话：

> 如果没有 rainbow 偶圈，那么图里的“圈状运动”不能比“星状运动”多太多。

---

## 4. Lemma 2.1 的直觉

### 4.1 复杂撞车不比简单撞车多

令 $U_1$ 表示最简单的退化：闭 walk 一开始就走出去又回来，

$$
v_0=v_2.
$$

作者证明所有复杂退化都被 $U_1$ 控制：

$$
|D(C_{2k},G)|\le 4k^2|U_1|.
$$

直觉：

> 如果有很多“远处才撞车”的闭路，那么把它们从中间切开，会得到很多路径组合；用 Cauchy--Schwarz 重新配对后，会强迫产生很多“近处就撞车”的闭路。所以远处撞车并不比近处撞车更自由。复杂的坏事，最终被证明不比最简单的坏事多太多。

这一步包括两类不等式：

$$
|U_s|^2\le |U_1||U_{2s-1}|,
$$

以及颜色退化版本

$$
|F_t|^2\le |F_1||F_{2t-1}|.
$$

由于 coloring 是 proper 的，最短颜色重复和最短顶点回退一致：

$$
F_1=U_1.
$$

---

### 4.2 从简单撞车折叠到 star

定义一串集合：

$$
O_0,O_1,\dots,O_k.
$$

其中 $O_s$ 数的是满足

$$
v_0=v_2=\cdots=v_{2s}
$$

的 closed $2k$-walk。

于是：

- $O_0=\operatorname{Hom}(C_{2k},G)$；
- $O_1=U_1$；
- $O_k$ 中所有偶数位置都等于同一个点，形式为
  $$
  x,v_1,x,v_3,x,\dots,x,v_{2k-1},x,
  $$
  因而就是 $\operatorname{Hom}(S_k,G)$。

关键是 log-convexity：

$$
|O_s|^2\le |O_{s-1}||O_{s+1}|.
$$

它说明折叠损失的比值单调：

$$
\frac{|O_0|}{|O_1|}
\ge
\frac{|O_1|}{|O_2|}
\ge\cdots\ge
\frac{|O_{k-1}|}{|O_k|}.
$$

人话：

> 第一次把圈压扁成“出门又回来”之后，后面继续把偶数点压到同一个中心，不会额外付出更大的代价；压 $k$ 次，圈就变成了星。

---

### 4.3 Cauchy--Schwarz 为什么给 log-convexity

对 $O_s$，把一个 walk 按两个切口拆开。固定

$$
x=v_0=v_2=\cdots=v_{2s},\qquad y=v_{s+1},\qquad z=v_{k+s+1}.
$$

令：

- $\sigma_\ell(x,y)$：从 $x$ 到 $y$ 的长度 $\ell$ 的 star-walk 数量；
- $w_\ell(z,x)$：从 $z$ 到 $x$ 的长度 $\ell$ 的普通 walk 数量。

那么

$$
|O_s|=
\sum_{x,y,z}
w_{k-s-1}(z,x)\sigma_{s+1}(x,y)
w_{k-s+1}(z,x)\sigma_{s-1}(x,y).
$$

设

$$
A(x,y,z)=\sigma_{s+1}(x,y)w_{k-s-1}(z,x),
$$

$$
B(x,y,z)=\sigma_{s-1}(x,y)w_{k-s+1}(z,x).
$$

则

$$
|O_s|=\sum_{x,y,z}A(x,y,z)B(x,y,z).
$$

Cauchy--Schwarz 给出

$$
|O_s|^2
\le
\left(\sum A^2\right)\left(\sum B^2\right).
$$

这里

$$
\sum A^2=|O_{s+1}|,\qquad \sum B^2=|O_{s-1}|.
$$

最短记法：

$$
O_s=
(\text{长一点的星状块}\times \text{短一点的自由块})
\cdot
(\text{短一点的星状块}\times \text{长一点的自由块}).
$$

CS 把这个混合项拆成两个平方：

$$
(\text{长星}\times \text{短自由})^2
\quad\text{和}\quad
(\text{短星}\times \text{长自由})^2.
$$

前者正好对应多折叠一层，即 $O_{s+1}$；后者对应少折叠一层，即 $O_{s-1}$。所以

$$
|O_s|^2\le |O_{s-1}||O_{s+1}|.
$$

---

## 5. 数量比较：为什么是 star vs cycle

先在近似 $d$-regular 的图中做粗略估算。

Star 数量：

$$
|\operatorname{Hom}(S_k,G)|\approx nd^k.
$$

因为选中心有 $n$ 种，每个叶子约有 $d$ 种选择。

Closed $2k$-walk / $C_{2k}$-hom 数量：

$$
|\operatorname{Hom}(C_{2k},G)|\approx d^{2k}.
$$

因为随机选 $2k$ 个位置约有 $n^{2k}$ 种，相邻边存在概率约 $(d/n)^{2k}$，乘起来是 $d^{2k}$。

无 rainbow $C_{2k}$ 会强迫

$$
d^{2k}\lesssim (2k)^{2k}nd^k.
$$

约掉 $d^k$：

$$
d^k\lesssim (2k)^{2k}n.
$$

取 $k$ 次根：

$$
d\lesssim k^2n^{1/k}.
$$

这就是固定偶圈和所有圈两个结论共同的数量核心。

> [!summary] 固定偶圈 vs 所有圈
>
> | 视角 | 固定 $C_{2k}$ | 所有 cycles |
> |---|---|---|
> | 要找什么 | 指定长度 $2k$ 的 rainbow cycle | 任意长度的 rainbow cycle |
> | 如果没有目标结构 | 没有 rainbow $C_{2k}$ | 对所有 $k$，都没有 rainbow $C_{2k}$ |
> | 计数冲突 | $C_{2k}$-hom 太多 vs $S_k$-hom 太少 | 对某个最优 $k$，$C_{2k}$-hom 太多 vs $S_k$-hom 太少 |
> | 临界方程 | $d^k\approx n$ | 最小化 $k^2 n^{1/k}$ |
> | 最优 $k$ | 题目固定，不能优化 | $k\approx \frac12\log n$ |
> | 结果形状 | $n^{1+1/k}$ | $n\log^2 n$ |
> | 人话 | 长度固定，密度要超过 $n^{1/k}$ 才逼出它 | 长度可选，挑一个对图最不利的长度来逼出某个 rainbow cycle |

这里的 $k^2$ 来自 Lemma 2.1 中 $(2k)^{2k}$ 常数取 $k$ 次根。固定偶圈定理最终写成 $k^3n^{1+1/k}$，多出的一个 $k$ 是一般图 lopsided regularization 的损耗；所有 cycles 定理通过选择 $k\sim\log n$ 并使用较轻的 splitting regularization，得到 $n\log^2 n$。

---

## 6. 为什么需要正则化

上面的估算默认图接近正则。一般图中，star count 是

$$
\sum_v d(v)^k,
$$

会被少数高度数点撑爆。因此需要先做 [[正则化]]。

本文有两版正则化：

| 版本 | 输出 | 适合什么 | 为什么 |
|------|------|----------|--------|
| splitting regularization | 一个新图 $G'$，度数都在 $[\delta/2,\delta]$ | all cycles | 只要映回后得到某个 rainbow cycle 即可 |
| lopsided regularization | 原图的真实二部子图 $(A,B)$ | fixed $C_{2k}$ | 必须保持固定长度，不能让映回时顶点合并 |

区别：

- splitting 通过劈点制造近正则图，但 $G'\to G$ 只是 homomorphism，不保证 $C_{2k}$ 映回仍是 $C_{2k}$；
- lopsided regularization 只删点删边，所以若子图中有 rainbow $C_{2k}$，原图中也有同一个 rainbow $C_{2k}$。

---

## 7. Theorem 1.2：固定偶圈证明流程

目标：

$$
e(G)\ge 10^5k^3n^{1+1/k}
\Longrightarrow
G\text{ contains rainbow }C_{2k}.
$$

证明流程：

| 步骤 | 实际在干什么 | 作用 |
|------|--------------|------|
| 1 | 反设没有 rainbow $C_{2k}$ | 每个闭 $2k$-walk 必须重复顶点或重复颜色 |
| 2 | 取平均度最大的子图 | 防止更稠的小区域隐藏在原图里 |
| 3 | 取二部子图 | $C_{2k}$ 是二部结构，保留一部分边即可 |
| 4 | 做 lopsided regularization | 找真实二部子图 $(A,B)$，一侧度数集中，另一侧最大度受控 |
| 5 | 在 $(A,B)$ 中估计 star count | 控制 $\sum_v d(v)^k$，避免高度数点撑爆 |
| 6 | 用二部偶圈 hom 下界估计 closed $2k$-walk | 稠密性保证 $C_{2k}$-hom 很多 |
| 7 | 用退化分析把 closed $2k$-walk 压到 star count | 无 rainbow $C_{2k}$ 迫使所有闭 walk 都退化 |
| 8 | 两边冲突 | 得到 $d\lesssim k^3n^{1/k}$，与假设矛盾 |

更具体地，regularization 给出二部子图 $(A,B)$，其中：

- 对 $a\in A$，$d(a)\in[2^{i-6}d,2^{i-5}d]$；
- 对 $b\in B$，$d(b)\le 4d$；
- $A,B$ 都有足够大小。

Star 上界：

$$
|\operatorname{Hom}(S_k,G')|
=\sum_{v\in A\cup B}d(v)^k.
$$

$A$ 侧由度数集中控制；$B$ 侧由最大度控制：

$$
\sum_{b\in B}d(b)^k
\le
(4d)^{k-1}\sum_{b\in B}d(b).
$$

Closed cycle 下界来自二部 spectral/Sidorenko 型估计：

$$
|\operatorname{Hom}(C_{2k},G')|\ge d_A^k d_B^k.
$$

最后和退化上界相撞：

$$
|\operatorname{Hom}(C_{2k},G')|
\le
(2k)^{2k}|\operatorname{Hom}(S_k,G')|.
$$

---

## 8. Theorem 1.1：所有 cycles 证明流程

目标：

$$
e(G)\ge 32n\log^2(5n)
\Longrightarrow
G\text{ contains some rainbow cycle}.
$$

证明流程：

| 步骤 | 实际在干什么 | 作用 |
|------|--------------|------|
| 1 | 反设没有任何 rainbow cycle | 特别地，对任意 $k$ 都没有 rainbow $C_{2k}$ |
| 2 | 取最小度较大的子图 | 在高平均度核心中工作 |
| 3 | 用 splitting regularization 劈点 | 得到度数都在同一尺度的新图 $G'$ |
| 4 | 保持 color-preserving homomorphism $G'\to G$ | 若 $G'$ 有 rainbow cycle，则 $G$ 有 rainbow cycle |
| 5 | 选择 $k\sim \log |V(G')|$ | all-cycles 问题可以自由选择长度 |
| 6 | 对这个 $k$ 做退化闭 walk 分析 | 因为没有任何 rainbow cycle，所以没有 rainbow $C_{2k}$ |
| 7 | 在近正则图中比较 star 和 closed cycle counts | 得到 $d\lesssim k^2|V(G')|^{1/k}$ |
| 8 | 用 $k\sim\log |V(G')|$ | $|V(G')|^{1/k}=O(1)$，所以 $d\lesssim \log^2 n$ |
| 9 | 与初始平均度假设矛盾 | 原图必须有 rainbow cycle |

这条证明比固定偶圈更轻，是因为：

1. 不要求保持固定长度，只要映回后仍有某个 rainbow cycle；
2. 可以自由选 $k\sim\log n$，把 $n^{1/k}$ 变成常数；
3. splitting regularization 足以控制 star count。

---

## 9. 技术亮点

### 9.1 退化解释不够多

本文不是直接构造 rainbow cycle，而是反过来问：

> 如果不允许 rainbow cycle，那么所有闭 walk 都必须由重复顶点或重复颜色解释。这些解释能力够吗？

答案是：在稠密且正则化后的图中，不够。

### 9.2 Cauchy--Schwarz 的“重新配对”作用

CS 的作用不是普通估计，而是把混合结构拆成两个相邻折叠层：

$$
O_s^2\le O_{s-1}O_{s+1}.
$$

这让从 cycle 到 star 的折叠过程可以被整齐控制。

### 9.3 正则化是为了让 star 不虚胖

Star count 对度数高阶矩敏感。正则化的作用不是装饰，而是保证

$$
\sum_v d(v)^k
$$

不会被少数高度数点支配。

---

## 10. 我还需要细读的点

- [ ] Lemma 2.1 中 color-degenerate 部分的完整 CS 证明。
- [ ] Lemma 3.2 中 dyadic 分层的常数和指数，尤其 $|A|$ 的下界如何精确进入最终 $k^3$。
- [ ] Corollary 1.3 的 supersaturation 证明，和 Bondy--Simonovits / Erdős--Simonovits 的关系。
- [ ] Janzer 方法与本文 homomorphism-counting 方法的对比。
- [ ] Alon--Bucic--Sauermann--Zakharov--Zamir 如何进一步做到 $n\log n\log\log n$。

---

## 11. 可复用链接

- [[正则化]]：整理 splitting regularization、lopsided regularization、Erdős--Simonovits / Jiang--Seiver 工具链。
- [[Survey - Rainbow Turan Problems for Cycles]]：这篇所在的文献路线图。

---

## 12. 参考文献

1. Jaehoon Kim, Joonkyung Lee, Hong Liu, Tuan Tran. *Rainbow Cycles in Properly Edge-Colored Graphs*. Combinatorica 44 (2024), 909--919.
2. Keevash, Mubayi, Sudakov, Verstraëte. *Rainbow Turán Problems*. Combinatorics, Probability and Computing 16 (2007), 109--126.
3. Janzer. *Rainbow Turán number of even cycles, repeated patterns and blow-ups of cycles*. Israel Journal of Mathematics 253 (2023), 813--840.
4. Alon, Bucic, Sauermann, Zakharov, Zamir. *Essentially tight bounds for rainbow cycles in proper edge-colourings*. Proceedings of the London Mathematical Society 130 (2025).
