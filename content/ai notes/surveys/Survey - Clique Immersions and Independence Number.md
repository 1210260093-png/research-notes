---
title: "Survey: Clique Immersions and Independence Number"
subtitle: "从 independence number 到 Abu-Khzam--Langston 猜想"
date: 2026-06-17
tags:
  - survey
  - immersion
  - clique-immersion
status: polished-draft
authors:
  - Me
---

# Clique Immersions and Independence Number

**副标题：从 $\alpha(G)=2$ 到 Abu-Khzam--Langston 猜想**

> [!summary] 一句话版本
> Clique immersion 版 Hadwiger 猜想预言：每个图 $G$ 都含有 $K_{\chi(G)}$ 的 weak immersion。  
> 对 $\alpha(G)=2$，这等价于要求每个 $n$ 阶图含有 $K_{\lceil n/2\rceil}$ 的 weak immersion。  
> Dahlke 2026 证明了这一点，给 $\alpha=2$ 情形画上了 weak immersion 版本的句号。

> [!tip] 读法
> 快速建立地图：读 **0. 导读**、**2. 为什么 $\alpha=2$ 特别重要**、**3. 结果路线图**。  
> 追技术细节：读 **4. Dahlke 的新工具** 和 **5. 三种方法路线**。  
> 找研究切入点：读 **7. 当前图景** 与 **8. 推荐阅读路线**。

## 0. 导读

这篇 survey 以 **independence number** 为主线，重点放在 $\alpha(G)=2$。

核心问题是：

$\alpha(G)=2,\ |V(G)|=n \Longrightarrow K_{\lceil n/2\rceil}$ immersion?

为什么是 $\lceil n/2\rceil$？因为 $\alpha(G)=2$ 时有 $\chi(G)\ge n/2$，所以 Abu-Khzam--Langston 猜想会预言 $K_{\chi(G)}$，从而预言至少 $K_{\lceil n/2\rceil}$。

本文按四条线展开：

1. immersion 的基本定义与猜想。
2. $\alpha=2$ 为什么是关键战场。
3. 从 $n/3$、$2n/5$ 到 $n/2$ 的结果谱系。
4. Dahlke 的 cycle-matching colouring 为什么是新的方法。

---

## 1. 基本对象

### 1.1 Weak immersion 与 strong immersion

令 $H$ 和 $G$ 为图。

若存在单射 $\phi:V(H)\to V(G)$，并且对每条边 $uv\in E(H)$，存在一条连接 $\phi(u)$ 与 $\phi(v)$ 的路径 $P_{uv}$，且所有这些路径两两 **edge-disjoint**，则称 $H$ 是 $G$ 的 **weak immersion**。

若进一步要求每条 $P_{uv}$ 的内部顶点都不属于 $\phi(V(H))$，则称为 **strong immersion**。

> [!note] 直觉
> Weak immersion 允许路径穿过别的 terminal。  
> Strong immersion 不允许路径内部经过 terminal，因此更接近“干净路由”。

### 1.2 Clique immersion 猜想

Lescure--Meyniel 猜想，以及后来 Abu-Khzam--Langston 的 weak immersion 版本，都可看作 immersion 版 Hadwiger 猜想。

> [!theorem] Abu-Khzam--Langston 猜想
> 每个图 $G$ 都含有 $K_{\chi(G)}$ 的 weak immersion。

如果这个猜想成立，则由 $\chi(G)\ge |V(G)|/\alpha(G)$ 立即得到：

> [!corollary] Independence number 形式
> 每个 $n$ 阶图 $G$ 都含有规模至少 $K_{\lceil n/\alpha(G)\rceil}$ 的 weak immersion。

---

## 2. 为什么 $\alpha=2$ 特别重要

当 $\alpha(G)=2$ 时，任意三个顶点中至少有一条边。

等价地，$\overline G$ 是 triangle-free。

这给 $\alpha=2$ 图带来两面性。

> [!important] 结构优势
> 补图 triangle-free，使得证明中可以使用 clique cover、matching、forbidden subgraph、局部缺边结构等工具。

> [!warning] 真实困难
> 补图可以是任意 triangle-free 图，所以缺边结构仍然很复杂。  
> $\alpha=2$ 并不等于“图已经足够稠密，所以问题自动简单”。

Vergara 给出了一个关键等价性：

> [!theorem] Vergara 的等价性
> 在 $\alpha(G)\le 2$ 的图类中，Abu-Khzam--Langston 猜想等价于：
> 若 $|V(G)|=n$ 且 $\alpha(G)\le 2$，则 $G$ 含有 $K_{\lceil n/2\rceil}$ 的 immersion。

所以 $\alpha=2$ 的目标非常清楚：把线性下界推到精确的 $n/2$。

---

## 3. 结果路线图

