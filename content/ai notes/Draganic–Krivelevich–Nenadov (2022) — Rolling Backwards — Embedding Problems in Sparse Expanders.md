---
title: "Rolling backwards can move you forward: On embedding problems in sparse expanders"
authors: "Nemanja Draganić, Michael Krivelevich, Rajko Nenadov"
year: 2022
source: "Transactions of the American Mathematical Society, 375(7), 5195–5216"
doi: "10.1090/tran/8660"
url: "https://www.ams.org/tran/2022-375-07/S0002-9947-2022-08660-8/"
zotero: "zotero://select/library/items/PGDTQ7H3"
status: "temporary note"
cssclasses:
  - paper-note
tags:
  - ai_draft
  - expanders
  - spectral_method
  - embedding_universality
  - roll_back
  - extremal_ramsey_turan
  - algorithmic_games
---

# Rolling backwards can move you forward: On embedding problems in sparse expanders

> [!summary] 读完先记住什么
> 这篇文章引入了 **roll-back（回滚）** 这一核心嵌入技术：不只是一路向前贪心嵌入，而是在卡住时**按顺序撤回之前的步骤**，释放空间后重新前进。作者用这一方法统一解决了三个看似不相关的问题：subdivision 的 size-Ramsey 数、在线点不交路径的算法构造、以及谱扩张图的大 topological minor。

## 背景：问题是什么

### 嵌入问题的共同困境

在 expander 中嵌入一个结构（树、路径系统、细分图、topological minor），最自然的做法是**贪心构造**：一步一步地把需要的边/路径加进去。Friedman–Pippenger 的 $(d,m)$-extendable 框架（[[Friedman–Pippenger (1987) — expanders contain small bounded-degree trees]]）正是这类贪心的理论基础。

但贪心有一个根本弱点：**局部选择可能堵死全局**。某一步选了"看起来不错"的嵌入，走了几步才发现——这个选择让后续构造无法继续。传统 expander 嵌入理论靠"扩张性提供充足备选"来回避这个问题，但备选终究有限。

**Roll-back 的直觉：** 如果允许算法**撤销并重试**已经完成的嵌入步骤，那么即使局部犯错，也能回退到安全状态重新选择。关键问题是：回退多少步？回退后不变量还能维持吗？

### 三座山峰

作者用 roll-back 攻下了三个独立但有深层联系的问题：

1. **Pak 猜想（2002）：** 有界度图的对数长度 subdivision 的 size-Ramsey 数是线性的
2. **Alon–Capalbo 问题（2007）：** 在 expander 中在线找到指定长度的点不交路径
3. **Fountoulakis–Kühn–Osthus 问题（2009）：** 谱扩张图能容纳多大的 complete topological minor？

三个问题看似无关——一个关于 Ramsey 理论，一个关于在线算法，一个关于 minor 理论——但都被 roll-back 这把钥匙打开。

## 主定理

> [!theorem] 三项主要结果
>
> **结果 1（Size-Ramsey，Theorem 1.1）：** 对任意有界最大度图 $H$，其对数长度 subdivision $H_{\log}$ 的 size-Ramsey 数 $\hat{r}(H_{\log})$ 是 $O(|V(H)|)$——即线性。这解决了 Pak 的猜想。
>
> **结果 2（在线点不交路径，Theorem 1.2）：** 存在确定性的多项式时间在线算法，在 $(n,d,\lambda)$-图（$d/\lambda\ge C$）中为任意序列的端点对请求找到指定长度的点不交路径，回答了 Alon 和 Capalbo 的问题。
>
> **结果 3（Topological minor，Theorem 1.3）：** 若 $d$-正则图满足 $\lambda/d$ 足够小，则包含 $K_t$ 的 topological minor，其中 $t=(1-o(1))d$。同时构造例子证明 $t=d+1$ 不可达，即使 $\lambda=O(\sqrt{d})$。

## 定义与符号

