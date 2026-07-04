---
tags:
  - probabilistic_method
category: theorems-tools-methods
---

## 核心作用

Janson inequality 用来处理下面这种问题：

> 有很多个候选结构，每个结构都需要若干个随机元素同时出现。我们想证明，至少有一个候选结构出现。

比如在 $G(n,p)$ 中证明存在一个固定图 $H$ 的拷贝：

- 每个 $H$ 的拷贝都是一个候选结构；
- 这个拷贝出现，等价于它的所有边都被随机选中；
- 令 $X$ 表示出现的候选结构数量；
- 目标通常是证明 $X>0$ whp，也就是证明

$$
\mathbb{P}(X=0)=o(1).
$$

Janson inequality 的核心信息是：

> 如果候选结构的期望数量很大，而且不同候选结构之间的重叠依赖不太严重，那么“一个都没有”的概率会很小，甚至指数小。

---

## 人话版本

我们有一大堆候选对象。

每个候选对象 $A$ 是否出现，由一个指标变量 $I_A$ 表示：

- 如果 $A$ 出现，则 $I_A=1$；
- 如果 $A$ 不出现，则 $I_A=0$。

于是

$$
X=\sum_A I_A
$$

就是出现的候选对象总数。

如果 $\mathbb{E}X$ 很大，直觉上应该有很多候选对象出现。但是这些候选对象之间可能不独立，因为它们可能共享一些随机元素。

Janson inequality 的作用就是量化：

> 只要这些重叠带来的总依赖不太大，那么 $X=0$ 的概率很小。

---

## 标准设定

令 $\Omega$ 是所有可能被随机选择的基础元素。

令 $\Omega_p$ 表示从 $\Omega$ 中独立地保留每个元素，保留概率为 $p$，得到的随机子集。

给定一族候选结构 $\mathcal{A}$。每个 $A\in\mathcal{A}$ 本身是 $\Omega$ 的一个子集。

也就是说，

$$
A\subseteq \Omega.
$$

事件“$A$ 出现”就是

$$
A\subseteq \Omega_p.
$$

对每个 $A\in\mathcal{A}$，定义指标变量

$$
I_A=\mathbf{1}_{\{A\subseteq \Omega_p\}}.
$$

令

$$
X=\sum_{A\in\mathcal{A}} I_A.
$$

因此 $X$ 计数有多少个候选结构被完整保留下来。

定义

$$
\mu=\mathbb{E}X.
$$

也就是

$$
\mu=\sum_{A\in\mathcal{A}}\mathbb{P}(A\subseteq \Omega_p).
$$

如果每个元素都以概率 $p$ 独立保留，那么

$$
\mathbb{P}(A\subseteq \Omega_p)=p^{|A|}.
$$

所以

$$
\mu=\sum_{A\in\mathcal{A}} p^{|A|}.
$$

---

## 依赖项 $\Delta$

Janson inequality 不仅看 $\mu$，还要看候选结构之间的重叠。

两个候选结构 $A,B$ 如果不相交，那么事件 $A\subseteq\Omega_p$ 和 $B\subseteq\Omega_p$ 独立。

真正造成依赖的是

$$
A\cap B\neq \varnothing.
$$

定义依赖项

$$
\Delta=
\sum_{\substack{
A,B\in\mathcal{A}\\
A\neq B\\
A\cap B\neq\varnothing
}}
\mathbb{E}(I_A I_B).
$$

这里 $\Delta$ 是对有序对 $(A,B)$ 求和。

由于

$$
I_A I_B=\mathbf{1}_{\{A\cup B\subseteq \Omega_p\}},
$$

所以

$$
\mathbb{E}(I_A I_B)
=
\mathbb{P}(A\cup B\subseteq \Omega_p).
$$

在独立保留概率为 $p$ 的模型中，

$$
\mathbb{E}(I_A I_B)=p^{|A\cup B|}.
$$

