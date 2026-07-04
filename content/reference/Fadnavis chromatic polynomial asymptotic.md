---
tags:
  - graph_colouring
  - chromatic_polynomial
  - asymptotic_enumeration
category: theorems-tools-methods
aliases:
  - Fadnavis 色多项式渐近公式
  - bounded-degree chromatic polynomial asymptotic
---

## 定理陈述

固定 $\Delta \ge 1$。设 $G$ 是一个简单图，满足：

- $v=v(G)$ 个顶点；
- $e=e(G)$ 条边；
- $T$ 个三角形；
- 最大度 $\Delta(G)\le \Delta$。

则当 $q\to\infty$ 时，

$$
P_G(q)
=q^v
\exp\left(
-\frac{e}{q}
-\frac{e/2+T}{q^2}
+O_\Delta\left(\frac{v}{q^3}\right)
\right),
$$

其中 $P_G(q)$ 是 $G$ 的 chromatic polynomial，也就是 $G$ 的 proper $q$-colourings 的数量。误差项中的常数只依赖于 $\Delta$，并且该估计对所有最大度至多为 $\Delta$ 的图 $G$ 一致成立。

也就是说，$q^v$ 是自由染色数，指数因子是边和三角形带来的修正。

---

## 直观理解

若没有边，$G$ 的每个顶点都可以独立选择 $q$ 种颜色，因此有 $q^v$ 种染色。

加入边之后，每条边要求两个端点颜色不同。对大 $q$ 来说，一条边造成冲突的概率约为 $1/q$，所以第一阶修正是

$$
\exp\left(-\frac{e}{q}\right).
$$

但不同边之间并不完全独立。二阶项

$$
-\frac{e/2+T}{q^2}
$$

记录了局部依赖的主要贡献：

- $e/2$ 来自单条边约束的二阶展开；
- $T$ 来自三角形造成的三边相关性。

因此这个定理可以看作是：在最大度有界时，色多项式的前两阶渐近只由边数和三角形数决定，更高阶结构被统一吸收到

$$
O_\Delta\left(\frac{v}{q^3}\right)
$$

中。

---

## 使用场景

这个估计适合用于如下情况：

1. 有一个最大度有界的辅助图 $G$；
2. 需要估计 $G$ 的 proper $q$-colourings 数量；
3. $q$ 足够大；
4. 只需要精确到指数中的 $1/q^2$ 阶。

在随机图、随机边染色、rainbow embedding 或 conflict graph 方法中，常会构造一个辅助图 $G$，使得 proper colouring 对应于某种合法选择。此时该定理把计数问题化成了对 $v,e,T$ 的估计。

---

## 常用形式

取对数得到

$$
\log P_G(q)
=
v\log q
-\frac{e}{q}
-\frac{e/2+T}{q^2}
+O_\Delta\left(\frac{v}{q^3}\right).
$$

等价地，

$$
\frac{P_G(q)}{q^v}
=
\exp\left(
-\frac{e}{q}
-\frac{e/2+T}{q^2}
+O_\Delta\left(\frac{v}{q^3}\right)
\right).
$$

这个形式更清楚地表示：随机给每个顶点独立均匀分配 $q$ 种颜色时，得到 proper colouring 的概率约为右侧指数因子。

---

## 来源

该定理在如下论文中作为 Theorem 4.1 被引用：

- Hong Liu, Guorui Ma, Yangrui Xiang, Zhifei Yan, *The sharp threshold for rainbow stackings of random edge-colourings*, arXiv:2606.31376, 2026.

其中 “Fadnavis [3]” 指向：

- Sukhada Fadnavis, *A note on the shameful conjecture*, European Journal of Combinatorics 47 (2015), 115--122. arXiv:1502.06032.

---

## See also

- [[染色多项式（chromatic polynomial）]] -- $P_G(q)$ 的基本定义、性质和例子
- [[Lovász Local Lemma (LLL)]] -- 另一种处理局部依赖的存在性工具
- [[Janson inequality]] -- 处理相关事件下尾概率的常用工具