| 符号 | 含义 | 备注 |
| --- | --- | --- |
| $(d,m)$-extendable | Friedman–Pippenger 的不变量 | $S$ 有"扩展余量"来嵌入度为 $d$ 的树 |
| roll-back | 回滚操作 | 撤销最后若干步嵌入，释放顶点和边 |
| $H_{\log}$ | $H$ 的对数长度 subdivision | 每条边替换为长度 $\Theta(\log n)$ 的路径 |
| $\hat{r}(F)$ | $F$ 的 size-Ramsey 数 | 最小边数使得每个该边数的图有一个单色 $F$ |
| topological minor | 拓扑子式 | 通过边细分和删除得到的子图 |
| online algorithm | 在线算法 | 请求逐个到达，每个请求必须在下个之前处理 |

**Roll-back 操作（形式化）.** 设当前已嵌入子图 $S\subseteq G$。roll-back 允许：
1. 指定一个"回退点"——之前某步嵌入操作
2. 撤销从那步到当前的所有嵌入
3. $S$ 被替换为更早状态
4. 关键：回退后 $S$ 仍然满足 [[(D,m)-extendable|$(d,m)$-extendable]] 不变量（见 [[Roll-back|roll-back 引理]]）

**$(d,m)$-extendable.** 子图 $S$ 是 $(d,m)$-extendable 的，如果对任意 $X\subseteq V(G)$（$|X|\le 2m$），有
$$
|N_G(X)\setminus V(S)|\ge (d-1)|X|-\sum_{x\in X\cap V(S)}(d_S(x)-1).
$$
直觉：$S$ 还"留有"足够的邻域来扩展——即使 $S$ 已经占用了一些顶点。

## 证明流程

> [!route] 总体路线
> 三项结果是 roll-back 方法的三个"客户"。核心技术路线是：
>
> $$
> \text{Friedman–Pippenger 树嵌入}
> \Rightarrow
> \text{加入 roll-back 机制}
> \Rightarrow
> \text{通用嵌入引擎}
> \Rightarrow
> \begin{cases}
> \text{size-Ramsey 上界} \\
> \text{在线点不交路径} \\
> \text{topological minor 存在性}
> \end{cases}
> $$

### 技术底座：roll-back 嵌入引擎

**基础：Friedman–Pippenger 树嵌入。** 给定 $(d,m)$-extendable 子图 $S$ 和一棵最大度 $\le d$ 的树 $T$，可以将 $T$ 嵌入 $G$ 且与 $S$ 几乎不交。嵌入逐边进行，每步保持 $(d,m)$-extendable 不变量。

**增强：roll-back 引理（[[Roll-back]]）。** 设 $S+ys$ 是 $(d,m)$-extendable，则 $S$ 也是 $(d,m)$-extendable。这意味着：**撤回一步嵌入不破坏 extendability**。

这个引理看似平凡（条件强于结论），但它允许算法：
1. 按任何顺序尝试嵌入
2. 如果某步导致后续卡住 → 撤销那步 → 重新选择
3. 撤销后不变量仍然成立 → 可以继续嵌入

**通用算法框架：**
```
while 结构未完全嵌入:
    尝试用 Friedman-Pippenger 推进一步
    if 成功:
        继续
    else:
        回滚最后若干步
        选择不同的嵌入方案
        重新推进
```

### 结果 1: Size-Ramsey of Subdivisions

**目标：** 证明 $\hat{r}(H_{\log})=O(|V(H)|)$。

**构造方法：**
1. 取一个 size-Ramsey 最优的"宿主图"——一个 $(n,d,\lambda)$-expander（已知存在且边数 $O(n)$）
2. 把 $H_{\log}$ 的每条细分路径看作一个"待嵌入的树"
3. 用 roll-back 嵌入引擎逐路径嵌入 $H_{\log}$ 到 expander 中
4. 关键：$H_{\log}$ 的对数长度细分使得每条替换路径的端点距离 $O(\log n)$——恰好是 expander 直径级别
5. Roll-back 确保当某条细分路径的嵌入与已嵌入部分冲突时，可以调整旧路径而非从头开始

