---
tags:
  - graph_colouring
  - chromatic_polynomial
  - graph_polynomial
category: concepts
aliases:
  - chromatic polynomial
  - 色多项式
  - 染色多项式
---

## 定义

设 $G$ 是一个有限简单图。对正整数 $q$，记

$$
P_G(q)
$$

为 $G$ 的 proper $q$-colourings 的数量，也就是给每个顶点赋予 $q$ 种颜色之一，并要求每条边的两个端点颜色不同的染色数。

一个基本事实是：$P_G(q)$ 实际上是关于 $q$ 的一个多项式，称为 $G$ 的 **染色多项式** 或 **chromatic polynomial**。

---

## 基本性质

若 $G$ 有 $v$ 个顶点，则

$$
P_G(q)
$$

是一个次数为 $v$ 的首一多项式。

若 $G$ 有 $e$ 条边，则前两项为

$$
P_G(q)=q^v-eq^{v-1}+\cdots.
$$

特别地，

$$
\frac{P_G(q)}{q^v}
$$

可以解释为：随机独立地给每个顶点均匀选择 $q$ 种颜色之一时，得到 proper colouring 的概率。

---

## 删除-收缩递推

若 $e=xy$ 是 $G$ 的一条边，则有删除-收缩公式

$$
P_G(q)=P_{G-e}(q)-P_{G/e}(q),
$$

其中：

- $G-e$ 表示删除边 $e$；
- $G/e$ 表示把边 $e$ 的两个端点收缩成一个点。

这个递推是证明 $P_G(q)$ 为多项式的标准方法之一。

---

## 常见例子

空图 $\overline K_v$：

$$
P_{\overline K_v}(q)=q^v.
$$

完全图 $K_n$：

$$
P_{K_n}(q)=q(q-1)(q-2)\cdots(q-n+1).
$$

树 $T$，其中 $|V(T)|=v$：

$$
P_T(q)=q(q-1)^{v-1}.
$$

圈 $C_n$：

$$
P_{C_n}(q)=(q-1)^n+(-1)^n(q-1).
$$

---

## 与渐近计数的关系

当 $q$ 很大时，$P_G(q)$ 的主项是 $q^v$。边的限制会让 proper colouring 的数量减少，因此常研究

$$
\frac{P_G(q)}{q^v}.
$$

对最大度有界的图，[[Fadnavis chromatic polynomial asymptotic]] 给出更精细的指数型估计：

$$
P_G(q)
=q^v
\exp\left(
-\frac{e}{q}
-\frac{e/2+T}{q^2}
+O_\Delta\left(\frac{v}{q^3}\right)
\right),
$$

其中 $e$ 是边数，$T$ 是三角形数。

---

## 使用场景

染色多项式常用于：

1. 计数图的合法染色；
2. 研究图的可染性和染色数；
3. 把随机着色中“没有相邻同色”的概率写成一个多项式比值；
4. 在 conflict graph 方法中，把合法选择问题转化为 proper colouring 计数问题。

---

## See also

- [[Fadnavis chromatic polynomial asymptotic]] -- 最大度有界图的染色多项式大 $q$ 渐近公式
- [[Lovász Local Lemma (LLL)]] -- 通过局部依赖证明合法染色存在的工具
