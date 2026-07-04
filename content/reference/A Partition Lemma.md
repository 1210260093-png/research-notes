---
tags:
  - spanning_trees
  - probabilistic_method
source: Sharp threshold for the appearance of certain spanning trees in random graphs (Hefetz–Krivelevich–Szabó, 2012)
category: theorems-tools-methods
---

来自文章 Sharp threshold for the appearance of certain spanning trees in random graphs. (2012)

>[!example] A Partition Lemma
设 $G=(V,E)$ 是一个有 $n$ 个顶点、最大度为 $\Delta$ 的图。设 $Y\subseteq V$ 是一个包含 $m=a+b$ 个顶点的点集，其中 $a,b$ 是正整数。假设对每个 $v\in V$ 都有 $\deg_G(v,Y)\ge \delta$。如果
>$$\Delta^2\cdot \left\lceil \frac{m}{\min\{a,b\}} \right\rceil \cdot 2 \cdot e^{1-\frac{\min\{a,b\}^2}{5m^2}\delta}<1,$$
那么存在 $Y$ 的一个划分 $Y=A\cup B$，使得以下性质成立：
>
>(1) $|A|=a$ 且 $|B|=b$；
>
>(2) 对每个 $v\in V$，都有 $\deg_G(v,A)\ge \frac{a}{3m}\deg_G(v,Y)$；
>
>(3) 对每个 $v\in V$，都有 $\deg_G(v,B)\ge \frac{b}{3m}\deg_G(v,Y)$。

## Proof Outline (from ChatGPT)
### 证明的主线总结

因为 $\delta$ 有可能比较小，比如是一个常数，所以不能直接使用 [[Chernoff Bound]]，其需要
$$
\min\{\frac{a}{m},\frac{b}{m}\} \cdot \delta = \Omega(\log n).
$$
我们需要[[LLL]]来解决这个问题。

这个证明其实就是三步：

1. 把 $Y$ 分成 $\min\{a,b\}$ 个小组，每组随机选一个点到较小的那一边，于是自动得到精确大小；
2. 对固定顶点，落在这些组里的邻点贡献是独立和，所以可以用 Chernoff bound 控制它在两边的度；
3. 坏事件之间只有局部依赖，依赖度是 $\Delta^2\left\lceil m/\min\{a,b\}\right\rceil$ 级别，因此用 LLL 同时避开所有坏事件。

### 第一步：构造一个“精确大小”的随机划分

设 $s:=\min\{a,b\}$。不直接把每个点独立地放进 $A$，因为那样只能保证 $|A|$ 大约等于 $a$，不能保证恰好等于 $a$。设 $$r:=\left\lceil \frac{m}{s}\right\rceil.$$
把 $Y$ 任意分成 $s$ 组 $Y_1,\dots,Y_s$，使得每组大小至多 $r$。这是可以做到的，因为 $sr\ge m$。

接下来对每一组 $Y_i$，独立地做如下随机选择：

- 若 $a\le b$，就在每组里随机选出 **一个**点放进 $A$，其余点放进 $B$；
- 若 $b\le a$，则反过来，每组里随机选一个点放进 $B$，其余点放进 $A$。

先看 $a\le b$ 的情形。这样做之后，$A$ 一共正好得到 $s=a$ 个点，所以 $|A|=a$，而 $|B|=m-a=b$。  
因此条件 (1) 自动成立。

这一步解释了为什么引理条件里会出现 $\left\lceil \frac{m}{\min\{a,b\}}\right\rceil$：它就是每组大小的上界。

---

### 第二步：固定一个顶点，估计它在小的一边拿到的邻点数

仍看 $a\le b$。固定 $v\in V$，记 $d_Y(v):=\deg(v,Y)$。对每一组 $Y_i$，定义随机变量
$$X_i=\mathbf 1_{\{v\text{ 在 }Y_i\text{ 中的某个邻点被选入 }A\}},$$

那么：

- $X_1,\dots,X_a$ 相互独立，因为各组是独立随机选择的；
- $\deg(v,A)=\sum_{i=1}^a X_i$；
- 若 $t_i:=|N(v)\cap Y_i|$，则
 $$\mathbb E[X_i]=\frac{t_i}{|Y_i|}\ge \frac{t_i}{r},$$
  因为每组是均匀随机选一个点进 $A$，且 $|Y_i|\le r$。

