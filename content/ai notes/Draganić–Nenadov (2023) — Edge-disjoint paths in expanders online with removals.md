---
title: "Edge-disjoint paths in expanders: online with removals"
authors: "Nemanja Draganić, Rajko Nenadov"
year: 2023
source: "arXiv:2310.13082"
arxiv: "2310.13082"
url: "https://arxiv.org/abs/2310.13082"
zotero: "zotero://select/library/items/223AYHKW"
status: "temporary note"
cssclasses:
  - paper-note
tags:
  - ai_draft
  - expanders
  - routing_connectors
  - roll_back
  - algorithmic_games
---

# Edge-disjoint paths in expanders: online with removals

> [!summary] 读完先记住什么
> 这篇文章把 roll-back 嵌入从**离线推到在线**：请求一个一个到达，算法必须立即决定接受或拒绝（不能预知未来），但可以通过**切换旧路径到替代路由**来为新请求腾空间。在 $(n,d,\lambda)$-图中（$d/\lambda\ge C$），接受 $\Omega(n)$ 个请求，路径长度 $O(\log n)$，每条边至多被 $O(1)$ 条路径共享。

## 背景：问题是什么

在 expander graph 里找边不交的路径是一个经典问题。离线版本（事先知道所有请求）可以用 [[手写 notes/Draganic–Krivelevich–Nenadov (2022) — Rolling Backwards — Embedding Problems in Sparse Expanders|roll-back 方法]] 解决：嵌入→发现死路→回退→重试。

但在线版本困难得多：
- 请求**一个接一个到达**，看不到未来
- 必须**立即决定接受或拒绝**
- 一旦拒绝就永远丢失（不可逆）
- 更关键的是：还允许**删除旧请求**——释放的边可以被新请求使用

核心挑战：如何在不知道"下一个请求是什么"的情况下，为未来预留足够的灵活性？

## 主定理

> [!theorem] Main Theorem
> 存在绝对常数 $C>0$，在 $(n,d,\lambda)$-图 $G$（$d/\lambda\ge C$）上存在一个确定性的多项式时间在线算法，处理任意序列的两种请求：
>
> **类型 1（添加路径）：** 给定 $a,b\in V(G)$，每个作为端点在 $O(d)$ 条活跃路径中出现，且当前 $|\mathcal{P}|=O(nd/\log n)$，算法找到一条长度 $\le\log n$ 的 $(a,b)$-路径，与 $\mathcal{P}$ 中所有路径边不交，加入 $\mathcal{P}$。
>
> **类型 2（删除路径）：** 给定 $P\in\mathcal{P}$，从 $\mathcal{P}$ 中移除。
>
> 每个请求在不知道后续请求的情况下处理。路径长度上界和约束都是最优的（相差至多常数因子）。

**补充说明：**
- 这是**第一个**同时支持在线添加和删除的 expander 边不交路径算法
- "deterministic polynomial time"——不仅是存在性，而是可有效构造
- 路径长度 $O(\log n)$ 是最优的：expander 直径就是 $\Theta(\log n)$
- 端点约束 $O(d)$ 也是必要的：如果某个顶点被太多路径使用，它的边会耗尽

## 定义与符号

| 符号 | 含义 | 备注 |
| --- | --- | --- |
| $\mathcal{P}$ | 活跃路径集合 | 每条 $P\in\mathcal{P}$ 绑定一个替代路径池 $\text{Alt}(P)$ |
| $\text{Alt}(P)$ | $P$ 的替代路径池 | $P$ 可以从当前路由切换到池中任意路径 |
| expander | $(n,d,\lambda)$-图 | 满足 $d/\lambda\ge C$ 的 $d$-正则图 |
| BFS collision | 两端同时 BFS 的相遇 | 产生指数多近似最短路径的机制 |
| switching | 路径切换操作 | 把一条旧路径从当前路由换到替代路径 |

**替代路径池（Alternative path pool）.** 对每条活跃路径 $P$ 连接 $u$ 到 $v$，算法维护一个集合 $\text{Alt}(P)$，包含多条连接同样端点 $(u,v)$ 的路径，满足：
- 每条替代路径长度 $O(\log n)$
- 替代路径之间边集几乎不交
- 任何时刻至少有一条替代路径使用当前空闲的边

