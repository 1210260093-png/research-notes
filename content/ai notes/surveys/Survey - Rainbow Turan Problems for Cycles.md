---
title: "Survey: Rainbow Turan Problems for Cycles"
subtitle: "从 rainbow even cycles 到 all rainbow cycles 的两条路线"
date: 2026-06-22
tags:
  - survey
  - rainbow-turan
  - extremal-graph-theory
  - properly-edge-colored
  - cycles
status: draft
authors:
  - Me
---

# Rainbow Turan Problems for Cycles

> [!summary] 一句话版本
> 这份笔记整理 properly edge-colored graphs 中 rainbow cycle 的 Turan 型问题。主线有两条：固定偶圈 $C_{2k}$ 的 rainbow Turan number，以及禁止所有 rainbow cycles 时的最大边数。前者已经知道正确阶为 $\Theta(n^{1+1/k})$，最新工作主要优化 $k$ 依赖；后者从 $\Omega(n\log n)$ 下界和多轮上界改进，发展到几乎 tight 的 $n(\log n)^{1+o(1)}$ 量级。

> [!tip] 读法
> 想快速建立地图，读 **0. 导读**、**2. 两条主线**、**4. 结果路线图**。  
> 想追证明技术，读 **5. 关键证明机制**。  
> 想找后续项目，读 **7. 开放问题** 和 **8. 对我研究的启发**。

> 分析日期：2026-06-22  
> 主要起点：Kim--Lee--Liu--Tran (2024), *Rainbow cycles in properly edge-colored graphs*.

---

## 0. 导读

这篇 survey 关注如下问题：

> 在一个 properly edge-colored 的 $n$ 点图中，如果不允许出现 rainbow cycle，或者不允许出现 rainbow $C_{2k}$，最多能有多少条边？

这里 properly edge-colored 意味着同一个顶点 incident 的边颜色两两不同；rainbow 意味着目标子图中所有边颜色互不相同。

主线可以概括为：

1. **对象是什么**：properly edge-colored graphs。
2. **目标是什么**：估计 rainbow Turan number $\operatorname{ex}^*(n,H)$。
3. **困难在哪里**：proper coloring 既给结构，又允许颜色类作为 matching 分散出现；普通 Turan 方法不能直接识别颜色重复造成的退化。
4. **方法如何演化**：从 extremal / girth / additive constructions，到 homomorphism counting、regularization、repeated Cauchy--Schwarz，再到 almost-tight 的 probabilistic/entropy 风格方法。
5. **现在还缺什么**：固定偶圈中最佳 $k$ 常数、所有 cycle 问题中的 sharp constant/second order、以及更统一的 colored extremal framework。

> [!important] 本文的核心问题
> 对图族 $\mathcal C$ 为所有 cycles，或单个偶圈 $C_{2k}$，理解
> $$
> \operatorname{ex}^*(n,\mathcal C),\qquad \operatorname{ex}^*(n,C_{2k}).
> $$

---

## 1. 基本定义与动机

### 1.1 Rainbow Turan number

> [!definition] Rainbow Turan number
> 对固定图 $H$，$\operatorname{ex}^*(n,H)$ 是所有 $n$ 点 properly edge-colored graphs 中，不含 rainbow copy of $H$ 的最大边数。若 $\mathcal H$ 是图族，则 $\operatorname{ex}^*(n,\mathcal H)$ 表示不含任何 rainbow $H\in\mathcal H$ 的最大边数。

对比普通 Turan number $\operatorname{ex}(n,H)$，rainbow 版本有两个额外因素：

- host graph 可以很稠，但颜色限制必须 proper；
- forbidden copy 只禁止 rainbow copy，允许非-rainbow 的 $H$ 大量存在。

### 1.2 为什么 cycles 是核心对象

Cycles 是 rainbow Turan 问题最自然的试验场：

