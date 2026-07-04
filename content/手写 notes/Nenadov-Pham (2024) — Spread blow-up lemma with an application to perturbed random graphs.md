---
authors: Rajko Nenadov, Huy Tuan Pham
year: 2024
arxiv: "2410.06132"
pages: 12
subjects: math.CO, cs.DM, math.PR
tags:
  - hamiltonicity
  - spread_thresholds
  - resilience_perturbation
sources:
  - "[[Nenadov-etal-2024-Spread-blow-up-lemma-with-an-application-to-perturbed-random-graphs.pdf]]"
---

# 引入


该文章的结果包括：

- 一个 spread 版本的 blowup lemma，
- 以及对其的应用，得到了在 perturb graph 里 找 $\ell$-power Hamilton cycle的结果。

普通 blow-up lemma 给的是：

> 在 super-regular blow-up 中，存在一个合法嵌入 $\phi:H\hookrightarrow G$。

Nenadov–Pham 给的是：

> 在同样的 blow-up 设定中，可以随机选一个合法嵌入 $\phi:H\hookrightarrow G$，并且这个随机嵌入满足反集中估计：  
> 对任意指定的 $s$ 个顶点像，概率至多为 $(C/N)^s$。


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


验证了 Böttcher、Parczyk、Sgueglia 和 Skokan 关于扰动随机图模型中 Hamilton 圈的幂出现阈值的猜想的一个近似版本。

>[!tip] **Theorem 3.**
>对任意整数 $k\ge 3$ 以及 $\alpha>0$，存在常数 $C$ 和 $n_0$，使得如下结论成立。
>
>对任意 $n\ge n_0,$ 设 $G$ 是一个 $n$ 阶图，并且其最小度满足
>$$
>\delta(G)\ge \left(\frac{1}{k+1}+\alpha\right)n.
>$$
>那么当
>$$
>p\ge Cn^{-1/(k-1)}
>$$
>时，$G\cup G(n,p)$ 以至少 $1/2$ 的概率包含一个 Hamilton 圈的第 $k$ 次幂。

### Remark.

注意，$p=Cn^{-1/(k-1)}$ 已经足以保证在 $G(n,p)$ 中存在 Hamilton 圈的 $(k-1)$ 次幂。BPSS 指出，这两个条件都不能被放松，并进一步猜想可以取 $\alpha=0$。

从以往技术的角度看，定理 3 之所以具有挑战性，是因为这些技术主要依赖于：先用 $G(n,p)$ 中的边嵌入一些小图，然后再用 $G$ 中的边把它们连接成所需的结构。但对于 $k\ge 3$ 的 Hamilton 圈的 $k$ 次幂来说，这种方法并不可行。更详细的讨论可参见 BPSS。

我们认为，如果对临界情形进行更细致的分析——类似于正则性方法和 blow-up lemma 中通常需要做的那种分析——应当可以去掉额外的 $\alpha n$。我们将这一点作为一个公开问题。

# Survey