直觉：$\text{Alt}(P)$ 就是 $P$ 的"逃生路线"——当 $P$ 占用的边被其他路径需要时，$P$ 可以快速切换到备选路线。

## 证明流程

> [!route] 总体路线
> 证明的核心是维护一个不变量，使得替代路径池始终有充足候选：
>
> $$
> \text{每条边至多被 } O(1) \text{ 条活跃路径使用}
> \Rightarrow
> \text{大量边空闲}
> \Rightarrow
> \text{替代路径池始终可刷新}
> \Rightarrow
> \text{新请求总能找到切换方案}
> $$

### Step 1: 替代路径池的构造（BFS 碰撞引理）

**Lemma（指数多路径）：** 在 $(n,d,\lambda)$-图中（$d/\lambda\ge C$），对任意 $u,v\in V(G)$，存在至少 $(d/\lambda)^{\Omega(\log n)}$ 条长度 $O(\log n)$ 且边集几乎不交的 $(u,v)$-路径。

**构造方法：**
1. 从 $u$ 和 $v$ 同时做 BFS，每步各自向外扩展一层
2. expander mixing lemma 保证每层大小至少增长 $d/\lambda$ 倍
3. $\log_{d/\lambda} n$ 步后，两棵 BFS 树相遇——相遇点构成一个"碰撞集合"
4. 碰撞集合的每个点对应一条 $u\to v$ 路径（$u$ 到碰撞点 + 碰撞点到 $v$）
5. 不同碰撞点的路径在相遇层不共享边——因为 BFS 树的边从根向外是单向的

这就是 expander 中"两点之间存在指数多近似最短路径"的定量版本。证明本质上是 expander mixing lemma 的直接应用。

### Step 2: 在线切换算法

**状态维护：** 活跃路径集 $\mathcal{P}$（$|\mathcal{P}|\le n/4$），每条 $P\in\mathcal{P}$ 绑定 $\text{Alt}(P)$。

**处理"添加路径 $(a,b)$"请求：**

1. **直接尝试：** 在空闲边（未被 $\mathcal{P}$ 使用的边）中 BFS 找最短 $(a,b)$-路径。若成功，加入 $\mathcal{P}$，为其构造 $\text{Alt}(P)$，返回。

2. **切换搜索：** 若直接 BFS 失败（空闲边不够），遍历 $\mathcal{P}$ 中的每条路径 $P$：
   - 检查 $P$ 的替换池 $\text{Alt}(P)$ 中是否有某条路径 $P'$ 使用当前空闲边
   - 若有：**切换** $P$ 到 $P'$，释放 $P$ 原来占用的边
   - 用释放的边 + 原有空闲边再次尝试连接 $(a,b)$
   - 若成功，更新 $P$ 的替代池，为新路径构造替代池，返回

3. **拒绝：** 若遍历完 $\mathcal{P}$ 仍无法为新请求找到路径，拒绝该请求。

**处理"删除路径 $P$"请求：** 直接从 $\mathcal{P}$ 移除 $P$，释放其占用的所有边。

### Step 3: 不变量分析

**关键不变量：** 在任何时刻，
$$
\text{每条边 } e\in E(G) \text{ 至多被 } O(1) \text{ 条活跃路径使用}.
$$

**为什么这个不变量成立：**
- 每条活跃路径长度 $O(\log n)$
- 活跃路径总数 $|\mathcal{P}|=O(nd/\log n)$
- 总占用边数 $\le O(|\mathcal{P}|\cdot\log n)=O(nd)$
- 图的总边数 $\Theta(nd)$

所以平均每条边被 $O(1)$ 条路径使用。更精细的分析（用 expander mixing lemma 控制局部拥塞）证明最大值也是 $O(1)$。

**由此推出：** 大部分边空闲 → 对任意端点对，BFS 碰撞引理保证存在大量几乎不交的替代路径 → 替代池始终有可用候选 → 切换总能在 $O(1)$ 次尝试内成功。

### Step 4: 竞争比分析