- 对固定偶圈 $C_{2k}$，普通 Turan 数已有经典结果 $\operatorname{ex}(n,C_{2k})=O_k(n^{1+1/k})$。
- Rainbow $C_{2k}$ 和 additive combinatorics 中的 $B_k^*$-sets 有直接联系。
- 禁止所有 rainbow cycles 时，问题等价于一种 colored acyclicity，但它允许图远比森林稠，已知下界达到 $\Omega(n\log n)$。

---

## 2. 两条主线

### 2.1 Route A：固定偶圈 $C_{2k}$

目标是确定

$$
\operatorname{ex}^*(n,C_{2k}).
$$

Keevash--Mubayi--Sudakov--Verstraete 的开山论文给出一般下界

$$
\operatorname{ex}^*(n,C_{2k})=\Omega(n^{1+1/k}),
$$

来自 Bose--Chowla 型 additive construction。后来 Janzer 证明匹配上界：

$$
\operatorname{ex}^*(n,C_{2k})=O_k(n^{1+1/k}).
$$

这解决了正确阶的问题。Kim--Lee--Liu--Tran 的贡献是把 Janzer 上界中的 $k$ 依赖从指数型降到多项式型：

$$
e(G)\ge 10^5 k^3 n^{1+1/k}
\quad\Longrightarrow\quad
G\text{ contains a rainbow }C_{2k}.
$$

这条路线现在的重点不再是 $n$ 的指数，而是：

- $k$ 的最优依赖是什么？
- 是否能得到更自然的常数？
- homomorphism-counting 方法能否推广到别的 rainbow bipartite graphs？

注意这条路线和“禁止所有 cycles”不是简单的包含关系。固定 $k$ 时临界规模是 $n^{1+1/k}$；而禁止所有 rainbow cycles 时，允许被禁止的圈长随 $n$ 增长，临界规模变成 $n\log n$ 附近。后者的 extremal examples 更接近 hypercube / direction-coloring，而不是某个固定偶圈的 extremal construction。

### 2.2 Route B：禁止所有 rainbow cycles

目标是确定

$$
\operatorname{ex}^*(n,\mathcal C),
$$

其中 $\mathcal C$ 是所有 cycles。

已知下界为

$$
\operatorname{ex}^*(n,\mathcal C)=\Omega(n\log n).
$$

上界经历了多轮改进：

$$
O\left(n e^{(\log n)^{1/2+o(1)}}\right)
\to
O(n\log^4 n)
\to
O(n(\log n)^{2+o(1)})
\to
O(n\log^2 n)
\to
n(\log n)^{1+o(1)}.
$$

Kim--Lee--Liu--Tran 证明了 $O(n\log^2 n)$，独立地 Janzer--Sudakov 也得到这一量级。Alon--Bucic--Sauermann--Zakharov--Zamir 进一步证明平均度上界 $(\log n)^{1+o(1)}$，与 $\Omega(\log n)$ 下界只差 $o(1)$ 指数，因此基本解决了阶的问题。

---

## 3. 经典结果

这一节分成两条线写。第一条是固定偶圈 $C_{2k}$，第二条是禁止所有 rainbow cycles 的函数

$$
f(n):=\operatorname{ex}^*(n,\mathcal C).
$$

### 3.1 固定偶圈 $C_{2k}$

> [!theorem] Keevash--Mubayi--Sudakov--Verstraete (2007)
> 定义 rainbow Turan number $\operatorname{ex}^*(n,H)$，证明非二部图时 rainbow Turan number 与普通 Turan number 有同阶关系，并研究 $K_{s,t}$ 与偶圈。特别地，给出 $\operatorname{ex}^*(n,C_{2k})=\Omega(n^{1+1/k})$，并证明 $\operatorname{ex}^*(n,C_6)=O(n^{4/3})$。

**意义。** 这是 rainbow Turan 问题的起点，也把偶圈问题和 additive combinatorics 联系起来。

> [!theorem] Das--Lee--Sudakov (2013)
> 研究 rainbow even cycles，给出固定偶圈问题的早期上界。粗略地说，他们证明
> $$
> \operatorname{ex}^*(n,C_{2k})
> \le
> O\bigl(n^{1+(1+o_k(1))\log k/k}\bigr),
> $$
> 并由此推动 Keevash--Mubayi--Sudakov--Verstraete 提出的 even-cycle 问题。