| 文章                                                                                                  | 主要结果                                                                                                                                                                                                                                                                               | 在这条线里的作用                                                                                                            |
| --------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Komlós–Sárközy–Szemerédi, “An Algorithmic Version of the Blow-up Lemma”**                         | 给出 blow-up lemma 的算法化版本：在正则性方法框架下，可以在超正则对组成的图中嵌入最大度有界的 spanning 子图；而且能在多项式时间内找到所需嵌入。                                                                                                                                                                                               | Nenadov–Pham 的 spread blow-up lemma 不是重新发明 blow-up lemma，而是把 KSS 的算法化嵌入过程随机化，使嵌入分布具有 vertex-spread。                 |
| **Frankston–Kahn–Narayanan–Park, “Thresholds versus fractional expectation-thresholds”**            | 证明 Talagrand 关于 fractional expectation-threshold 的猜想：对任意递增族 $\mathcal F$，有 $p_c(\mathcal F)=O(q_f(\mathcal F)\log \ell(\mathcal F))$。它推出了若干原本很难的阈值结果，包括超图完美匹配、最大度有界 spanning tree、最大度有界 spanning graph 等。                                                                          | 这是“有 spread 测度 $\Rightarrow$ 随机阈值上界”的核心机器。很多 spread 版本的 Dirac 型结果，最后都靠它转化为 robust threshold。                        |
| **Park–Pham, “A Proof of the Kahn–Kalai Conjecture”**                                               | 证明完整的 Kahn–Kalai expectation-threshold 猜想，即把 FKNP 的 fractional 版本加强为非分数版本。                                                                                                                                                                                                         | 在应用上，它提供比 FKNP 更强的抽象阈值工具；Nenadov–Pham 文中说 Lemma 2 可以结合已经解决的 Kahn–Kalai 猜想或其 fractional 版本来得到阈值结果。                   |
| **Pham–Sah–Sawhney–Simkin, “A Toolkit for Robust Thresholds”**                                      | 证明三类 robust threshold：超图 Dirac 条件下的完美匹配、Hajnal–Szemerédi 条件下的 $K_r$-factor、以及大最小度图中的最大度有界 spanning tree。共同方法是构造 spread measure，然后调用 FKNP / Kahn–Kalai 类型阈值结果。                                                                                                                      | 这是 spread 方法进入 Dirac/robust threshold 问题的“工具箱”。Nenadov–Pham 的 spread blow-up lemma 直接借用了其中关于超正则二部图中 spread 完美匹配的思想。 |
| **Nenadov–Pham, “Spread blow-up lemma with an application to perturbed random graphs”**             | 证明一个 **spread 版本的 blow-up lemma**：在由超正则对构成的 blow-up 系统中，不仅能嵌入最大度有界的目标图 $H$，还能在这些嵌入上构造 $O(1/N)$-vertex-spread 分布。作为应用，他们证明：对每个 $k\ge 3$ 和 $\alpha>0$，若 $G$ 是 $n$ 顶点图且 $\delta(G)\ge (1/(k+1)+\alpha)n$，则当 $p\ge Cn^{-1/(k-1)}$ 时，$G\cup G(n,p)$ 以至少 $1/2$ 的概率包含 Hamilton 圈的 $k$ 次幂。 | 这是这条线里的核心新文章。它把 blow-up lemma 升级成“可与 Kahn–Kalai 阈值机器兼容”的 spread 形式。                                                 |
| **Bohman–Frieze–Martin, “How many random edges make a dense graph Hamiltonian?”**                   | 引入 randomly perturbed graph 模型。核心结果是：对任意线性最小度的 $n$ 顶点图，加入 $\Theta(n)$ 条随机边，或者等价地加入 $G(n,C/n)$，就可以使图渐近几乎必然 Hamiltonian。                                                                                                                                                             | 提供扰动随机图模型的起点：先有一个满足最小度条件的确定性图 $G$，再加随机图 $G(n,p)$，研究什么时候出现目标结构。                                                      |
| **Böttcher–Parczyk–Sgueglia–Skokan, “The square of a Hamilton cycle in randomly perturbed graphs”** | 研究 $G\cup G(n,p)$ 中 Hamilton 圈平方的出现阈值。对给定 $\alpha\in(0,1)$，其中 $G$ 满足 $\delta(G)\ge \alpha n$。他们确定了 $\alpha\le 1/2$ 时的精确 perturbed threshold；并指出当 $\alpha$ 在 $(0,1)$ 中变化时，阈值会出现可数无穷多个“跳跃”。                                                                                          | Nenadov–Pham 的应用可以看作对这类问题的高次幂方向推进，但他们得到的是一个带 $\alpha$ 余量的近似版本。                                                      |
| **Kahn–Narayanan–Park, “The threshold for the square of a Hamilton cycle”**                         | 解决 Kühn–Osthus 猜想，证明随机图 $G(n,p)$ 中 Hamilton 圈平方的阈值是 $p=n^{-1/2}$ 量级。                                                                                                                                                                                                               | 这是纯随机图中 Hamilton 圈平方阈值的关键背景；perturbed model 研究的是在一个确定性稠密底图上再加入随机边后的对应问题。                                            |



# Preliminaries

