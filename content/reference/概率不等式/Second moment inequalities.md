---
tags:
  - probabilistic_method
  - second_moment_method
category: theorems-tools-methods
---

## 核心作用

二阶矩法里经常令 $Z$ 表示某类目标对象的个数。因为 $Z\ge 0$，证明 $Z>0$ 以高概率发生，就等于证明目标对象存在。

这里最常用的两个工具是：

- **Paley-Zygmund inequality**：直接给出 $\mathbb P(Z>0)$ 的下界；
- **Chebyshev inequality**：先证明 $Z$ 集中在 $\mathbb EZ$ 附近，再推出 $Z$ 不可能为 $0$。

它们都使用二阶矩信息，但表达方式不同：Paley-Zygmund 更偏存在性，Chebyshev 更偏集中性。

---

## 两个不等式

> [!theorem] Paley-Zygmund inequality
> 设 $Z\ge 0$ 且 $0<\mathbb EZ^2<\infty$。则
> $$
> \mathbb P(Z>0)\ge \frac{(\mathbb EZ)^2}{\mathbb EZ^2}.
> $$
> 更一般地，对任意 $0<\theta<1$，
> $$
> \mathbb P(Z\ge \theta\mathbb EZ)
> \ge
> (1-\theta)^2\frac{(\mathbb EZ)^2}{\mathbb EZ^2}.
> $$

> [!danger] Chebyshev inequality
> 设 $Z$ 方差有限。则对任意 $a>0$，
> $$
> \mathbb P(|Z-\mathbb EZ|\ge a)
> \le
> \frac{\operatorname{Var}(Z)}{a^2}.
> $$

Paley-Zygmund 也可以写成方差形式：
$$
\mathbb P(Z\ge \theta\mathbb EZ)
\ge
\frac{(1-\theta)^2}{1+\operatorname{Var}(Z)/(\mathbb EZ)^2}.
$$

这个形式清楚地说明：只要 $\operatorname{Var}(Z)$ 相比 $(\mathbb EZ)^2$ 不大，$Z$ 就有不小概率达到自己期望的常数比例。

---

## 对比

| 比较点 | Paley-Zygmund | Chebyshev |
| --- | --- | --- |
| 适用对象 | 非负随机变量 $Z\ge 0$ | 一般随机变量 |
| 主要用途 | 证明 $Z>0$ 有正概率，甚至高概率 | 证明 $Z$ 集中在 $\mathbb EZ$ 附近 |
| 用到的信息 | $\mathbb EZ$ 和 $\mathbb EZ^2$ | $\operatorname{Var}(Z)=\mathbb EZ^2-(\mathbb EZ)^2$ |
| 二阶矩法中的作用 | 直接给出存在性 | 通过方差小推出存在性 |
| 结论形式 | 下界：$\mathbb P(Z>0)\ge \cdots$ | 上界：$\mathbb P(Z=0)\le \cdots$ |

一句话：

> Paley-Zygmund 是“证明非负随机变量不为零”的工具；Chebyshev 是“证明随机变量接近期望”的工具。

---

## 二阶矩法模板

令 $Z=\sum_{A\in\mathcal A} I_A$，其中 $I_A$ 是候选对象 $A$ 出现的指标变量。第一矩是 $\mathbb EZ=\sum_A\mathbb E I_A$，第二矩是 $\mathbb EZ^2=\sum_{A,B}\mathbb E(I_A I_B)$。

关键是控制候选对象之间的重叠依赖。通常目标是证明
$$
\mathbb EZ^2=(1+o(1))(\mathbb EZ)^2.
$$

这等价于 $\operatorname{Var}(Z)=o((\mathbb EZ)^2)$。此时 Paley-Zygmund 和 Chebyshev 都能推出 $\mathbb P(Z>0)=1-o(1)$。

---

## 用 Paley-Zygmund 推存在性

如果已经证明 $\mathbb EZ^2=(1+o(1))(\mathbb EZ)^2$，那么 Paley-Zygmund 直接给出
$$
\mathbb P(Z>0)
\ge
\frac{(\mathbb EZ)^2}{\mathbb EZ^2}
=1-o(1).
$$