**意义。** 这是从开山问题走向一般 even cycles 的关键一步。

> [!theorem] Janzer (2023)
> 对每个 $k\ge 2$，
> $$
> \operatorname{ex}^*(n,C_{2k})=O(n^{1+1/k}).
> $$
> 同时证明若边数超过 $c n(\log n)^4$，则存在某个 rainbow cycle。

**意义。** 固定偶圈问题的阶被解决；所有 cycle 问题也进入 polylog 上界阶段。

> [!theorem] Kim--Lee--Liu--Tran (2024)
> 若
> $$
> e(G)\ge 10^5 k^3 n^{1+1/k},
> $$
> 则 $G$ 包含 rainbow $C_{2k}$。

**意义。** 给出固定偶圈问题的多项式 $k$ 常数，并用 homomorphism inequalities 与 lopsided regularization 给出非常干净的证明框架。这个证明还顺手给出 even cycles 的 Erdos--Simonovits supersaturation 的一个 Cauchy--Schwarz 风格证明。

### 3.2 禁止所有 rainbow cycles

> [!theorem] Keevash--Mubayi--Sudakov--Verstraete (2007)
> 令 $f(n)=\operatorname{ex}^*(n,\mathcal C)$。他们给出 hypercube / direction-coloring 型构造，说明
> $$
> f(n)=\Omega(n\log n).
> $$
> 另一方面，他们证明了第一个非平凡上界
> $$
> f(n)=O(n^{4/3}).
> $$

**意义。** 这确立了所有 cycles 路线的基本 gap：从一开始就知道正确答案至少是 $n\log n$，同时问题不是普通森林界那样的线性阶。

> [!theorem] Das--Lee--Sudakov (2013)
> 对任意固定 $\gamma>0$，充分大的 $n$ 满足
> $$
> f(n)\le n\exp\bigl((\log n)^{1/2+\gamma}\bigr).
> $$
> 等价地，若 properly edge-colored $n$ 点图边数超过这个量级，则存在某个 rainbow cycle。

**意义。** 这是从多项式上界 $O(n^{4/3})$ 到 $n^{1+o(1)}$ 上界的第一步，回答了开山论文中“是否 $n^{1+o(1)}$”的方向性问题。

> [!theorem] Janzer (2023)
> 存在常数 $C$ 使得
> $$
> f(n)\le C n(\log n)^4.
> $$

**意义。** 第一次把所有 cycles 的上界压到 $n\cdot\operatorname{polylog} n$，与 $\Omega(n\log n)$ 下界只差 polylog 因子。

> [!theorem] Tomon (2022/2023)
> 证明
> $$
> f(n)\le n(\log n)^{2+o(1)}.
> $$

**意义。** 把 polylog 指数从 $4$ 降到 $2+o(1)$。这一步让“从固定偶圈取 $k\sim\log n$”得到的 $\log^2 n$ 形状变得自然。

> [!theorem] Janzer--Sudakov (2024)
> 证明
> $$
> f(n)=O(n(\log n)^2).
> $$
> 更具体地，他们证明若 properly edge-colored $n$ 点图边数至少 $8n(\log n)^2$，则含有 rainbow cycle；并且若边数为 $\omega(n\log n)$，则存在一个 almost-rainbow cycle。

**意义。** 独立去掉 Tomon 上界中的 $o(1)$，并给出 almost-rainbow cycle 的紧结果，说明 $n\log n$ 附近已经有很强的“接近 rainbow”现象。

> [!theorem] Kim--Lee--Liu--Tran (2024)
> 每个平均度至少 $32(\log 5n)^2$ 的 properly edge-colored $n$ 点图包含 rainbow cycle。因此
> $$
> f(n)=O(n\log^2 n).
> $$