整体上，文章沿用 Komlós、Sárközy 和 Szemerédi(KSS) 的算法来嵌入图 $H$ 的大部分。

在算法的每一步中，利用这样一个事实：嵌入下一个顶点时有很多可能选择。因此，在这些选择中均匀随机选取一个，就足以得到一个定义在 $H$ 的某个大子图的嵌入上的 $O(1/N)$-vertex-spread 分布。

最后，我们再应用 PSSS 关于超正则对中完美匹配上的 vertex-spread 分布的结果来完成证明。

---

下面的这个 lemma 是在用“删边”换取“规范性”：

> 原来：边很多，但密度和度数不够标准。  
> 处理后：边少了一些，但密度精确、度数均匀、正则性仍在。  
> 代价：删掉一些边，并把 $\varepsilon$ 损失成 $O(\sqrt{\varepsilon})$。

>[!example] **Lemma 5.**
>设 $G$ 是一个二部图，两个顶点类分别为 $X_1$ 和 $X_2$，且二者大小均为 $N$。假设 $G$ 是 $(\varepsilon,\delta)$-super-regular 的。那么，对任意
>$$
>\bar d\le \delta-C\varepsilon
>$$
>其中 $C$ 是一个足够大的绝对常数，$G$ 都包含一个生成子图，其密度为 $\bar d$，并且它是 $\varepsilon'$-super-regular 的，其中 $\varepsilon'=O(\varepsilon^{1/2})$。

主要用了三种技术：

> **随机抽样删边**把密度降到目标值附近，
   **局部修补度数**把异常低度和高度顶点调平，
   最后用**浓度不等式 + union bound**证明正则性仍保留，只是参数从 $\varepsilon$ 变差到 $\varepsilon'=O(\varepsilon^{1/2})$。
   
[[proofoutline of Lemma 5 in Spread blow-up lemma with an application to perturbed random graphs]]

本文中称一对互不相交的顶点集 $(A_1,A_2)$ 是 **$\varepsilon$-super-regular**，如果 $(A_1,A_2)$ 是 $\varepsilon$-regular，满足 $|A_1|=|A_2|=:N$，并且记 $d=d_G(A_1,A_2)$ 时，对每个 $v\in A_i$，都有

$$
(d-\varepsilon)N\le |N_G(v)\cap A_{3-i}|\le (d+\varepsilon)N.
$$

通常的 **$(\varepsilon,\delta)$-super-regular** 指的是：$(X_1,X_2)$ 是 $\varepsilon$-regular，且对每个 $v\in X_i$，都有

$$
|N_G(v)\cap X_{3-i}|\ge \delta N.
$$

因此，本文的 $\varepsilon$-super-regular 等价于在 regular 的基础上要求每个顶点到另一侧的度数都落在 $(d\pm\varepsilon)N$ 之间；而通常的 $(\varepsilon,\delta)$-super-regular 只要求最低度至少为 $\delta N$。


---


# Spread 版的 KSS 算法


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

>如果某个点 $x$ 目前不是 low vertex，那么它至少还有 $\delta_1N$ 个有效候选位置。
>
>接下来到下一次检查之前，最多只嵌入 $s=\delta_2N$ 个新点。即使最坏情况下，这些新点的 image 全都落在 $C_\varphi(x)$ 里，也只吃掉 $\delta_2N$ 个位置。
>
>另一方面，来自领居集方面的影响至多带来 $(d-\varepsilon)^\Delta$的因子。
>
>因为 $\delta_2\ll (d-\varepsilon)^\Delta\delta_1$，所以它不可能在一个检查间隔内从“很多候选”直接变成“完全没候选”。

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

# 正确性证明

**Phase I 不会卡死：每一步都有线性多好选择**

当前要嵌入 $x$ 时，算法不是从所有候选点里选，而是从一个好集合 $A_{j+1}\subseteq C_\varphi(x_{j+1})\setminus \varphi(X_j)$ 里选。

回顾一下定义，其满足：把 $x$ 放过去以后，新的 partial embedding 仍然 quasirandom，且不会让后续邻居的候选集变坏。