这一步很干净，因为不等式本身就是 $Z>0$ 的概率下界。

更弱地，如果只知道 $\mathbb EZ^2\le C(\mathbb EZ)^2$，其中 $C$ 是常数，也能得到 $\mathbb P(Z>0)\ge 1/C$。所以 Paley-Zygmund 不一定要求方差是 $o((\mathbb EZ)^2)$；它也常用于先证明一个正的常数概率。

---

## 用 Chebyshev 推存在性

如果 $\operatorname{Var}(Z)=o((\mathbb EZ)^2)$，那么 Chebyshev 给出
$$
\mathbb P(Z=0)
\le
\mathbb P(|Z-\mathbb EZ|\ge \mathbb EZ)
\le
\frac{\operatorname{Var}(Z)}{(\mathbb EZ)^2}
=o(1).
$$

于是 $\mathbb P(Z>0)=1-o(1)$。

Chebyshev 的优势是结论更像集中性：在同样的方差条件下，实际上有 $Z=(1+o(1))\mathbb EZ$ whp。因此如果文章不仅需要存在，还需要“数量接近期望”，Chebyshev 的语言更自然。

---

## 文章语境中的例子

假设在某篇文章里，$Z$ 是 rainbow stackings 的个数。因此 $Z\ge 0$。作者证明了
$$
\mathbb EZ^2=(1+o(1))(\mathbb EZ)^2.
$$

用 Paley-Zygmund，马上得到
$$
\mathbb P(Z>0)
\ge
\frac{(\mathbb EZ)^2}{\mathbb EZ^2}
=1-o(1).
$$

如果改用 Chebyshev，也可以。因为 $\operatorname{Var}(Z)=\mathbb EZ^2-(\mathbb EZ)^2=o((\mathbb EZ)^2)$，所以
$$
\mathbb P(Z=0)
\le
\frac{\operatorname{Var}(Z)}{(\mathbb EZ)^2}
=o(1).
$$

所以同样得到 $\mathbb P(Z>0)=1-o(1)$。

两者在这里得到的结论一样。区别只是表达方式：Paley-Zygmund 更直接，因为它天然就是为证明“非负随机变量不为零”设计的；Chebyshev 更像是先证明 $Z$ 集中在均值附近，再推出它不可能为 $0$。

---

## 什么时候用哪个？

如果目标只是证明“至少存在一个对象”，Paley-Zygmund 往往更干净：
$$
\mathbb P(Z>0)\ge \frac{(\mathbb EZ)^2}{\mathbb EZ^2}.
$$

如果还想证明“对象数量接近其期望”，Chebyshev 更自然：
$$
\mathbb P(|Z-\mathbb EZ|\ge \varepsilon\mathbb EZ)
\le
\frac{\operatorname{Var}(Z)}{\varepsilon^2(\mathbb EZ)^2}.
$$

在随机图和随机组合里，常见选择是：

- 只要存在性：用 Paley-Zygmund；
- 要数量集中：用 Chebyshev；
- 若已经证明 $\mathbb EZ^2=(1+o(1))(\mathbb EZ)^2$，两者都能推出 $Z>0$ whp。

---

## 常用记忆版

Paley-Zygmund:
$$
\mathbb P(Z>0)\ge \frac{(\mathbb EZ)^2}{\mathbb EZ^2}.
$$

Chebyshev:
$$
\mathbb P(|Z-\mathbb EZ|\ge a)
\le
\frac{\operatorname{Var}(Z)}{a^2}.
$$

二阶矩法中最常见的充分条件：
$$
\mathbb EZ^2=(1+o(1))(\mathbb EZ)^2
\quad\Longrightarrow\quad
\mathbb P(Z>0)=1-o(1).
$$

---

## References

- N. Alon and J. H. Spencer, *The Probabilistic Method*, Wiley.
- S. Janson, T. Luczak, and A. Rucinski, *Random Graphs*, Wiley.
- M. Mitzenmacher and E. Upfal, *Probability and Computing*, Cambridge University Press.

## See also

- [[First moment method]]
- [[Janson inequality]]
- [[Chernoff Bound]]
- [[Hypergeometric tail bound]]