**意义。** 与 Janzer--Sudakov 独立得到 $O(n\log^2 n)$，但证明路线更贴近固定偶圈：选择 $k\approx \log n$，使用 homomorphism inequalities 和 regularization。

> [!theorem] Alon--Bucic--Sauermann--Zakharov--Zamir (2025)
> 若 properly edge-colored $n$ 点图没有 rainbow cycle，则其平均度至多 $(\log n)^{1+o(1)}$。更具体地，他们证明存在常数 $C$，使得
> $$
> f(n)\le C n\log n\log\log n.
> $$

**意义。** 与 $\Omega(n\log n)$ 下界只差一个 $\log\log n$ 因子，或者说在 $(\log n)^{o(1)}$ 精度下基本解决 $\operatorname{ex}^*(n,\mathcal C)$ 的阶。

---

## 4. 结果路线图

| 年份 | 作者 | 结果 | 方法/关键词 | 备注 |
|------|------|------|-------------|------|
| 2007 | Keevash--Mubayi--Sudakov--Verstraete | 定义 $\operatorname{ex}^*(n,H)$；$\operatorname{ex}^*(n,C_{2k})=\Omega(n^{1+1/k})$；$f(n)=\Omega(n\log n)$ 且 $f(n)=O(n^{4/3})$ | additive construction, extremal graph theory | 起点 |
| 2013 | Das--Lee--Sudakov | 固定偶圈早期上界；$f(n)\le n\exp((\log n)^{1/2+o(1)})$ | expansion / extremal counting | all cycles 进入 $n^{1+o(1)}$ |
| 2023 | Janzer | $\operatorname{ex}^*(n,C_{2k})=O(n^{1+1/k})$；$f(n)=O(n\log^4 n)$ | repeated patterns, blow-ups | 固定偶圈阶解决 |
| 2023 | Tomon | $f(n)\le n(\log n)^{2+o(1)}$ | robust subdivisions / sprinkling | all cycles 到 $\log^{2+o(1)}$ |
| 2024 | Janzer--Sudakov | $f(n)=O(n\log^2 n)$；$\omega(n\log n)$ 边强迫 almost-rainbow cycle | homomorphism count variants | 去掉 Tomon 的 $o(1)$ |
| 2024 | Kim--Lee--Liu--Tran | all cycles 上界 $O(n\log^2 n)$；固定偶圈常数 $10^5k^3$ | homomorphism counts, Cauchy--Schwarz, lopsided regularization | 方法很可复用 |
| 2025 | Alon--Bucic--Sauermann--Zakharov--Zamir | $f(n)\le Cn\log n\log\log n$，即平均度 $(\log n)^{1+o(1)}$ | probabilistic / refined colored structure | 基本 tight |

> [!info] 怎么读这张表
> 固定偶圈路线的转折点是 Janzer 得到正确阶，Kim--Lee--Liu--Tran 改善 $k$ 依赖。所有 cycle 路线的转折点是从 polylog 上界走到 $\log^{1+o(1)} n$，这说明原来的 $\Omega(n\log n)$ 构造本质上已经抓住了正确规模。

---

## 5. 关键证明机制

### 5.1 机制一：把 rainbow obstruction 转成 degenerate closed walks

Kim--Lee--Liu--Tran 的核心观察：

如果 $G$ 没有 rainbow $C_{2k}$，那么每个闭 $2k$-walk 要么重复顶点，要么重复颜色。换句话说，

$$
\operatorname{Hom}(C_{2k},G)=D(C_{2k},G),
$$

其中右边是 degenerate closed walks 的集合。

非退化的闭 $2k$-walk 正好给出一个 rainbow $C_{2k}$。所以没有 rainbow cycle 时，所有 homomorphism 都被退化现象解释。

### 5.2 机制二：退化 walk 的 Cauchy--Schwarz 压缩

关键不等式形如：

$$
|\operatorname{Hom}(C_{2k},G)|
\le
(2k)^{2k}|\operatorname{Hom}(S_k,G)|
$$

前提是 $G$ 没有 rainbow $C_{2k}$。