因此

$$
\Delta=
\sum_{\substack{
A,B\in\mathcal{A}\\
A\neq B\\
A\cap B\neq\varnothing
}}
p^{|A\cup B|}.
$$

直观上：

- $\mu$ 衡量候选结构的期望数量；
- $\Delta$ 衡量候选结构之间的总重叠依赖；
- $\mu$ 越大越好；
- $\Delta$ 越小越好。

---

## Janson inequality：零点形式

在上述设定下，有

$$
\mathbb{P}(X=0)
\le
\exp\left(
-\mu+\frac{\Delta}{2}
\right).
$$

这是最常用的零点形式。

它说明：如果 $\mu$ 很大，并且 $\Delta$ 相比 $\mu$ 很小，那么 $X=0$ 的概率接近 $\exp(-\mu)$。

特别地，如果

$$
\Delta=o(\mu),
$$

那么

$$
\mathbb{P}(X=0)
\le
\exp\left(-(1-o(1))\mu\right).
$$

---

## Lower tail 形式

更一般地，对任意 $0\le \delta\le 1$，有

$$
\mathbb{P}\left(X\le (1-\delta)\mu\right)
\le
\exp\left(
-\frac{\delta^2\mu^2}{2(\mu+\Delta)}
\right).
$$

取 $\delta=1$，得到另一个常用的零点形式：

$$
\mathbb{P}(X=0)
\le
\exp\left(
-\frac{\mu^2}{2(\mu+\Delta)}
\right).
$$

这个形式在很多随机图证明里更稳定，因为只要能证明

$$
\Delta=o(\mu^2)
$$

并且

$$
\mu\to\infty,
$$

就能推出

$$
\mathbb{P}(X=0)=o(1).
$$

---

## 两个常用判断标准

### 标准 1：只想证明存在

如果

$$
\Delta=o(\mu^2)
$$

并且

$$
\mu\to\infty,
$$

那么

$$
\mathbb{P}(X=0)=o(1).
$$

所以

$$
X>0
$$

whp。

这是证明“至少存在一个结构”的常用标准。

### 标准 2：想要指数小概率

如果

$$
\Delta=O(\mu),
$$

那么

$$
\mathbb{P}(X=0)
\le
\exp(-\Omega(\mu)).
$$

如果进一步

$$
\Delta=o(\mu),
$$

那么

$$
\mathbb{P}(X=0)
\le
\exp\left(-(1-o(1))\mu\right).
$$

这个版本适合配合 union bound 使用。

---

## 随机图中的翻译

在 $G(n,p)$ 中，底层随机元素是边。

所以取

$$
\Omega=E(K_n).
$$

随机子集 $\Omega_p$ 就是

$$
E(G(n,p)).
$$

如果我们想数固定图 $H$ 的拷贝，则令 $\mathcal{H}$ 是 $K_n$ 中所有与 $H$ 同构的拷贝。

对每个拷贝 $H'\in\mathcal{H}$，把它看成边集

$$
E(H')\subseteq E(K_n).
$$

定义

$$
X=\#\{H'\subseteq G(n,p): H'\cong H\}.
$$

也就是

$$
X=\sum_{H'\in\mathcal{H}} \mathbf{1}_{\{E(H')\subseteq E(G(n,p))\}}.
$$

于是

$$
\mu=\mathbb{E}X=|\mathcal{H}|p^{e(H)}.
$$

依赖项为

$$
\Delta=
\sum_{\substack{
H_1,H_2\in\mathcal{H}\\
H_1\neq H_2\\
E(H_1)\cap E(H_2)\neq\varnothing
}}
p^{e(H_1\cup H_2)}.
$$

因此

$$
\mathbb{P}(G(n,p)\text{ contains no copy of }H)
\le
\exp\left(
-\frac{\mu^2}{2(\mu+\Delta)}
\right).
$$

---

## 如何估计 $\Delta$

