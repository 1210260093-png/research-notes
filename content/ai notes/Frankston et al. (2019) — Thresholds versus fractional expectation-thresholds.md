---
type: paper
title: Thresholds versus fractional expectation-thresholds
authors:
  - Keith Frankston
  - Jeff Kahn
  - Bhargav Narayanan
  - Jinyoung Park
arxiv: ""
journal: Annals of Mathematics
year: 2019
date: ""
tags:
  - spread_thresholds
  - probabilistic_method
keywords:
  - thresholds
  - spread measure
  - Talagrand conjecture
  - LP duality
  - fractional expectation
艺名: FKNP
---

# Thresholds versus fractional expectation-thresholds

## 1. 基本信息、背景与问题

**我为什么读这篇**：FKNP 是 spread measure 技术线的核心——它把 ALWZ 的组合 spread 提升为测度论语言，证明了 Talagrand 猜想。这是理解阈值统一框架的必读论文。

> [!abstract] 一句话总结
> Talagrand 猜了十年：任何单调性质的阈值 $p_c$ 和分数期望阈值 $q_f$ 之间最多差一个 $\log\ell$ 因子。本文用 spread measure 证明了这个猜想。核心结构是 LP 对偶：$q_f$ 的分数覆盖的对偶恰好是一个支撑在 $\mathcal{F}$ 上的 $q$-spread 概率测度。

**这篇文章研究的问题是**：

> [!question] 核心问题
> 对所有单调图性质，是否 $p_c(\mathcal{F})\le K\cdot q_f(\mathcal{F})\cdot\log\ell(\mathcal{F})$ 普遍成立？

**相关背景**：

- 已知结果 1：Talagrand (2010) 提出 $q_f$ 概念并猜想 universal bound
- 已知结果 2：此前阈值分析都是 case-by-case 的
- **本文改进**：用 spread measure + LP 对偶证明猜想，给出统一的阈值上界框架

---

## 2. 主定理

> [!theorem] Theorem 1.1（Talagrand 猜想）
> 存在绝对常数 $K$，对任意有限集 $X$ 上的非平凡单调递增族 $\mathcal{F}$：
> $$
> p_c(\mathcal{F})\le K\cdot q_f(\mathcal{F})\cdot\log\ell(\mathcal{F}).
> $$

条件的含义：

| 条件 | 作用 | 能否放松 |
|------|------|----------|
| $\mathcal{F}$ 单调递增 | 基本设定 | 本质性的 |
| $\ell(\mathcal{F})$ 是极小元最大 size | 衡量"最小证据"的复杂度 | $\log\ell$ 是 universal 代价 |

**前置定义**：

- $X_p$：每个元素独立以概率 $p$ 被包含，$\mu_p(\mathcal{F})=\Pr[X_p\in\mathcal{F}]$
- $p_c(\mathcal{F})$：使 $\mu_{p_c}(\mathcal{F})=1/2$ 的唯一的 $p$
- $\ell(\mathcal{F})$：$\mathcal{F}$ 中极小元的最大大小
- $q_f(\mathcal{F})$：分数期望阈值（见下）

**分数期望阈值 $q_f$**：$\mathcal{F}$ 称为 weakly $p$-small，若存在 $g:2^X\to[0,1]$ 使得对每个 $A\in\mathcal{F}$ 有 $\sum_{T\subseteq A}g(T)\ge 1$，且 $\sum_{T\subseteq X}g(T)p^{|T|}\le 1/2$。定义 $q_f(\mathcal{F})=\sup\{p:\mathcal{F}\text{ is weakly }p\text{-small}\}$。

**基本不等式链**：$q(\mathcal{F})\le q_f(\mathcal{F})\le p_c(\mathcal{F})$（$q_f\le p_c$ 由 Markov 不等式直接推出）。

---

## 3. 证明主线