直觉是：闭偶圈 homomorphism 本来有 $2k$ 个位置的自由度；但如果每个都退化，重复顶点/重复颜色会把自由度压到更像一个 star 的结构。作者用一串 Cauchy--Schwarz 证明各种退化类型都由最简单的退化类型控制。

### 5.3 机制三：regularization 让 homomorphism count 可用

理想情况下，如果图接近正则，Sidorenko 型下界给出

$$
|\operatorname{Hom}(C_{2k},G)| \gtrsim n^{2k}p^{2k},
$$

而 star count 满足

$$
|\operatorname{Hom}(S_k,G)| \lesssim n^{k+1}p^k.
$$

两者结合会推出

$$
p \lesssim k^2 n^{-1+1/k},
$$

也就是 $e(G)\lesssim k^2 n^{1+1/k}$。

一般图不正则，所以需要 regularization。Kim--Lee--Liu--Tran 使用：

- vertex splitting：把度数拉到一个区间，同时保持 color-preserving homomorphism；
- lopsided regularization：找二部子图，一侧度数集中，另一侧度数受控。

### 5.4 机制四：all cycles 从固定 $k$ 过渡到 $k\sim \log n$

若没有任何 rainbow cycle，则特别没有 rainbow $C_{2k}$。选择 $k\approx \log n$，固定偶圈定理会给出 $O(n\log^2 n)$ 级别的边数上界。

这解释了为什么固定偶圈的 $k$ 依赖会影响 all cycles 问题：当 $k$ 被取到 $\log n$ 时，$k^2$ 或 $k^3$ 变成 polylog factor。

### 5.5 机制五：near-tight all-cycles 方法

Alon--Bucic--Sauermann--Zakharov--Zamir 的结果不能只看作“继续优化固定偶圈的 $k$ 依赖”。它更直接地处理无 rainbow cycle 的全局结构，目标是逼近 hypercube/direction-coloring 下界。

可把这一路线的直觉理解为：

1. 若平均度远大于 $\log n$，图中应该能找到一个较小但仍很稠的 colored substructure。
2. Proper coloring 让每个颜色类是 matching，因此颜色重复不能像一般 edge-colored graph 那样局部堆积。
3. 若所有 cycles 都非-rainbow，那么每个 cycle 都携带颜色重复；这给 cycle space 或路径拼接过程施加了强约束。
4. 通过 refined counting / probabilistic encoding，把“无 rainbow cycle”转化为一种信息压缩：太多边会产生太多可区分路径或闭合方式，超过颜色重复能够解释的范围。

这条线和 Kim--Lee--Liu--Tran 的 homomorphism 方法互补：KLLT 从固定长度 $C_{2k}$ 出发，选 $k\sim\log n$ 得到 $\log^2 n$；near-tight all-cycles 方法直接面向任意长度的 cycle，因此能进一步逼近 $n\log n$。

> [!note] 需要细读的点
> 这里目前只是路线级概括。真正要理解 $Cn\log n\log\log n$，需要单独读 Alon--Bucic--Sauermann--Zakharov--Zamir 的 proof skeleton，尤其是他们如何把无 rainbow cycle 的条件编码成可计数的结构限制。

---

## 6. 与相邻方向的接口

| 相邻方向 | 连接点 | 可以借用的工具 |
|----------|--------|----------------|
| 普通 Turan theory | $C_{2k}$ 的 extremal number 和 supersaturation | Bondy--Simonovits, Sidorenko, homomorphism counts |
| Additive combinatorics | $B_k^*$-sets 给出 rainbow $C_{2k}$ 下界 | Bose--Chowla construction, Sidon-type sets |
| Anti-Ramsey theory | rainbow subgraphs 的存在性 | color degree, local constraints |
| Graph decomposition | properly colored host graph 与 rainbow structures | absorption, nibble, switching |
| Extremal set theory / entropy | all cycles 的 near-tight 上界 | probabilistic encoding, refined counting |
| Hypercube / cube Turan | direction-coloring 给出 $n\log n$ 下界，Janzer--Sudakov 与 hypercube Turan 有交叉 | subcube structure, dimension counting |

