---
date: 2026-06-14
tags:
  - spread_thresholds
category:
source: "[[Nenadov-Pham (2024) — Spread blow-up lemma with an application to perturbed random graphs]]"
---

>[!danger] **Spread Blow-up Lemma.**  
>对任意 $r,\Delta\in \mathbb N$ 以及 $\delta,\alpha>0$，存在 $\varepsilon,\beta>0$，使得下面结论成立。
>
>- 设 $R$ 是顶点集为 $[r]$ 的图。对每个 $i\in[r]$，令 $V_i$ 是一个大小为 $N$ 的互不相交的集合。设 $G$ 是定义在 $V=V_1\cup\cdots\cup V_r$ 上的图，并且对每条边 $\{i,j\}\in R$，二部对 $(V_i,V_j)$ 都是 $(\varepsilon,\delta)$-super-regular 的。
>
>- 设 $H$ 是一个最大度至多为 $\Delta$ 的图，并且 $h:H\to R$ 是一个图同态，满足对每个 $i\in[r]$，
>  $$
>  |h^{-1}(i)|\le N.
>  $$
>  另外，给定一个集合 $W\subseteq V(H)$，满足 $|W|\le \beta N$；并且对每个顶点 $x\in W$，给定一个集合 $W_x\subseteq V_{h(x)}$，且 $|W_x|\ge \alpha N$。对每个 $x\in V(H)\setminus W$，令 $W_x=V_{h(x)}$。
>
>那么存在一个定义在嵌入 $\phi:H\hookrightarrow G$ 上的 $O(1/N)$-vertex-spread 分布 $\lambda$，并且该分布满足：对每个 $x\in V(H)$，都有 $\phi(x)\in W_x$。



---



给定 $h,H,R,G,W,W_x's$ 

令 $H_i=h^{-1}(i)$ 表示在给定同态 $h$ 下，被映到 $R$ 中顶点 $i$ 的 $H$ 的顶点集合。通过添加孤立点，我们可以假设 $|H_i|=N$，并且 $|V(H)|=rN=:n$。

我们先默认其是可行的:

>[!example] 预处理
对每个 $i\in R$，选择互不相交的集合 $D_i,B_i\subseteq H_i\setminus W$，使得 $|B_i|=\lceil \delta_0 N\rceil$ 且 $|D_i|=\lceil \beta N\rceil$，并且满足如下条件：
>
>$B\cup D$ 与 $W$ 之间没有边，而且 $B\cup D$ 中任意两个顶点在 $H$ 中的距离至少为 $4$。这里 $B:=\bigcup_{i=1}^r B_i$ 且 $D:=\bigcup_{i=1}^r D_i$。
>
接着，我们通过向 $H$ 中添加若干条边来修改图 $H$，使得前面两个性质仍然成立，并且额外满足：$B$ 中每个顶点的度数恰好为 $\Delta$，同时没有任何顶点的度数超过 $\Delta+1$。得到的新图仍然记作 $H$。


>[!warning] 候选集
如果当前已经嵌入了一个集合 $S\subseteq V(H)$，partial embedding 是 $\varphi$，那么未嵌入顶点 $x$ 的**候选集**是
>$$ C_\varphi(x)=W_x\cap \bigcap_{y\in N_H(x)\cap S}N_G(\varphi(y)).$$
>意思是：$x$ 可以去的位置，必须在自己的允许集合 $W_x$ 里，并且要和所有已经嵌入的邻居相连。所以 $C_\varphi(x)$ 是当前还能放 $x$ 的位置集合。

> [!example] $S\text{-quasirandom}.$
它主要包含两件事:
>
(P1) 每个未嵌入点的候选集仍然有正常大小：
$$|C_\varphi(x)|\ge (d-\varepsilon)^{|N_H(x)\cap S|}|W_x|.$$
这保证候选集不会因为前面随机选择不佳而突然变得很小。
>
(P2) 同一个 cluster 中大多数候选集之间的交集大小正常。这是为了之后证明候选关系二部图 regular。直观上，它排除了“很多未嵌入点都只能去同一小块 host vertices”的坏情况。