> [!idea] 整体思路
> 整个证明分两步。Lemma A（LP 对偶）从 $q_f$ 产生 spread measure。Lemma B（spread hitting lemma）从 spread measure 推出阈值上界。两步合起来就是 $p_c\le K q_f\log\ell$。

### 核心结构：LP 对偶

weakly $p$-small 是一个 primal LP：找分数覆盖 $g:2^X\to[0,1]$ 以低代价覆盖 $\mathcal{F}$。它的对偶是：

> $q_f(\mathcal{F})\le q\;\Longrightarrow\;$ 存在 $O(q)$-spread 概率测度 $\mu$ 支撑在 $\mathcal{F}$ 上。

### Step 1. Spread Measure 定义

$X$ 上一个概率测度 $\mu$（支撑在 $2^X$ 上）称为 **$q$-spread**，若对所有 $T\subseteq X$：

$$
\mu(\{S:S\supseteq T\})\le q^{|T|}.
$$

**名字来源**：ALWZ (2020) 在 sunflower lemma 突破中引入 spread hypergraph 概念。FKNP 将均匀分布在超边上的测度推广为一般概率测度。

**直觉**：spread 不是负相关或条件独立——它是一种**均匀性**条件：没有任何固定 pattern $T$ 被包含的概率超过独立 $q$-随机集的对应概率。

### Step 2. Lemma A（$q_f$ → spread measure，LP 对偶）

若 $q_f(\mathcal{F})\le q$，则存在支撑在 $\mathcal{F}$ 上的 $O(q)$-spread 概率测度。

**逻辑方向**：
- Primal：是否存在 $g:2^X\to[0,1]$ 以低代价覆盖 $\mathcal{F}$？（weakly $p$-small）
- Dual：是否存在 spread measure on $\mathcal{F}$？（对偶证书）

FKNP 用 LP 对偶 / minimax 定理证明 primal 的最优值 $\le q$ 时 dual 有可行解。对偶间隙的常数损失出现在这里。

### Step 3. Lemma B（spread measure → 阈值上界，spread hitting lemma）

> 若 $\mu$ 是支撑在 $\mathcal{F}$ 上的 $q$-spread 概率测度，则对 $p\ge Cq\log\ell(\mathcal{F})$，
> $$
> \Pr_{X_p}[\exists S\in\mathcal{F}:S\subseteq X_p]\ge 3/4.
> $$

**为什么需要 $\log\ell$**：将 $p$ 分解为 $\approx\log\ell$ 轮，每轮以概率 $\approx q$ 采样。spread 条件保证每轮在仍未被覆盖的极小元上有足够的"命中"。$\log\ell$ 来自需要覆盖大小 $\le\ell$ 的集合的多样性——每轮约消灭"一半"的剩余极小元测度。

**定理的推出**：取 $q=q_f(\mathcal{F})$。由 Lemma A，存在 $O(q_f)$-spread 测度。由 Lemma B，$p_c(\mathcal{F})\le K\cdot q_f(\mathcal{F})\cdot\log\ell(\mathcal{F})$。

---

## 4. 关键引理

> [!lemma] Lemma A（$q_f$ → spread measure，LP 对偶）
> 若 $q_f(\mathcal{F})\le q$，则存在支撑在 $\mathcal{F}$ 上的 $O(q)$-spread 概率测度。

**作用**：分数期望阈值的对偶证书恰好是一个 spread 测度。这是从 $q_f$ 的存在推出 spread measure 的存在——不是从 weakly $p$-small 的 witness $g$ 通过 random rounding 构造。

> [!lemma] Lemma B（spread hitting lemma）
> 若存在 $q$-spread 测度支撑在 $\mathcal{F}$ 上，则 $p_c(\mathcal{F})\le K'\cdot q\cdot\log\ell(\mathcal{F})$。

**作用**：如果有 spread measure on $\mathcal{F}$，那么温和放大采样概率（乘以 $\log\ell$），随机图就几乎必然命中 $\mathcal{F}$。这是整篇论文的灵魂。

---