---

## 7. 开放问题

> [!question] 问题 1：固定偶圈的最佳 $k$ 依赖
> 当前 Kim--Lee--Liu--Tran 给出 $10^5 k^3 n^{1+1/k}$。真实的 $k$ 依赖应该是什么？是否可以降到 $O(k)$、$O(k^2)$，甚至接近普通 $C_{2k}$ Turan 问题中的最佳常数行为？
>
> **为什么重要。** 这会判断 homomorphism-counting 方法是否只是给出正确阶，还是能捕捉 sharp constant 级别的信息。

> [!question] 问题 2：$\operatorname{ex}^*(n,\mathcal C)$ 的 sharp form
> 已知下界 $\Omega(n\log n)$，上界 $O(n\log n\log\log n)$。能否去掉 $\log\log n$ 因子，证明
> $$
> \operatorname{ex}^*(n,\mathcal C)=\Theta(n\log n)?
> $$
> 更进一步，能否确定 sharp constant？
>
> **可能入口。** 需要更理解无 rainbow cycle 的 coloring 结构；这可能和 additive constructions 或 matroid-like colored acyclicity 有关。

> [!question] 问题 3：更一般的 bipartite graphs
> 对哪些二部图 $H$，有
> $$
> \operatorname{ex}^*(n,H)=O_H(\operatorname{ex}(n,H))?
> $$
> 对哪些 $H$，rainbow 条件会产生本质不同的行为？

> [!question] 问题 4：homomorphism inequality 的适用边界
> Kim--Lee--Liu--Tran 的证明把退化 closed walks 压到 star count。类似机制是否能用于 theta graphs、subdivisions、或者有指定颜色模式的 forbidden graphs？

---

## 8. 对我研究的启发

- **可复用的定义/框架**：properly edge-colored graph, rainbow Turan number, degenerate closed walks, color-preserving homomorphism。
- **可迁移的方法**：把 forbidden rainbow structure 转化为“所有 homomorphism 都退化”，再用 Cauchy--Schwarz 控制退化集合。
- **值得细读的论文**：
  - Keevash--Mubayi--Sudakov--Verstraete (2007)：开山定义与下界构造。
  - Das--Lee--Sudakov (2013)：从多项式上界走向 $n^{1+o(1)}$，并推动 fixed even cycles。
  - Janzer (2023)：固定偶圈正确阶和 repeated-pattern 方法。
  - Tomon (2023)：把 all-cycles 上界压到 $n(\log n)^{2+o(1)}$。
  - Janzer--Sudakov (2024)：$O(n\log^2 n)$ 与 almost-rainbow cycle。
  - Kim--Lee--Liu--Tran (2024)：homomorphism inequality + lopsided regularization。
  - Alon--Bucic--Sauermann--Zakharov--Zamir (2025)：all cycles 基本 tight 的新方法。
  - Sudakov (2024)：edge-colored restricted subgraphs 的大图景 survey。
- **可能的小项目**：
  - 给 Kim--Lee--Liu--Tran 的 Lemma 2.1 写一个完全展开的中文证明笔记。
  - 对比 Janzer 方法和 homomorphism-counting 方法，找出两者共同的“退化结构压缩”。
  - 给 Alon--Bucic--Sauermann--Zakharov--Zamir 写 proof skeleton，弄清楚 $\log\log n$ 从哪里来。
  - 把 hypercube direction-coloring 下界写成一个可复用的例子。
  - 尝试把 degenerate-walk counting 改写成更抽象的 operator / matrix inequality。
  - 整理 $\operatorname{ex}^*(n,\mathcal C)$ 下界构造，看它是否有可迁移的 colored forest 结构。

---

## 9. 参考文献