> [!note] 初始排序
> 给 $V(H)$ 排一个顺序 $x_1,x_2,\ldots,x_n$。要求是：$N_H(B)$ 放在最前面，$B$ 放在最后面。也就是说，先嵌入 buffer 顶点的邻居，然后暂时不嵌入 buffer 顶点本身。
> 
> 这很重要，因为一旦 $N_H(B)$ 都嵌入了，每个 $b\in B$ 的候选集 $C_\varphi(b)$ 就基本确定了。后面 Phase II 就可以把 $B$ 看成一个 matching 问题。

---

**Phase I：随机贪心嵌入 $H\setminus B$**

算法从 $j=0$ 开始。当前已经嵌入的是 $X_j=\{x_1,\ldots,x_j\}$。只要还有非 buffer 顶点没嵌入，就继续。每一步要嵌入当前第一个未嵌入点 $x_{j+1}$。

嵌入过程遵从下述三个原则。

> [!tip] 原则1  在（几乎）候选集中一致随机嵌入$x_{j+1}$
>  先筛出一个 $x_{j+1}$ 候选集的好集子 $A_{j+1}\subseteq C_\varphi(x_{j+1})\setminus \varphi(X_j)$， $v\in A_{j+1}$ 当：
> 第一，若把 $x_{j+1}$ 放到 $v$，那么每个尚未嵌入的邻居 $y$ 的候选集不会被削得太厉害。形式上要求类似于$$|N_G(v)\cap (C_\varphi(y)\setminus \varphi(X_j))|\ge(d-\varepsilon)|C_\varphi(y)\setminus \varphi(X_j)|.$$
> 第二，扩展后的 partial embedding 仍然是 quasirandom。
> 
> 然后算法从 $A_{j+1}$ 中 **均匀随机** 选一个 $v$，令 $\varphi(x_{j+1})=v$。这就是** spread 的主要来源**：每一步都有线性多选择，所以钉死某个点的像的概率大约是 $O(1/N)$。
> 

> [!warning] 原则2  周期性插队机制
> 定义**low vertices**：$$L_j=\{x\notin X_j: |C_\varphi(x)\setminus \varphi(X_j)|<\delta_1N\}.$$
> 每隔一段时间，检查 low vertices. 设 $s=\lceil \delta_2N\rceil$。当 $j$ 是 $s$ 的倍数时，算法检查哪些未嵌入点的自由候选集太小。
> 
> 如果某个点的可用位置已经少于 $\delta_1N$，继续拖下去可能会卡死，所以算法把 $L_j$ 中的点提前到当前排序的**最前面**。
> 
> 注意：$L_j$ 里可能包含 $B$ 中的点。也就是说，虽然原则上 $B$ 最后嵌入，但如果某个 buffer 顶点快没候选位置了，也允许提前处理。

>如果某个点 $x$ 目前不是 low vertex，那么它至少还有 $\delta_1N$ 个有效候选位置。接下来到下一次检查之前，最多只嵌入 $s=\delta_2N$ 个新点。即使最坏情况下，这些新点的 image 全都落在 $C_\varphi(x)$ 里，也只吃掉 $\delta_2N$ 个位置。
>
>因为 $\delta_2\ll\delta_1$，所以它不可能在一个检查间隔内从“很多候选”直接变成“完全没候选”。