### 3.1 一般图中的线性理论

这些结果不专门使用 $\alpha=2$，但提供了整个领域的背景。

> [!info] DeVos--Dvorak--Fox--McDonald--Mohar--Scheide
> 若 $\delta(G)\ge 200t$，则 $G$ 含有 strong $K_t$-immersion。
>
> 意义：第一个强力线性 minimum-degree 条件。

> [!info] Dvorak--Yepremyan
> 若 $\delta(G)\ge 11t+7$，则 $G$ 含有 strong $K_t$-immersion。
>
> 意义：把常数从 $200$ 大幅降低到 $11$ 附近。

> [!info] Gauthier--Le--Wollan
> 若 $\delta(G)\ge 7t+7$，则 $G$ 含有 $K_t$-immersion。
>
> 他们还得到色数形式：若 $G$ 不含 $K_t$-immersion，则 $\chi(G)$ 有线性上界，常数约为 $3.54$。

这些结果说明：色数高确实会强迫 clique immersion。  
但常数还离 Abu-Khzam--Langston 猜想需要的精确形式很远。

### 3.2 $\alpha=2$ 的早期下界

> [!theorem] Vergara
> 每个 $n$ 阶、$\alpha(G)\le 2$ 的图都含有 $K_{\lceil n/3\rceil}$ 的 strong immersion。

这个结果的意义不只是 $n/3$。它第一次把 $\alpha=2$ 的精确目标清楚地固定为 $n/2$。

随后：

> [!theorem] Gauthier--Le--Wollan
> 每个 $n$ 阶、$\alpha(G)\le 2$ 的图都含有 $K_{2\lfloor n/5\rfloor}$ 的 strong immersion。

比例从 $1/3$ 提高到 $2/5$。  
但距离目标 $1/2$ 仍有明显缺口。

### 3.3 一般 $\alpha$ 的路线

Bustamante--Quiroz--Stein--Zamora 把问题推广到一般 independence number。

> [!theorem] Bustamante--Quiroz--Stein--Zamora
> 当 $\alpha(G)\ge 3$ 时，每个 $n$ 阶图含有规模至少
> $$
> \left\lfloor
> \frac{n}{2.25\alpha-f(\alpha)}
> \right\rfloor-1
> $$
> 的 clique immersion。

这个界比直接套用一般色数线性理论更强。

它也自然引出猜想：

> [!question] 一般 independence number 猜想
> 是否每个 $n$ 阶图 $G$ 都含有 $K_{\lceil n/\alpha(G)\rceil}$ 的 immersion？

目前 $\alpha=2$ 已由 Dahlke 解决 weak immersion 版本；$\alpha\ge 3$ 仍很开放。

### 3.4 Complete bipartite immersion

Botler--Jimenez--Lintzmayer--Pastine--Quiroz--Sambinelli 证明了一个非常接近 clique immersion 的二部版本。

> [!theorem] Botler et al.
> 若 $G$ 是 $n$ 阶图且 $\alpha(G)=2$，则对每个 $1\le \ell\le \lceil n/2\rceil-1$，图 $G$ 含有 $K_{\ell,\lceil n/2\rceil-\ell}$ 的 immersion。

换句话说，$\alpha=2$ 图含有所有 $\lceil n/2\rceil$ 阶 complete bipartite graph 的 immersion。

> [!tip] 为什么这很接近 clique？
> $K_t$ 要求所有 terminal pair 都能路由。  
> $K_{\ell,t-\ell}$ 只要求跨两侧的 pair 能路由。  
> 因此 biclique immersion 已经解决了“跨侧连接”，剩下的难点是“同侧连接”。

他们还推出：

> 若 $\alpha(G)=2$，则对任意 $1\le \ell\le \chi(G)-1$，图 $G$ 含有 $K_{\ell,\chi(G)-\ell}$ 的 immersion。

并提出更一般的猜想：

> [!question] Complete bipartite immersion 猜想
> 对任意图 $G$ 和任意 $1\le \ell\le \chi(G)-1$，是否总有
> $K_{\ell,\chi(G)-\ell}$ 的 immersion？

### 3.5 Dahlke 2026：精确 weak immersion

Dahlke 证明：

> [!success] Dahlke
> 若 $\alpha(G)=2$，则 $G$ 含有 $K_{\chi(G)}$ 的 weak immersion。

结合 Vergara 的等价性，这给出：

> [!success] 精确 $\alpha=2$ 结论
> 每个 $n$ 阶、$\alpha(G)=2$ 的图都含有 $K_{\lceil n/2\rceil}$ 的 weak immersion。

这是 $\alpha=2$ 方向的关键突破。

需要注意：这解决的是 **weak immersion**。  
对应的 **strong immersion** 精确版本仍未自动解决。