**为什么必须 roll-back：** $H_{\log}$ 不是一棵树——它包含圈。贪心嵌入树是容易的（Friedman–Pippenger 直接适用），但带圈的图需要处理"闭合条件"——路径 $P_1,P_2,\dots,P_k$ 形成圈要求终端精确对接。Roll-back 允许在发现对不齐时回退调整。

### 结果 2: 在线点不交路径

**目标：** 在线请求 $(s_1,t_1,\ell_1),(s_2,t_2,\ell_2),\dots$，每个请求要一条长度恰好为 $\ell_i$ 的 $(s_i,t_i)$-路径，且与之前所有路径点不交（内部顶点不交）。

**与 edge-disjoint 的区别：** vertex-disjoint 更难——顶点只能被一条路径使用，而一条边连接两个顶点，所以 vertex-disjoint 对资源限制更严格。

**算法：**
1. 维护已嵌入路径集 $\mathcal{P}$ 和预留顶点集 $R$（未被任何路径使用）
2. 新请求 $(s_i,t_i,\ell_i)$ 到达：
   - 尝试在 $R$ 中找长度为 $\ell_i$ 的 $(s_i,t_i)$-路径
   - 若找不到：选择 $\mathcal{P}$ 中某条旧路径 $P_j$，**回滚** $P_j$ 及之后的所有嵌入
   - 在释放的顶点上重新嵌入 $P_j$（不同的路由），同时嵌入新路径
3. 回滚深度由参数控制——只回退必要的步骤

**关键技术点：**
- **指定长度** 的要求使得问题更微妙——不能随便绕路，路径必须精确长度为 $\ell_i$
- expander 中任意两点间存在长度为任意 $(\text{dist}(u,v), O(\log n)]$ 区间内所有长度的路径——这由扩张性保证
- 回退一条路径释放 $O(\log n)$ 个顶点，通常足以满足新路径的需求

### 结果 3: Topological Minor from Spectral Expansion

**目标：** 从 $\lambda/d$ 小的条件推出大的 $K_t$ topological minor。

**证明分两步：**

**Step A: $\lambda/d$ 小 ⇒ 强扩张性。** 由 expander mixing lemma（[[Spectral expander]]），
$$
\lambda/d \le \varepsilon \quad\Longrightarrow\quad |N(S)|\ge (1-\varepsilon)d|S| \text{ for } |S|\le n/2.
$$
这意味着每步邻域增长 $d(1-\varepsilon)$ 倍。

**Step B: 强扩张性 + roll-back ⇒ $K_t$ topological minor。**

构造 $K_t$ topological minor 等价于：
- 选 $t$ 个"分支顶点" $v_1,\dots,v_t$
- 对每对 $(i,j)$，找一条 $(v_i,v_j)$-路径
- 所有路径内部顶点互不交

这是经典的"点不交路径系统"问题。用 roll-back 嵌入引擎：
1. 逐一嵌入 $v_i$ 到 $v_j$ 的路径
2. 当某条路径与之前路径冲突时，回滚并重路由
3. 由于 $t=(1-o(1))d$，总共 $\binom{t}{2}$ 条路径，每条长度 $O(\log n)$，总顶点需求在 expander 容量之内

**最优性反例：** 作者构造了一个 $\lambda=O(\sqrt{d})$ 的 $d$-正则图，但不含 $K_{d+1}$ topological minor——证明 $t=d+1$ 的理论上界在此条件下不可达。构造方法利用了某些"结构化障碍"（可能基于代数或几何构造）阻止了最后一个分支顶点的加入。

## 技术核心

1. **Roll-back = 贪心嵌入 + 纠错机制。**  
   Friedman–Pippenger 提供"推进引擎"，roll-back 提供"倒车档"。两者结合产生的不是简单的贪心，而是可以探索嵌入空间的局部搜索算法。

2. **$(d,m)$-extendable 是 roll-back 的不变量。**  
   这个不变量在回退操作下**单调不减**：回退前的状态满足它 ⇒ 回退后的状态也满足它。这保证了回退后不会陷入更差的境地——只会释放更多资源。