> [!example] 原则3 一个**特殊时刻**：为了安全，先嵌入一部分buffer set
> 嵌入完 $N_H(B)$ 之后，处理坏 host vertices. 当 $j=|N_H(B)|$ 时，说明 buffer 顶点 $B$ 的邻居已经全部嵌入了。于是每个 $b\in B_i$ 的候选集 $C_\varphi(b)$ 已经确定。这时算法在每个 $V_i$ 中找坏位置：$$E_i=\{v\in V_i\setminus \varphi(X_j): |\{b\in B_i:v\in C_\varphi(b)\}|<\delta_1|B_i|\}.$$
 也就是说，$E_i$ 里的点 $v$ 对太少的 buffer 顶点可用。如果这些 $v$ 留到最后，会破坏 $B_i$ 和剩余 host vertices 之间的 matching 条件。所以算法把这些坏位置提前“吃掉”。具体做法是：随机取一个注入 $\rho_i:E_i\to D_i$，然后把每个 $\rho_i(v)\in D_i$ 嵌入到 $v$ 上。也就是 $\varphi(\rho_i(v))=v$。所以 $D_i$ 的作用就是吸收这些不适合留给 buffer 的 host vertices。
 

Phase I 一直运行到所有非 buffer 顶点都已经嵌入。

记结束时已经嵌入的集合为 $X_T$。这时，绝大多数 $B$ 还没有嵌入，但也可能有少量 $B$ 因为进入了 low vertices 而被提前嵌入。剩下的是 $B_i'=B_i\setminus X_T$，而 host cluster $V_i$ 中还没被占用的位置是 $F_i=V_i\setminus \varphi(X_T)$。因为总数匹配，所以 $|B_i'|=|F_i|$。

---

**Phase II：把剩余 $B_i'$ 变成 perfect matching 问题**

> [!example] .
> 对每个 $i$，构造一个二部图 $G_i$。左边是剩余 buffer 顶点 $B_i'$，右边是剩余 host vertices $F_i$。连边规则是：$b\sim v$ 当且仅当 $v\in C_\varphi(b)$。也就是说，$v$ 可以作为 $b$ 的最终位置。
> 
> 前面 exceptional stage 保证了每个剩余 $v\in F_i$ 被很多 $b\in B_i'$ 接受；
> 
> Phase II 中最重要的是： regularity + quasirandomness + [[一个由 codegree 控制 regularity 的准随机判据]] 得到 $G_i$ 是 super-regular 的。
> 
> 然后调用 super-regular 二部图中 perfect matching 的 spread 分布，对每个 $i$ 随机采样一个 perfect matching，把 $B_i'$ 嵌入到 $F_i$。

---

Phase II 完成后，所有顶点都被嵌入了，于是得到完整嵌入 $\varphi:H\hookrightarrow G$。算法输出这个 $\varphi$。所有随机性来自三处：
- Phase I 中每个普通顶点从 $A_{j+1}$ 中均匀随机选像；
- exceptional stage 中随机注入 $\rho_i:E_i\to D_i$；
- Phase II 中从 spread perfect matching 分布里随机选 matching。

这个输出分布就是 Lemma 2 里的 $\lambda$。

> [!quote] 人话解释
这个随机嵌入算法可以理解为：大部分点用随机贪心嵌入，每一步都保持候选集准随机且有线性多选择；候选集快变小的点提前嵌入；对 buffer 不友好的 host vertices 用 $D$ 提前吃掉；最后剩余 buffer 顶点通过 super-regular perfect matching 随机完成。

---


## 正确性证明

**Phase I 不会卡死：每一步都有线性多好选择**

当前要嵌入 $x$ 时，算法不是从所有候选点里选，而是从一个好集合 $A_{j+1}\subseteq C_\varphi(x_{j+1})\setminus \varphi(X_j)$ 里选。

回顾一下定义，其满足：把 $x$ 放过去以后，新的 partial embedding 仍然 quasirandom，且不会让后续邻居的候选集变坏。

我们需要证明 $A$ 非空，而且事实上有更强的 $|A|=\Omega(N)$。 我们需要检查以下几个方面：

> [!warning] 检查  
>   1. $C_\varphi(x)\setminus \varphi(X_j)$ 本身是不是大。
>   2. 选 $v$ 后，会不会让未来邻居的“可用候选集” $C_\varphi(y)\setminus \varphi(X_j)$ 变小
>   3. 选 $v$ 后，会不会破坏 quasirandomness 的 P2

其中第二条直接由 第一条的结果，加上reguler来控制坏点很少，得到可用候选集大。