我们需要证明 $A$ 非空，而且事实上有更强的 $|A|=\Omega(N)$。 我们需要检查以下几个方面：

> [!warning] 检查  
>   1. $C_\varphi(x)\setminus \varphi(X_j)$ 本身是不是大。
>   2. 选 $v$ 后，会不会让未来邻居的“可用候选集” $C_\varphi(y)\setminus \varphi(X_j)$ 变小
>   3. 选 $v$ 后，会不会破坏 quasirandomness 的 P2

其中第二条直接由 第一条的结果，加上reguler来控制坏点很少，得到可用候选集大。

## 第一条 $|C_\varphi(x)\setminus \varphi(X_j)| \gg \delta_2N$。

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
>**因为 buffer $B_i$ 大部分还没有嵌入，而且前面被插队的点不多，所以 $V_i$ 中还会留下线性多位置**。 粗略地说，可以保证
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

## 第三条 **维持(P2)**

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

# 应用到 perturb 定理

>[!danger] 总览
>总的来说，$C_n^k$的嵌入任务被（大致）分成两个部分：
>
>$G$负责嵌入一个 almost perfect $K_{1,k}$-tiling，称为$H^{\phi}$，也就是 $\frac{k}{k+1}n$ 条边；
>
>$G(n,p)$负责嵌入剩下的部分，称为$H_{\phi}$，也就是$(k-1)n$条边。
>
>注意到对随机扰动部分，这部分的嵌入要求与$(k-1)$-power Hamilton cycle基本一致，所以需要$p=\Omega(n^{-1/(k-1)})$。

我们先在

>[!warning] **Lemma 12.**
>在 reduced graph $R$ 中，我们可以找到若干个顶点不交的 stars，并且每个 star 至多含有 $k$ 个叶子。

>[!tip] **Amahashi–Kaneko 星因子定理**
>
>图 $G$ 含有一个 spanning star forest，且每个分支为 $K_{1,t}$， $1\le t\le k$， 当且仅当对任意 $S\subseteq V(G)$，都有
>
>$$
>i(G-S)\le k|S|,
>$$
>
>其中 $i(G-S)$ 表示 $G-S$ 中孤立点的个数。


之后，通过一个 tiny tech 可以得到，我们可以在 $G$ 中得到一个好的 regular 划分，使得对应的 reduced graph 中有一个 almost perfect $K_{1,k}$-tiling，并且只剩下额外点集，也就是正则引理的副产物。

---

>[!example] 定义 1
> 令 $Z$ 表示 $R$ 中对应于 $\mathcal S$ 里各个星的中心的顶点集合，并令 $W=V(R)\setminus Z$ 为剩余顶点。注意 $|Z|=m/(k+1)$，因此 $|\overline Z|\le n/(k+1)$。于是，每个顶点 $v\in V_0$ 在 $\overline W$ 中至少有 $\delta'n$ 个邻居。
> 
> 进一步地，$v$ 在至少 $\delta'|W|/2$ 个部 $V_x$ 中都有至少 $\delta'|V_x|/2$ 个邻居，其中 $x\in W$。我们把每个顶点 $v\in V_0$ 分配到某个部 $V_x$，其中 $x\in W$，且 $v$ 在 $V_x$ 中至少有 $\delta'|V_x|/2$ 个邻居，并使得每个部 $V_x$ 至多被分配 $O(\varepsilon |V_x|/\delta')$ 个这样的顶点 $v$。
>
>令 $A_x$ 表示被分配到 $V_x$ 的那些顶点 $v\in V_0$。对每个星 $S\in\mathcal S$，令 $A_S=\bigcup_{x\in S}A_x$，$V_S=\bigcup_{x\in S}V_x$，并令 $Z_S=V_{z(S)}$，其中 $z(S)$ 表示星 $S$ 的中心。


