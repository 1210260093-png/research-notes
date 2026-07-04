---
tags:
  - probabilistic_method
category: theorems-tools-methods
---

## 1. 记号

设
$$
X \sim \operatorname{Hyp}(N,K,t),
$$
表示从一个大小为 $N$ 的总体中，其中有 $K$ 个“成功元素”，**不放回**抽取 $t$ 个，随机变量 $X$ 表示抽到的成功元素个数。

其均值为
$$
\mu := \mathbb{E}X = \frac{tK}{N}.
$$

---

## 2. 定理陈述（加法型尾界）

一个标准的超几何分布尾界是：

对任意 $a>0$，
$$
\Pr(X \ge \mu + a)\le \exp\!\left(-\frac{2a^2}{t}\right),
$$

$$
\Pr(X \le \mu - a)\le \exp\!\left(-\frac{2a^2}{t}\right).
$$

因而
$$
\Pr(|X-\mu|\ge a)\le 2\exp\!\left(-\frac{2a^2}{t}\right).
$$

这可以看作是 **Hoeffding inequality for sampling without replacement**。

---

## 3. 常用特例

若取
$$
a=\delta K,
$$
则
$$
\Pr\!\left(\left|X-\frac{tK}{N}\right|\ge \delta K\right)
\le
2\exp\!\left(-\frac{2\delta^2K^2}{t}\right).
$$

若再用 $t\le N$，则进一步有
$$
\Pr\!\left(\left|X-\frac{tK}{N}\right|\ge \delta K\right)
\le
2\exp\!\left(-\frac{2\delta^2K^2}{N}\right).
$$

这正是随机图过程中最常见的使用形式。

---

## 4. 直观理解

超几何分布对应的是 **不放回抽样**，而二项分布对应的是 **独立放回抽样**。

直觉上，不放回抽样会带来某种“负相关”，所以它的波动不会比独立抽样更大。  
因此，超几何分布也满足与二项分布同量级的 Hoeffding/Chernoff 型集中不等式。

可以把 $X$ 看成
$$
X=Y_1+\cdots+Y_t,
$$
其中每个 $Y_i\in\{0,1\}$，表示第 $i$ 次抽样是否成功。虽然这些 $Y_i$ 不独立，但由于是不放回抽样，仍然可以得到类似 Hoeffding 的尾界。

---

## 5. 在随机图过程中的典型用法

设宿主图 $G$ 有
$$
N=e(G)
$$
条边，并把这些边作均匀随机排序。令 $G_t$ 为前 $t$ 条边组成的随机子图。

若固定两个点集 $U,V$，并记
$$
K:=e_G(U,V),
$$
那么
$$
X_t:=e_{G_t}(U,V)
$$
满足
$$
X_t \sim \operatorname{Hyp}(N,K,t),
$$
因为这正是在 $N$ 条边里，其中有 $K$ 条属于 $E_G(U,V)$，随机抽出前 $t$ 条边后，落在 $E_G(U,V)$ 中的条数。

于是
$$
\mathbb E X_t=\frac{tK}{N},
$$
并且
$$
\Pr\!\left(\left|X_t-\frac{tK}{N}\right|\ge \delta K\right)
\le
2\exp\!\left(-\frac{2\delta^2K^2}{t}\right).
$$

这正是论文中常写的那句：

> Since $X_t\sim \operatorname{Hyp}(N,K,t)$, a standard tail bound for the hypergeometric distribution yields ...

---

## 6. 与 [[Chernoff Bound]] 的关系

超几何尾界可以看作是固定样本量模型中的 **Chernoff-type concentration**。

设
$$
X\sim \operatorname{Hyp}(N,K,t).
$$
它对应的是：在 $N$ 个元素中，其中 $K$ 个是“成功”，然后 **不放回** 地抽取恰好 $t$ 个。

相比之下，Chernoff bound 通常处理的是独立 Bernoulli 和。因此二者的区别是：

- 二项分布：独立抽样；
- 超几何分布：不放回抽样、样本量固定。

在随机图应用中：

- $G(n,p)$ 是独立保留边模型，所以常用 Chernoff bound；
- $G_t$ 是固定边数模型，所以常用 hypergeometric tail bound。

---

## 7. 一个标准比较：在 $G(n,p)$ 中用 Chernoff 与 hypergeometric tail bound 控制 $e(U,V)$

设 $U,V\subseteq [n]$ 不交，记
$$
K:=|U||V|,
\qquad
N:=\binom{n}{2},
\qquad
X:=e_{G(n,p)}(U,V).
$$
则
$$
\mu:=\mathbb E X=pK.
$$

我们比较两种做法。

### 7.1 直接在 $G(n,p)$ 中使用 Chernoff bound