---

## 4. Dahlke 的新工具：cycle-matching colouring

Dahlke 证明的核心工具是 **cycle-matching colouring**。

### 4.1 定义

对一个 multigraph 的边着色，若每个 colour class 都是若干 vertex-disjoint 的以下结构之并：

- 单边；
- 奇圈；

则称为 cycle-matching colouring。

普通 edge-colouring 要求每个 colour class 是 matching。  
cycle-matching colouring 放宽了这个限制，允许奇圈出现。

> [!theorem] Cycle-matching Vizing theorem
> 每个 multigraph 都存在使用至多 $\Delta(G)$ 种颜色的 cycle-matching colouring。

### 4.2 为什么它适合 immersion？

Immersion construction 本质上是在安排很多 edge-disjoint paths。

普通 matching 只允许非常局部的一对一分配。  
但路由中常常需要一个小的局部结构同时服务多个 pair。

奇圈正好提供这种额外弹性。

> [!idea] 核心直觉
> Dahlke 把 immersion routing 转化为一种边着色问题。  
> colour class 不是简单 matching，而是“matching + odd cycles”。  
> 这使得每一层颜色都能被翻译成一组可控的 edge-disjoint 路由。

### 4.3 这条路线的潜力

这不是传统的 $\alpha=2$ clique-cover 归纳。

它更像一种新的范式：

$$
\text{routing demand}
\quad\longrightarrow\quad
\text{edge-colouring problem}
\quad\longrightarrow\quad
\text{immersion construction}.
$$

因此自然问题是：

> [!question]
> 对 $\alpha=3$ 或一般 $\alpha$，是否存在类似 cycle-matching colouring 的推广？

---

## 5. 三种方法路线

### A. 极值度数路线

代表论文：

- DeVos et al.
- Dvorak--Yepremyan
- Gauthier--Le--Wollan

核心思想：

> 从 minimum degree 或 chromatic number 出发，直接强迫大量 edge-disjoint paths。

优点：

- 适用于一般图；
- 给出全局线性界；
- 不依赖 $\alpha=2$ 的特殊结构。

局限：

- 常数损失较大；
- 很难直接达到 $K_{\lceil n/2\rceil}$ 这种精确目标。

### B. $\alpha=2$ 结构路线

代表论文：

- Vergara
- Quiroz
- Botler et al.

核心思想：

> 利用 $\overline G$ triangle-free、clique cover、matching decomposition、forbidden small subgraphs 等结构。

优点：

- 非常适合 $\alpha=2$；
- 能得到强得多的比例；
- 能解释 biclique immersion 的精确结果。

局限：

- 难以推广到 $\alpha=3$；
- 一旦补图不再 triangle-free，很多结构工具失效。

### C. Colouring/routing 路线

代表论文：

- Dahlke

核心思想：

> 把 immersion 的路由需求转化为边着色和局部分解问题。

优点：

- 达到 $\alpha=2$ 的精确 weak immersion 目标；
- 提供了不同于结构归纳的新语言；
- 可能启发 $\alpha\ge 3$ 的新方法。

局限：

- 目前主要在 $\alpha=2$ 中完成；
- 对更大 independence number 的正确推广形式还不清楚。

---

## 6. 与 minor 版本的关系

Immersion 和 minor 都是 Hadwiger 型问题中的“大 clique 结构”，但二者不可简单比较。

在 $\alpha=2$ 中，一个重要的 minor 问题是：

> [!question] $\alpha=2$ 的 Hadwiger 限制版
> 是否每个 $n$ 阶、$\alpha(G)=2$ 的图都含有 $K_{\lceil n/2\rceil}$ minor？

这是原始 Hadwiger 猜想限制在 $\alpha=2$ 图类上的形式。

已知 Duchet--Meyniel 给出 $n/3$ 量级，但是否能突破到 $\left(\frac13+\varepsilon\right)n$ 长期困难。

Chen--Deng 证明了 Seymour--Woodall 关于 complete bipartite graph minor 的猜想在 $\alpha=2$ 图类中成立。  
这与 Botler et al. 的 complete bipartite immersion 结果形成平行：

> [!note]
> 二部目标在 $\alpha=2$ 中已经相当清楚。  
> 但完整 clique minor 和 strong clique immersion 仍保留关键难点。

---

## 7. 当前图景

### 已解决

> [!success] $\alpha=2$ weak clique immersion
> 每个 $\alpha(G)=2$ 的图都含有 $K_{\chi(G)}$ 的 weak immersion。  
> 等价地，每个 $n$ 阶、$\alpha(G)=2$ 的图都含有 $K_{\lceil n/2\rceil}$ 的 weak immersion。  
> 证明：Dahlke 2026。