### 第一条 $|C_\varphi(x)\setminus \varphi(X_j)| \gg \delta_2N$。

因为 low vertices 机制的存在，我们只需要担心：

**low vertices 太多，而且它们的有效候选集都已经很小，那么单纯“插队”没有用。** 

所以这里的关键不是“把 low vertices 提前”本身，而是证明 **low vertices 不可能太多**。

所以我们需要证明：

> [!danger] $|L_j\setminus (W\cup N_H(D))|< r(\Delta+1)\delta_3N.$

因为 $\delta_3\ll\delta_2$，所以 low vertices 的数量远小于一个检查区间的长度 $s=\delta_2N$。于是被插队的点会很快被处理掉，不会形成很长的队列。

> [!note] Proof Outline
这里用反证法。
>
假设某个检查时刻 $j$，low vertices 很多。把这些 low vertices 按两个指标分类：
第一，它们属于哪个 cluster $H_i$；
第二，它们已经有多少个邻居被嵌入，也就是 $|N_H(x)\cap X_j|=\ell$。
>
因为 $r$ 和 $\Delta$ 都是常数，如果 low vertices 总数很大，就能找到某一类 $U_i^\ell$，满足 $|U_i^\ell|\ge \delta_3N$。这个 $U_i^\ell$ 是一大批“同类型 low vertices”。
>
>对 $U_i^\ell$ 和 $V_i$ 构造候选图：左边是 $U_i^\ell$，右边是 $V_i$，如果 $v\in C_\varphi(x)$，就连边 $xv$。由于嵌入过程保持 quasirandom，所以(P1)(P2)都满足，可以使用[[一个由 codegree 控制 regularity 的准随机判据]]，得到构造的辅助图是 regular 的。
>
>令 $F_i=V_i\setminus \varphi(X_j)$ 为还没被占用的 host vertices。
>
>**因为 buffer $B_i$ 大部分还没有嵌入，而且前面被插队的点不多，所以 $V_i$ 中还会留下线性多位置**。粗略地说，可以保证
$$|F_i|\ge \frac{\delta_0N}{2}.$$
> 所以 $(U_i^\ell,F_i)$ 的密度仍然接近原密度，至少是正的。因此 $U_i^\ell$ 中一定有某个点 $x$ 对 $F_i$ 有很多邻居。
> 
> 换回原语言，这就是说：
$$|C_\varphi(x)\setminus \varphi(X_j)|\ge \delta_1N.$$
>
>但 $x\in U_i^\ell\subseteq L_j$，它是 low vertex，按定义应该满足
$$|C_\varphi(x)\setminus \varphi(X_j)|<\delta_1N.$$
矛盾。


---

### 第三条 维持P2

P2 控制的是候选集交集，比如 $|C_\varphi(a)\cap C_\varphi(b)|$。嵌入 $x\mapsto v$ 后，如果 $a\in N_H(x)$，那么 $C_{\varphi'}(a)=C_\varphi(a)\cap N_G(v)$。所以新的交集会变成类似 $C_\varphi(a)\cap C_\varphi(b)\cap N_G(v)$。

对一个固定 pair $(a,b)$，regularity 可以说：让这个 pair 坏掉的 $v$ 很少。但是问题是：这样的 pair 很多，不能把每个 pair 的坏 $v$ 直接 union bound。因为 pair 数量可能是线性的，甚至更多，直接并起来会太大。

所以第 4 条的逻辑是：
1. 对固定 pair，用 regularity 说明坏 $v$ 很少；
2. 对所有 pair 求平均，说明随机 $v$ 造成的坏 pair 数期望很小；
3. 用 Markov，排除那些会造成太多坏 pair 的 $v$；
4. 利用 P2 本身允许少量坏 pair，所以只要新增坏 pair 不多，quasirandomness 仍然保持。

因此第 4 条不是单靠 regularity，而是

$$
\text{regularity}+\text{平均}+\text{Markov}+\text{P2 的误差空间}.
$$


---