于是
$$\mathbb E[\deg(v,A)]\ge \sum_{i=1}^a \frac{t_i}{r}=\frac{1}{r}\deg(v,Y).$$

又因为 $r=\left\lceil \frac{m}{a}\right\rceil\le \frac{2m}{a}$，所以 $\frac{1}{r}\ge \frac{a}{2m}$。因此
$$\mathbb E[\deg(v,A)]\ge \frac{a}{2m}\deg(v,Y).$$

现在我们希望证明 $\deg(v,A)$ 不会掉到 $\frac{a}{3m}\deg(v,Y)$ 以下。这相当于说它没有比期望值下降太多。由 [[Chernoff Bound]]可得

$$\Pr\left(\deg(v,A)<\frac{a}{3m}\deg(v,Y)\right) \le 2\exp\!\left(-\frac{a^2}{5m^2}\deg(v,Y)\right)$$

再利用 $\deg(v,Y)\ge \delta$，得到

$$\Pr\!\left(\deg(v,A)<\frac{a}{3m}\deg(v,Y)\right) \le 2\exp\!\left(-\frac{a^2}{5m^2}\delta\right).$$

这就是对“小的一边”得到的坏事件概率估计。

---

### 第三步：大的那一边自动也有下界

因为 $B=Y\setminus A$，所以
$\deg(v,B)=\deg(v,Y)-\deg(v,A)$。

只要 $\deg(v,A)$ 不太大，就能推出 $\deg(v,B)$ 不太小。  
更直接地，也可以把上面的论证对补集再做一次，得到

$\Pr\!\left(\deg(v,B)<\frac{b}{3m}\deg(v,Y)\right) \le 2\exp\!\left(-\frac{a^2}{5m^2}\delta\right)$，

因为这里较小的一边仍然是 $a=s$，指数里出现的是 $s^2/m^2$。

于是，对每个顶点 $v$，定义坏事件 $E_v$ 为：

> $v$ 不满足 (2) 或 (3)。

那么对每个 $v$ 都有
$\Pr(E_v)\le 2\exp\!\left(-\frac{s^2}{5m^2}\delta\right)$。

---

### 第四步：分析依赖关系

>事件 $E_v$ 只取决于哪些随机选择？  
   只取决于那些与 $N(v)\cap Y$ 相交的组中的选择结果。

如果两个顶点 $u,v$ 的坏事件相关，那么必然存在某组同时和 $N(u)\cap Y$、$N(v)\cap Y$ 都相交。粗略估计这种相关顶点数最多是 $\Delta^2 r$ 级别：

- $v$ 在 $Y$ 中最多有 $\Delta$ 个邻点；
- 每个这样的邻点所在的组大小至多 $r$；
- 与这些组中点相邻的顶点总数最多再乘一个 $\Delta$；

因此每个坏事件至多依赖于
$$D\le \Delta^2 r$$
个其他坏事件。这里 $r=\left\lceil \frac{m}{s}\right\rceil$，所以 $D\le \Delta^2\left\lceil \frac{m}{s}\right\rceil$。

---

### 第五步：应用 [[LLL]]

对称型局部引理告诉我们，只要$ep(D+1)<1$，其中 $p:=2\exp\!\left(-\frac{s^2}{5m^2}\delta\right)$，就存在一种随机选择使得所有坏事件都不发生。

而引理中的条件
$$\Delta^2\cdot \left\lceil \frac{m}{s}\right\rceil \cdot 2 \cdot e^{1-\frac{s^2}{5m^2}\delta}<1$$
正是这个条件的一个直接充分条件。

于是存在一个划分 $Y=A\cup B$，使得所有 $E_v$ 都不发生。  
这就说明对每个 $v\in V$，同时有

- $\deg(v,A)\ge \frac{a}{3m}\deg(v,Y)$；
- $\deg(v,B)\ge \frac{b}{3m}\deg(v,Y)$。

连同前面的 $|A|=a, |B|=b$，引理得证。

---