估计 $\Delta$ 的核心是：按照两个候选结构的重叠类型分类。

在随机图中，两个 $H$-拷贝 $H_1,H_2$ 的贡献是

$$
p^{e(H_1\cup H_2)}.
$$

如果它们共享一个子图 $J$，那么

$$
e(H_1\cup H_2)=2e(H)-e(J).
$$

所以这类 pair 的贡献大约是

$$
\#\{(H_1,H_2):H_1\cap H_2\cong J\}
p^{2e(H)-e(J)}.
$$

因此常见做法是：

1. 枚举可能的重叠子图 $J$；
2. 估计有多少对拷贝交于 $J$；
3. 对所有 $J$ 的贡献求和；
4. 证明总和 $\Delta$ 足够小。

---

## 使用模板

要证明某个随机结构 whp 存在，可以这样写。

### Step 1：定义候选结构

令 $\mathcal{A}$ 为所有候选结构组成的集合。

例如，$\mathcal{A}$ 可以是：

- 所有 $H$ 的拷贝；
- 所有连接两个点的短路径；
- 所有 absorbing structures；
- 所有 connectors；
- 所有满足某种扩展性质的小结构。

### Step 2：定义计数变量

令

$$
X=\sum_{A\in\mathcal{A}} I_A.
$$

其中 $I_A$ 表示候选结构 $A$ 是否出现。

目标是证明

$$
X>0
$$

whp。

### Step 3：估计期望

计算

$$
\mu=\mathbb{E}X.
$$

通常需要证明

$$
\mu\to\infty.
$$

如果之后还要 union bound，通常需要更强的估计，例如

$$
\mu\gg \log n.
$$

### Step 4：估计依赖项

计算

$$
\Delta=
\sum_{\substack{
A,B\in\mathcal{A}\\
A\neq B\\
A\cap B\neq\varnothing
}}
\mathbb{E}(I_A I_B).
$$

通常通过重叠类型分类来估计。

### Step 5：套用 Janson inequality

由 Janson inequality，

$$
\mathbb{P}(X=0)
\le
\exp\left(
-\frac{\mu^2}{2(\mu+\Delta)}
\right).
$$

如果

$$
\Delta=o(\mu^2)
$$

并且

$$
\mu\to\infty,
$$

那么

$$
\mathbb{P}(X=0)=o(1).
$$

所以目标结构 whp 存在。

---

## 和二阶矩法的关系

二阶矩法通常给出

$$
\mathbb{P}(X=0)
\le
\frac{\operatorname{Var}(X)}{\mu^2}.
$$

它的目标是证明

$$
\operatorname{Var}(X)=o(\mu^2).
$$

Janson inequality 更专门地处理 lower tail，尤其是 $X=0$。

它给出的是指数型估计：

$$
\mathbb{P}(X=0)
\le
\exp\left(
-\frac{\mu^2}{2(\mu+\Delta)}
\right).
$$

所以 Janson inequality 往往比二阶矩法更适合做 union bound。

简单理解：

> 二阶矩法证明“存在”；Janson inequality 证明“不存在的概率很小”。

---

## 什么时候适合用 Janson inequality

适合用 Janson inequality 的典型场景：

- $X$ 是很多局部候选结构的计数；
- 每个候选结构依赖于少量随机元素；
- 不同候选结构之间的依赖主要来自重叠；
- 目标是证明 $X>0$，或者证明 $X$ 不会远小于期望。

随机图中常见应用包括：

- 固定子图的出现；
- 两个大集合之间存在边；
- 两个点之间存在短路径；
- 存在 connector；
- 存在 absorbing structure；
- 存在某种局部扩展结构；
- 对所有点对或集合对同时证明某种连接性质。

---

## 常见错误

### 错误 1：把所有 pair 都放进 $\Delta$

$\Delta$ 只统计有依赖的 pair。