> [!success] $\alpha=2$ complete bipartite immersion
> 每个 $n$ 阶、$\alpha(G)=2$ 的图都含有所有 $K_{\ell,\lceil n/2\rceil-\ell}$ 的 immersion。  
> 证明：Botler et al. 2024。

> [!success] Weak immersion WQO
> 图在 weak immersion 序下是 well-quasi-ordered。  
> 证明：Robertson--Seymour。

### 仍开放

> [!question] 一般 Abu-Khzam--Langston 猜想
> 是否每个图 $G$ 都含有 $K_{\chi(G)}$ 的 weak immersion？

> [!question] $\alpha=2$ strong immersion
> 是否每个 $n$ 阶、$\alpha(G)=2$ 的图都含有 $K_{\lceil n/2\rceil}$ 的 strong immersion？

> [!question] $\alpha=3$
> 是否每个 $n$ 阶、$\alpha(G)=3$ 的图都含有 $K_{\lceil n/3\rceil}$ 的 immersion？

> [!question] 一般 $\alpha$
> 是否每个 $n$ 阶图 $G$ 都含有 $K_{\lceil n/\alpha(G)\rceil}$ 的 immersion？

> [!question] $\alpha=2$ clique minor
> 是否每个 $n$ 阶、$\alpha(G)=2$ 的图都含有 $K_{\lceil n/2\rceil}$ minor？

---

## 8. 推荐阅读路线

### 最短主线

1. **Vergara**  
   建立 $\alpha=2$ 的等价表述和 $n/3$ 起点。

2. **Gauthier--Le--Wollan**  
   理解一般图的线性理论，以及 $\alpha=2$ 中的 $2n/5$ 进展。

3. **Botler et al.**  
   理解 complete bipartite immersion 为什么是 clique immersion 前的重要中间目标。

4. **Dahlke**  
   学习 $\alpha=2$ 的最终 weak immersion 突破，以及 cycle-matching colouring。

### 扩展背景

5. **Bustamante--Quiroz--Stein--Zamora**  
   一般 independence number 的最好路线之一。

6. **Chen--Deng**  
   $\alpha=2$ 中 complete bipartite minor 的相邻突破。

7. **Robertson--Seymour**  
   immersion 作为图序的基础背景。

---

## 9. 参考文献

1. F. N. Abu-Khzam and M. A. Langston, *Graph coloring and the immersion order*, COCOON 2003.
2. F. Botler, C. G. Fernandes, C. N. Lintzmayer, R. A. Lopes, S. Mishra, B. L. Netto, and M. Sambinelli, *Immersions of large cliques in graphs with independence number 2 and bounded maximum degree*, arXiv:2506.09768.
3. F. Botler, A. Jimenez, C. N. Lintzmayer, A. Pastine, D. A. Quiroz, and M. Sambinelli, *Biclique immersions in graphs with independence number 2*, European Journal of Combinatorics 122 (2024), 104042; arXiv:2303.06483.
4. S. Bustamante, D. A. Quiroz, M. Stein, and J. Zamora, *Clique immersions and independence number*, European Journal of Combinatorics 106 (2022), 103550; arXiv:1907.01720.
5. R. Chen and Z. Deng, *Seymour and Woodall's conjecture holds for graphs with independence number two*, arXiv:2406.02643.
6. J. C. Dahlke, *The Abu-Khzam--Langston Conjecture for Graphs with $\alpha(G)=2$*, arXiv:2605.28159.
7. M. DeVos, Z. Dvorak, J. Fox, J. McDonald, B. Mohar, and D. Scheide, *A minimum degree condition forcing complete graph immersion*, Combinatorica 34 (2014), 279--298.
8. Z. Dvorak and L. Yepremyan, *Complete graph immersions and minimum degree*, Journal of Graph Theory 88 (2018), 211--221; arXiv:1512.00513.
9. G. Gauthier, T.-N. Le, and P. Wollan, *Forcing clique immersions through chromatic number*, European Journal of Combinatorics 81 (2019), 98--118; arXiv:1703.08235.
10. F. Lescure and H. Meyniel, *On a problem upon configurations contained in graphs with given chromatic number*, Annals of Discrete Mathematics 41 (1989), 325--331.
11. D. A. Quiroz, *Clique immersions in graphs of independence number two with certain forbidden subgraphs*, Discrete Mathematics 344 (2021), 112365; arXiv:2004.05433.
12. N. Robertson and P. Seymour, *Graph Minors XXIII. Nash-Williams' immersion conjecture*, Journal of Combinatorial Theory, Series B 100 (2010), 181--205.
13. P. Seymour, *Hadwiger's Conjecture*, in *Open Problems in Mathematics*, Springer, 2016.
14. S. Vergara, *Complete graph immersions in dense graphs*, Discrete Mathematics 340 (2017), 1019--1027.