| 符号           | 含义                                                          |
| ------------ | ----------------------------------------------------------- |
| $R$          | reduced graph                                               |
| $V_0$        | exceptional set                                             |
| $V_x$        | reduced vertex $x$ 对应的 cluster                              |
| $\mathcal S$ | reduced graph 中的 star family                                |
| $S$          | 一个具体 star                                                   |
| $z(S)$       | star $S$ 的中心，一个 $G$ 中的 cluster                              |
| $Z$          | 所有中心 reduced vertices，$G$ 中的一些 clusters                     |
| $W$          | 所有非中心 reduced vertices，即叶子部分                                |
| $A_x$        | 分配给 $V_x$ 的异常点，异常点是 $V_0$ 中的点                               |
| $A_S$        | 分配给 star $S$ 的异常点                                           |
| $V_S$        | star $S$ 对应的所有 cluster 顶点                                   |
| $Z_S$        | star $S$ 的中心 cluster                                        |
| $I_S$        | $[n]$ 中大小等于 $\|V_S \cup A_S\|$ 的 segment, star $S$ 负责的圈上连续段 |




>[!warning] 定义 2
>定义 $i,j\in[n]$ 之间的距离为与 $j-i$ 模 $n$ 同余的最小非负整数。把 $[n]$ 分成若干连续区间：对每个星 $S\in\mathcal S$，对应一个区间 $I_S\subseteq[n]$，使得 $|I_S|=|V_S\cup A_S|=(1\pm O(\varepsilon))kN/m$。固定任意一个标号函数 $\xi:[n]\to\{0,1\}$，它将作为 $C^k$ 的某个子图的“蓝图”，并满足：
>
>- 集合 $\{i\in I_S:\xi(i)=1\}$ 的大小为 $|A_S\cup Z_S|$。
>
>- 标号为 $1$ 的连续两个数之间的距离至多为 $k$。
>
>- 任意一个标号为 $1$ 的数的距离 $k$ 范围内，必须存在一个标号为 $0$ 的数。
>
>- 在每个区间 $I_S$ 中，第一个数标号为 $1$，最后 $k-1$ 个数标号为 $0$。
>
>
>

>[!danger] $\xi$-good
>固定 $\xi$ 后，如果一个双射 $\phi:[n]\to V(G)$ 满足下面条件，我们称它是 $\xi$-good 的：
>
>- $\phi(I_S)=A_S\cup V_S$。换句话说，每个星连同它关联的顶点，对应于区间 $I_S$。
>
>- 对于 $i\in I_S$，有 $\phi(i)\in A_S\cup Z_S$ 当且仅当 $\xi(i)=1$。
>
>- 如果 $\phi(i),\phi(j)\in V_0$，那么 $i$ 与 $j$ 的距离大于 $2k$。
>
>- 如果 $i,j\in I_S$ 的距离至多为 $k$，且 $\xi(i)=0,\xi(j)=1$，那么 $\phi(i)$ 与 $\phi(j)$ 在 $G$ 中相邻。


在把 $V(C^k)$ 按自然顺序与 $[n]$ 识别之后，我们想在 $G$ 中找到的 $C^k$ 的子图，就由这样的 $\phi$ 隐式给出。

---


>[!example] **引理 13.** 
>存在一个 $O(1/n)$-vertex-spread 分布 $\mu$，其支撑在所有 $\xi$-good 双射 $\phi:[n]\to V(G)$ 上。

**证明.** 

我们如下定义一个随机的 $\xi$-good 双射 $\phi$：

对每个 $S\in \mathcal S$，在集合 $\{i\in I_S:\xi(i)=1\}$ 中均匀随机选择一个子集 $A'_S$，使得 $|A'_S|=|A_S|$，并且 $A'_S$ 中任意两个元素的距离都不小于 $2k$。然后再均匀随机选择一个从 $A'_S$ 到 $A_S$ 的双射。这样就对所有 $i\in A'_S$ 定义了 $\phi$。

在上述选择已经固定的条件下，在顶点集
$$
M=[n]\setminus \bigcup_{S\in\mathcal S} A'_S
$$
上定义图 $H$：若 $i,j\in I_S\cap M$，它们在原图中的距离至多为 $k$，且 $\xi(i)=0,\xi(j)=1$，则在 $i,j$ 之间连一条边。

固定任意一个同态 $h:H\to R$，满足：