因为 $G(n,p)$ 中每条边独立出现，而 $U,V$ 之间共有 $K$ 条可能边，所以
$$
X\sim \operatorname{Bin}(K,p).
$$
因此对任意 $0<\varepsilon\le 1$，Chernoff bound 给出
$$
\Pr(|X-\mu|\ge \varepsilon \mu)
\le
2\exp\!\left(-\frac{\varepsilon^2\mu}{3}\right)
=
2\exp\!\left(-\frac{\varepsilon^2 pK}{3}\right).
$$

也就是说，指数项的量级是
$$
\exp\big(-\Theta(\varepsilon^2 pK)\big).
$$

### 7.2 先条件到固定边数模型，再使用超几何尾界

令
$$
M:=e(G(n,p)).
$$
则
$$
M\sim \operatorname{Bin}(N,p),
\qquad \mathbb E M=pN.
$$

在条件 $M=m$ 下，随机图就变成了均匀的 $G(n,m)$。此时
$$
X\mid (M=m)\sim \operatorname{Hyp}(N,K,m),
$$
因为这是从全部 $N$ 条可能边中恰好选出 $m$ 条，其中有 $K$ 条属于 $E(U,V)$。

此时条件均值为
$$
\mu_m:=\mathbb E[X\mid M=m]=\frac{mK}{N}.
$$

对超几何分布使用加法型 Hoeffding 尾界：
$$
\Pr(|X-\mu_m|\ge a\mid M=m)\le 2\exp\!\left(-\frac{2a^2}{m}\right).
$$

取
$$
a=\varepsilon \mu_m=\varepsilon\frac{mK}{N},
$$
便得到
$$
\Pr(|X-\mu_m|\ge \varepsilon \mu_m\mid M=m)
\le
2\exp\!\left(-2\varepsilon^2\frac{mK^2}{N^2}\right).
$$

在典型情形 $m=(1+o(1))pN$ 下，这变成
$$
\Pr(|X-\mu_m|\ge \varepsilon \mu_m\mid M=m)
\le
2\exp\!\left(-\Theta\!\left(\varepsilon^2 p\frac{K^2}{N}\right)\right).
$$

所以这里指数项的量级是
$$
\exp\big(-\Theta(\varepsilon^2 p K^2/N)\big).
$$

### 7.3 二者比较

两种指数分别是：

- Chernoff:
  $$
  \exp\big(-\Theta(\varepsilon^2 pK)\big);
  $$
- 超几何的加法型 Hoeffding:
  $$
  \exp\big(-\Theta(\varepsilon^2 pK^2/N)\big).
  $$

二者相差一个因子
$$
\frac{K}{N}.
$$

也就是说：

- 当 $K=\Theta(N)$ 时，两者给出的结果是 **同阶** 的；
- 当 $K=o(N)$ 时，超几何的这个加法型尾界明显 **更弱**。

### 7.4 两个典型例子

#### 例 1：大点集

若 $|U|,|V|=\Theta(n)$，则
$$
K=|U||V|=\Theta(n^2)=\Theta(N).
$$
于是

- Chernoff 给出
  $$
  \Pr(|X-\mu|\ge \varepsilon\mu)\le \exp(-\Theta(\varepsilon^2 p n^2));
  $$
- 超几何加法型尾界也给出
  $$
  \Pr(|X-\mu_m|\ge \varepsilon\mu_m\mid M=m)\le \exp(-\Theta(\varepsilon^2 p n^2)).
  $$

此时二者本质上一样好。

#### 例 2：较小点集

若 $|U|=|V|=n^{2/3}$，则
$$
K=n^{4/3},
\qquad
N=\Theta(n^2).
$$
于是

- Chernoff 给出
  $$
  \Pr(|X-\mu|\ge \varepsilon\mu)\le \exp(-\Theta(\varepsilon^2 p n^{4/3}));
  $$
- 超几何加法型尾界只给出
  $$
  \Pr(|X-\mu_m|\ge \varepsilon\mu_m\mid M=m)\le \exp(-\Theta(\varepsilon^2 p n^{2/3})).
  $$

这里超几何加法型尾界弱了很多。

### 7.5 结论

在 $G(n,p)$ 中，若直接研究固定 cut 上的边数，**Chernoff bound 通常更锋利**，因为这里边是独立出现的。

而超几何加法型尾界更适合固定边数模型 $G(n,m)$ 或随机图过程；它在 $K=\Theta(N)$ 的“大 cut”情形下已经足够强，但对较小的 $K$ 会损失一个 $K/N$ 因子。

这也解释了为什么在 Lemma 3.2 那类证明里，只考虑 $|U|,|V|$ 足够大的集合：此时
$$
K=e_G(U,V)\ \text{达到线性级别},
$$
所以超几何加法型尾界已经够用了。