在随机图中，如果两个候选结构的边集不交，那么它们对应的事件独立，不需要计入 $\Delta$。

也就是说，只需要考虑

$$
E(H_1)\cap E(H_2)\neq\varnothing
$$

的 pair。

---

### 错误 2：混淆有序对和无序对

这里定义的 $\Delta$ 是对有序对 $(A,B)$ 求和。

也就是说，$(A,B)$ 和 $(B,A)$ 都被计入。

在这个约定下，常用形式是

$$
\mathbb{P}(X=0)
\le
\exp\left(
-\mu+\frac{\Delta}{2}
\right).
$$

如果 $\Delta$ 改成无序对求和，那么公式里的常数会相应变化。

---

### 错误 3：认为 $\Delta=o(\mu^2)$ 就一定给出 $\exp(-\Omega(\mu))$

不一定。

由

$$
\mathbb{P}(X=0)
\le
\exp\left(
-\frac{\mu^2}{2(\mu+\Delta)}
\right)
$$

可知，如果 $\Delta=o(\mu^2)$，只能保证指数趋于无穷，从而得到 $o(1)$。

要得到

$$
\mathbb{P}(X=0)\le \exp(-\Omega(\mu)),
$$

通常需要

$$
\Delta=O(\mu).
$$

要得到接近独立情形的估计

$$
\mathbb{P}(X=0)\le \exp(-(1-o(1))\mu),
$$

通常需要

$$
\Delta=o(\mu).
$$

---

### 错误 4：用 Janson inequality 估计 upper tail

Janson inequality 主要控制 lower tail：

$$
X\le (1-\delta)\mathbb{E}X.
$$

尤其适合控制

$$
X=0.
$$

它不是 upper tail 工具。

如果要估计

$$
\mathbb{P}(X\ge (1+\delta)\mathbb{E}X),
$$

通常需要 Chernoff、Kim--Vu、Warnke 或 container 方法。

---

## 一个最简单的例子

令 $A,B\subseteq V(G)$ 是两个不交点集。想证明在 $G(n,p)$ 中，$A$ 和 $B$ 之间至少有一条边。

候选结构是 $A$ 和 $B$ 之间的边。

令

$$
X=e_{G(n,p)}(A,B).
$$

那么

$$
\mu=\mathbb{E}X=p|A||B|.
$$

不同边事件彼此独立，所以

$$
\Delta=0.
$$

Janson inequality 给出

$$
\mathbb{P}(e_{G(n,p)}(A,B)=0)
\le
\exp(-p|A||B|).
$$

这和直接计算

$$
(1-p)^{|A||B|}
\le
\exp(-p|A||B|)
$$

一致。

这个例子说明：Janson inequality 可以看成是“有依赖版本”的独立事件乘法估计。

---

## 直觉总结

如果所有候选结构完全独立，那么

$$
\mathbb{P}(X=0)
\approx
\exp(-\mu).
$$

现实中候选结构往往不独立，因为它们会重叠。

Janson inequality 说：

> 只要总重叠依赖 $\Delta$ 不大，那么 $\mathbb{P}(X=0)$ 仍然接近独立情形。

所以它的核心逻辑是：

- $\mu$ 控制候选结构的数量；
- $\Delta$ 控制候选结构之间的重叠依赖；
- $\mu$ 大且 $\Delta$ 小，推出 $X=0$ 的概率小。

---

## 参考文献

- N. Alon and J. H. Spencer, *The Probabilistic Method*.
- S. Janson, T. Łuczak and A. Ruciński, *Random Graphs*.
- S. Janson, “Poisson approximation for large deviations”, *Random Structures & Algorithms*.

## See also
- [[Chernoff Bound]] — 独立和的集中不等式；Janson 处理有重叠依赖的候选结构
- [[Lovász Local Lemma (LLL)]] — 另一种处理”依赖不太严重”的工具，但使用场景不同（存在性 vs. 下尾概率）