- 对每个 $S\in\mathcal S$，都有 $h(I_S\cap M)=S$；

- $h(i)\in z(S)$ 当且仅当 $i\in I_S\cap M$ 且 $\xi(i)=1$；

- 如果 $i\in I_S\cap M$，$j\in A'_S$，二者距离至多为 $k$，且 $\xi(i)=0$，那么 $h(i)=x$，其中 $x\in S$ 是满足 $\phi(j)$ 被分配到 $A_x$ 的那个顶点。

我们还要求对每个 $x\in R$，都有 $|h^{-1}(x)|=V_x$。这是可行的，因为 $\mathcal S$ 中每个星都有 $k$ 个叶子；事实上，只要每个星至多有 $k$ 个叶子就足够了。

接下来对上述 $H$ 和 $h$ 应用引理 2，并额外要求如下限制：若 $i\in I_S\cap M$、$\xi(i)=0$，且 $i$ 距离某个 $j\in A'_S$ 至多为 $k$，则 $i$ 必须被嵌入到 $\phi(j)$ 的邻域中。由于同态 $h$ 的选取方式，这个额外限制确实是可行的。

引理 2 给出一个 $O(1/n)$-vertex-spread 的 $H$ 的嵌入分布。按照该分布抽取一个嵌入，就得到一个 $\xi$-good 嵌入 $\phi$。

令 $\mu$ 表示由此得到的 $\xi$-good 嵌入 $\phi$ 的分布。剩下只需验证：$\mu$ 确实给出了一个无条件的、定义在 good 嵌入 $\phi:[n]\to V(G)$ 上的 $O(1/n)$-vertex-spread 分布。

考虑任意顶点序列 $v_1,\ldots,v_r\in V(G)$ 和 $u_1,\ldots,u_r\in[n]$。由构造可知，对于满足 $v_{i_1},\ldots,v_{i_a}\in V_0$ 的那些顶点，有

$$
\Pr\bigl[\phi(u_{i_j})=v_{i_j}\text{ for all }j\le a\bigr]
\le (C_{k,m}/n)^a.
$$

在给定 $A'=\bigcup_{S\in\mathcal S}A'_S$ 以及所有 $v\in A'$ 的 $\phi(v)$ 之后，由引理 2 产生的 $O(1/n)$-vertex-spread 分布满足：对所有 $i\notin\{i_1,\ldots,i_a\}$，事件 $\phi(u_i)=v_i$ 同时发生的概率至多为 $(O(1)/n)^{r-a}$。因此，

$$
\Pr\left[
\bigwedge_{i\in[r]} \phi(u_i)=v_i
\right]
\le (O(1)/n)^r.
$$

于是 $\mu$ 是 $O(1/n)$-vertex-spread 的。 $\square$








接下来，描述我们要嵌入到 $G$ 中的 $C^k$ 的一个子图。为此，





分布：在从 $[n]$ 到 $V(G)$ 的bijections上。


























![[{6E4E37ED-0417-4B80-AF67-687C70FB9100}.png]]

**Remark.**

>1. 在算法中$S$ 是动态的，它表示当前已经嵌入的顶点集合。但它不包含 $B$ ，直到最后 Phase II 才通过 perfect matching 嵌入。不过 $B$ 的邻居 $N_H(B)$ 会很早进入 $S$，因此 buffer 顶点的候选集 $C_\varphi(b)$ 会很早被确定下来。
>2. 这个定义感觉很自然就满足了。但是嵌入过程中的 约束 有哪些？

我们在 (P2) 中排除 $N_H(D)$，**是因为我们对 $D$ 如何被嵌入的控制有限**，因此也就很难控制当 $x\in N_H(D)$ 时，集合 $C_\phi(x)$ 如何与其他集合相互作用。这两个性质将通过 [[一个由 codegree 控制 regularity 的准随机判据]] 发挥作用。我们把这一点总结为下面的断言；该断言假设 spread blowup Lemma 的设定，以及前面所描述的对 $H$ 的预处理都已经完成。

![[{BA2158F2-D13E-46DE-8C7A-CAF1F6CE440E}.png]]