算法接受 $\Omega(n)$ 个请求（whp），每条路径长度 $O(\log n)$。这是因为：
- 图有 $\Theta(nd)$ 条边
- 每条活跃路径占用 $O(\log n)$ 条边
- 不变量保证总占用 $O(nd)$ 条边
- 所以可以容纳 $\Omega(nd/\log n)=\Omega(n)$ 条路径（当 $d$ 为常数时）

竞争比 $O(\log n)$：离线最优解可以容纳 $\Theta(nd/\log n)$ 条路径，在线算法接受 $\Omega(nd/\log n)$ 条。

## 技术核心

1. **替代路径池 = roll-back 的在线版本。**  
   离线 roll-back 是"犯错→回退→重试"。在线版本是"预先准备逃生路线→需要时切换"。两者本质相同：通过灵活性储备来应对不确定性。

2. **BFS 碰撞引理是路径多样性的来源。**  
   在 expander 中，任意两点之间不仅有短路径，而且有**指数多**条几乎不交的短路径。这远超"存在一条短路径"——它意味着路径空间的丰富性足以支持灵活的替换。

3. **切换操作保持不变量。**  
   每次切换只改变一条路径的路由，不改变活跃路径集合的大小和端点。因此不变量（每条边 $O(1)$ 条路径）在切换前后保持不变。

4. **确定性和多项式时间。**  
   所有操作（BFS、搜索替代池、切换）都是确定性的多项式时间。算法不需要随机性——expander 的结构性质已经提供了足够的"伪随机"保证。

5. **端点度约束 $O(d)$ 是必要的。**  
   如果某个顶点 $v$ 出现在 $\omega(d)$ 条路径中，它的 $d$ 条邻边不够分配——必然有冲突。因此 $O(d)$ 约束不是算法的局限，而是问题的内在下界。

## 与我的研究的关联

- 与 [[手写 notes/Draganic–Krivelevich–Nenadov (2022) — Rolling Backwards — Embedding Problems in Sparse Expanders|roll-back 论文]] 一脉相承：离线 roll-back 的在线延伸
- 替代路径池思想与 [[Reserved connector theorem|reserved connector]] 类似——都是预先储备"灵活性"，但储备方式不同（替代路径 vs 预留顶点集）
- BFS 碰撞引理与 [[Nenadov (2023) — Routing Permutations on Spectral Expanders via Matchings|匹配路由论文]] 中的 $\ell$-步邻域增长是同一类 expander 性质的不同用法
- 在线 + 删除的模型更接近真实网络场景（连接动态到达和离开）

## 可追踪问题

> [!question] 继续追的问题
> 1. 替代路径池能否推广到 vertex-disjoint paths？vertex-disjoint 的在线版本有什么额外困难？
> 2. 如果将"删除"操作扩展为"修改端点"（即重路由一整条路径），算法还能保持竞争比吗？
> 3. BFS 碰撞引理在 directed expander 中是否成立？
> 4. 替代路径池和 reserved connector 的 reservoir 能否统一为一个"灵活性储备"框架？
> 5. 在线模型中，如果允许算法以概率 $p$ 拒绝（而不是必须确定性地回答），能否突破 $O(nd/\log n)$ 的容量上界？

## 下一步精读

- Section 3：BFS 碰撞引理的精确定理陈述和证明——这是所有替代路径的来源
- Section 4：切换算法的伪代码和分析——理解不变量如何在每次操作中保持
- Section 5：竞争比下界——理解为什么 $O(\log n)$ 因子是必要的

## 日记

这篇文章最让我印象深刻的是：它展示了 expander 的结构丰富性——不仅有一条短路径，而是有指数多条。这种丰富性是在线鲁棒性的来源。将离线 roll-back 转化为在线切换是一个巧妙的思路跃迁：不是等卡住了再回退，而是预先铺好逃生路线。

从 connector reservation 的角度看，替代路径池和 reserved connector 都是在做同一件事：**在需要之前就准备好备选方案**。区别在于 reserved connector 储备的是顶点（用于连接器），而替代路径池储备的是路径（用于切换）。两者的结合可能是更强大 routing 框架的基础。