3. **三座山峰共享同一把钥匙。**  
   本文最大的 insight 是：size-Ramsey、在线路径、topological minor 表面不同，本质上都是"在不确定中逐步构造复杂结构"——而这正是 roll-back 擅长的。一法破三题。

4. **离线思路用在在线场景。**  
   结果 2 的在线算法虽然在（离线）expander 上运行，但它展示了 roll-back 的鲁棒性：即使在最坏情况的请求序列下，回退仍然有效——因为 expander 的局部总是有"足够的替代选择"。

5. **谱条件 → 扩张性 → 嵌入能力。**  
   结果 3 完成了"谱性质 → 组合性质 → 结构存在性"的经典三段论。$\lambda/d$ 是代数不变量，topological minor 是组合结构，中间的桥梁是扩张性 + roll-back。

## 与我的研究的关联

- **Roll-back 是 connector reservation 的"对偶"视角。**  
  Reserved connector 是**预装**连接能力（提前储备顶点），roll-back 是**后修**连接冲突（事后回退调整）。两者的共性是"不一次性固定所有选择"。
- **$(d,m)$-extendable 与 distributed set 的相似性。**  
  两者都在维护一种"局部均匀"的不变量：extendable 保证每处的邻域余量，distributed 保证每处的密度均匀。两者都用于支持后续构造不卡住。
- **结果 2 的指定长度路径是我 Hamilton 研究的相关物。**  
  Hamilton 圈本质上就是 $n$ 条指定长度（=1）的路径首尾相连。如果能用 roll-back 处理可变长度的路径，也许可以用于更灵活的 Hamilton 构造。
- **Topological minor 与 powers of cycles 的可能联系。**  
  $C_n^k$ 的局部看起来像 $K_{2k+1}$——一个 large clique minor/topological minor。结果 3 的框架也许能用来研究 $C_n^k$ 的 minor 结构。

## 可追踪问题

> [!question] 继续追的问题
> 1. Roll-back 的"回退深度"是否有上界？最坏情况下是否可能回退到起点（等效于完全重启）？
> 2. $(d,m)$-extendable 在回退下的单调性是否对任意图成立，还是只在 expander 中成立？
> 3. 三个结果中，roll-back 的用法是否有统一的形式化（例如：roll-back + 目标结构 = 嵌入方案）？
> 4. Topological minor 的反例构造是怎样的？它是通过什么代数/组合障碍阻止 $d+1$ 个分支顶点的？
> 5. Roll-back 能否与 [[Distributive absorption method|distributed absorption]] 结合——用吸收器替代部分回退，减少回退开销？

## 下一步精读

- Section 2：roll-back 的形式定义和 $(d,m)$-extendable 不变量——这是整篇文章的技术底座
- Section 3（Size-Ramsey）：看 roll-back 如何在"不能随便改结构"的 Ramsey 场景下工作
- Section 5（Topological minor 反例）：理解为什么 $t=d+1$ 不可达——这有助于理解 expander 的"嵌入极限"

## 日记

Roll-back 是那种"事后看很自然，但第一个想到需要跳跃"的想法。传统的 embedding 理论都在追求"一次成功"——选更好的不变量、更强的扩张条件、更聪明的贪心顺序。Draganić–Krivelevich–Nenadov 反其道而行之：**允许失败，但要有办法从失败中恢复**。

这让我想起计算机科学里的"回溯搜索"和"undo 操作"——但这里不是简单的回溯，而是在保持图论不变量（$(d,m)$-extendable）的前提下回退。正是因为有这个不变量，回退后的状态仍然"健康"——仍然可以继续从该状态出发进行嵌入。

对我自己的研究来说，roll-back 最值得借鉴的是：与其让 connector/reservoir 精确到能应对所有可能的需求（这往往需要大量储备），不如让系统有"纠错能力"——当需求超出预期时，能局部调整而不是全局重建。