## 5. 技术亮点 & 可复用思想

> [!tip] 可拿走的方法
> 1. **LP 对偶桥梁**：$q_f$ 的 primal LP（分数覆盖）的对偶恰好是 spread measure。这个"对偶化"技巧可迁移到其他阈值问题。
> 2. **Spread measure 作为均匀性条件**：不要求独立或负相关，只要求"无特权子集"——比传统概率工具更灵活。
> 3. **统一框架**：对**所有**单调性质一次性给出上界，不需要 case-by-case 分析。

**与 ALWZ 的技术对应**：

| ALWZ | FKNP |
|------|------|
| spread set system：$\|\mathcal{F}_T\|/\|\mathcal{F}\|\le\kappa^{-\|T\|}$ | spread measure：$\mu(\{S:S\supseteq T\})\le q^{\|T\|}$ |
| random restriction $W\sim U(X,p)$ | random subset exposure $X_p$ |
| encoding argument：bad pair 计数 | spread hitting lemma 中极小元的选择论证 |
| reduction step：用 $W$ 把大 $S$ 替换为小 $S'$ | 多轮暴露：每轮消灭部分剩余极小元 |
| 目标：robust sunflower | 目标：threshold upper bound $p_c\le Kq_f\log\ell$ |

**应用：Hamiltonicity**：FKNP 给出 $p_c(\text{Ham})\le K\cdot q_f(\text{Ham})\cdot\log n=O(\frac{\log^2 n}{n})$。已知精确阈值是 $p_c\sim\frac{\log n}{n}$，差一个 $\log n$ 因子——正是 universal bound 中 $\log\ell$ 的代价（$\ell=n$）。

---

## 6. 我没完全懂的地方

- [ ] Lemma A 的 LP 对偶精确形式：primal 和 dual 的具体变量是什么？对偶间隙的常数损失出自哪里？
- [ ] Lemma B 的完整 spread hitting 论证：多轮暴露中每轮的命中概率如何从 spread 条件推出？
- [ ] $q_f$ 对 expander spanning tree 的计算是否可行？$\ell$ 是 $n$ 还是更小？

---

## 7. 和我研究方向的关系

- 阈值理论提供了统一的上界框架。Expand random subgraph 中 spanning tree 存在性的阈值可以用 FKNP 框架给出 $q_f\log\ell$ 的上界——但需要先算 $q_f$
- Spread 测度的条件——"没有哪条边有特权"——与 expander 随机子图中 embedding 的条件概率分析直接对应
- [[Pham–Sah–Sawhney–Simkin (2022) — A toolkit for robust thresholds]] 的构造性改进可能在 expander setting 中去掉对数损失
- [[Talagrand — Are many small sets explicitly small]] 给出了 $q_f$ 的原始动机
- [[Alweiss-Lovett-Wu-Zhang-2021-Improved-bounds-for-the-sunflower-lemma]] 是 spread 概念的起源

---

## 8. 后续计划

- [ ] 深入 Lemma A 的 LP 对偶细节
- [ ] 逐轮跟踪 Lemma B 的 spread hitting 论证
- [ ] 尝试对 expander spanning tree 计算 $q_f$

### 逻辑链

$$
\begin{aligned}
\text{Talagrand (2010)} &\longrightarrow q_f\text{ 概念 + 猜想} \\
\text{FKNP (2019/2021)} &\longrightarrow \text{spread measure + Talagrand 猜想的证明（LP 对偶 + hitting lemma）} \\
\text{Park–Pham (2022)} &\longrightarrow \text{Kahn–Kalai 猜想的证明（用 } q \text{ 代替 } q_f\text{）} \\
\text{PSSS (2022)} &\longrightarrow \text{对具体 robust threshold 问题用 nibble 去对数损失}
\end{aligned}
$$

PSSS 不是 "FKNP 的升级版去 log"——它处理的是不同的设定（需要可构造 spread 结构和 nibble 可行性），适用范围更窄但局部更强。