1. Peter Keevash, Dhruv Mubayi, Benny Sudakov, Jacques Verstraete. *Rainbow Turan Problems*. Combinatorics, Probability and Computing 16 (2007), 109--126. [PDF](https://people.maths.ox.ac.uk/keevash/papers/rainbow-turan-full-version.pdf)
2. Shagnik Das, Choongbum Lee, Benny Sudakov. *Rainbow Turan Problem for Even Cycles*. European Journal of Combinatorics 34 (2013), 905--915. [arXiv:1202.3221](https://arxiv.org/abs/1202.3221)
3. Oliver Janzer. *Rainbow Turan number of even cycles, repeated patterns and blow-ups of cycles*. Israel Journal of Mathematics 253 (2023), 813--840. [arXiv:2006.01062](https://arxiv.org/abs/2006.01062)
4. Istvan Tomon. *Robust (rainbow) subdivisions and simplicial cycles*. Advances in Combinatorics (2023). [arXiv:2201.12309](https://arxiv.org/abs/2201.12309)
5. Oliver Janzer, Benny Sudakov. *On the Turan number of the hypercube*. Forum of Mathematics, Sigma 12 (2024), e38. [Cambridge](https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/on-the-turan-number-of-the-hypercube/AD40B026D34A4FC1FECBE2D768D31A24)
6. Jaehoon Kim, Joonkyung Lee, Hong Liu, Tuan Tran. *Rainbow Cycles in Properly Edge-Colored Graphs*. Combinatorica 44 (2024), 909--919. [Springer](https://link.springer.com/article/10.1007/s00493-024-00101-7), [arXiv:2211.03291](https://arxiv.org/abs/2211.03291)
7. Noga Alon, Matija Bucic, Lisa Sauermann, Dmitrii Zakharov, Or Zamir. *Essentially tight bounds for rainbow cycles in proper edge-colourings*. Proceedings of the London Mathematical Society 130 (2025), e70044. [arXiv:2309.04460](https://arxiv.org/abs/2309.04460)
8. Benny Sudakov. *Restricted subgraphs of edge-colored graphs and applications*. arXiv preprint (2024). [arXiv:2412.13945](https://arxiv.org/abs/2412.13945)
9. He Chen. *Long rainbow paths and rainbow cycles in edge colored graphs - A survey*. Applied Mathematics and Computation 317 (2018), 187--192. [DOI](https://doi.org/10.1016/j.amc.2017.09.005)

---

## 附录 A. 术语表

| 术语 | 中文解释 | 英文/符号 |
|------|----------|-----------|
| proper edge-coloring | 同一顶点相邻边颜色互不相同 | proper edge-coloring |
| rainbow subgraph | 子图中所有边颜色互不相同 | rainbow |
| rainbow Turan number | 不含 rainbow $H$ 的 properly colored $n$ 点图最大边数 | $\operatorname{ex}^*(n,H)$ |
| color-degenerate walk | 闭 walk 中某两条边颜色重复 | color-degenerate |
| vertex-degenerate walk | 闭 walk 中中途重复顶点 | vertex-degenerate |
| color-preserving homomorphism | 保持边颜色的图同态 | color-preserving homomorphism |

## 附录 B. 待读清单

- [ ] Keevash--Mubayi--Sudakov--Verstraete (2007)：下界构造与原始问题。
- [ ] Das--Lee--Sudakov (2013)：固定偶圈早期上界与 all-cycles 的 $n^{1+o(1)}$ 路线。
- [ ] Janzer (2023)：理解 repeated patterns 如何给固定偶圈正确阶。
- [ ] Tomon (2023)：理解 $\log^{2+o(1)}n$ 的 robust subdivision 方法。
- [ ] Janzer--Sudakov (2024)：理解 $O(n\log^2 n)$ 和 almost-rainbow cycle。
- [ ] Kim--Lee--Liu--Tran (2024)：完整拆解 Lemma 2.1 和 regularization。
- [ ] Alon--Bucic--Sauermann--Zakharov--Zamir (2025)：弄清楚 $\log^{1+o(1)}n$ 上界的核心机制。
- [ ] Sudakov (2024) survey：把 rainbow Turan 放回 restricted colored subgraphs 的大图景。
