---
title: "Routing Permutations on Spectral Expanders via Matchings"
authors: "Rajko Nenadov"
year: 2023
source: "Combinatorica, 43(4), 737–742"
doi: "10.1007/s00493-023-00033-8"
url: "https://link.springer.com/10.1007/s00493-023-00033-8"
zotero: "zotero://select/library/items/D6XIFLYJ"
status: "temporary note"
cssclasses:
  - paper-note
tags:
  - ai_draft
  - expanders
  - routing_connectors
  - sorting_network
  - matchings_tilings_factors
---

# Routing Permutations on Spectral Expanders via Matchings

> [!summary] 读完先记住什么
> 给一个 $(n,d,\lambda)$-图和一个任意置换 $\pi$，能不能在图里找到 $n$ 条互不干扰的路径，把每个 $v$ 连到 $\pi(v)$？答案是能——只要 $d/\lambda\ge C$。方法出奇地简洁：把路由问题转化为辅助二部图中的完美匹配，验证 Hall 条件，再用 expander 的去交引理把匹配变成点不交路径。

## 背景：问题是什么

### 路由问题（Permutation Routing）

输入：
- 一个 $(n,d,\lambda)$-图 $G$（$d$-正则，$\lambda$ 是邻接矩阵第二大特征值的绝对值）
- 一个置换 $\pi:[n]\to[n]$

输出：$n$ 条**顶点不交**的路径 $\{P_v\}_{v\in V(G)}$，其中 $P_v$ 连接 $v$ 和 $\pi(v)$。

### 为什么难

在完全图 $K_n$ 里这是平凡的——每对 $(v,\pi(v))$ 直接连边即可。但在 $d$-正则 expander（$d$ 可以是常数）中：
- 每个顶点只有 $d$ 条邻边
- $n$ 条点不交路径意味着几乎所有边都被占用
- 路径必须共享图的结构，精心协调

### 与已知结果的关系

这个问题有三条解决路线：

| 方法 | 代表工作 | 特点 |
| --- | --- | --- |
| 排序网络 | Ajtai–Komlós–Szemerédi (1983) [[Ajtai et al. (1983) — An 0(n log n) sorting network]] | 显式构造，但需要特定图结构 |
| 预留连接器 | [[Reserved connector theorem]] | 预先储备顶点作为通用连接器，灵活但构造复杂 |
| **匹配归约（本文）** | Nenadov (2023) | 存在性证明，最简洁，不构造具体路径 |

本文属于第三条路线。它给出的不是显式算法，而是一个**简洁的存在性证明**——用匹配理论的一条经典定理（Hall）替代了复杂的构造。

## 主定理

> [!theorem] Theorem
> 存在绝对常数 $C>0$，使得对任意 $(n,d,\lambda)$-图 $G$ 满足 $d/\lambda\ge C$，以及任意置换 $\pi: V(G)\to V(G)$，存在 $n$ 条顶点不交的路径 $\{P_v\}_{v\in V(G)}$，其中 $P_v$ 连接 $v$ 和 $\pi(v)$，且每条路径长度至多
> $$
> \ell = C\frac{\log n}{\log(d/\lambda)}.
> $$

**几个要点：**
- **条件极弱：** $d/\lambda\ge C$ 就是"足够好的谱扩张性"——没有对度数的额外要求（$d$ 可以是常数）
- **长度最优：** $\log n/\log(d/\lambda)$ 是 expander 直径的数量级——不可能更短
- **对任意置换成立：** 不需要 $\pi$ 是某种"好"置换（比如 identity 或交换），任意排列都能路由
- **存在性而非构造性：** 证明保证路径存在，但不给出找它们的算法

## 定义与符号

| 符号 | 含义 | 备注 |
| --- | --- | --- |
| $G$ | $(n,d,\lambda)$-图 | $d$-正则，$\lambda$ = 第二大特征值绝对值 |
| $\pi$ | 置换 | $\pi(v)$ 是 $v$ 的"目标" |
| $\ell$ | 最大路径长度 | $\ell=C\log n/\log(d/\lambda)$ |
| $H$ | 辅助二部图 $(L,R)$ | $L$ 是源副本，$R$ 是目标副本 |
| $N_G^\ell(S)$ | $S$ 的 $\ell$-步邻域 | 从 $S$ 出发走 $\le\ell$ 步可达的顶点集 |
| $P_v$ | 连接 $v$ 到 $\pi(v)$ 的路径 | 长度 $\le\ell$，且所有 $P_v$ 点不交 |

**辅助图 $H$ 的构造：**
- $L=\{v^L:v\in V(G)\}$ ——"源"副本
- $R=\{v^R:v\in V(G)\}$ ——"目标"副本
- $(u^L,v^R)\in E(H)$ 当且仅当 $G$ 中有一条长度 $\le\ell$ 的 $(u,v)$-路径

$H$ 将"在 $G$ 中找一条短路径"转化为"在 $H$ 中找一条边"。

## 证明流程

> [!route] 总体路线
> 证明分两步，每一步都很干净：
>
> $$
> \text{expander 邻域增长}
> \Rightarrow
> \text{Hall 条件成立}
> \Rightarrow
> \text{辅助图 }H\text{ 有完美匹配}
> \Rightarrow
> \text{去交引理}
> \Rightarrow
> \text{匹配边} \rightarrow \text{点不交路径}.
> $$

### Step 1: 证明 $H$ 有完美匹配

**核心工具：Hall 婚姻定理。** 二部图 $(L,R)$ 有完美匹配当且仅当对任意 $S\subseteq L$，$|N_H(S)|\ge|S|$。

**验证 Hall 条件——用 expander 的邻域增长：**

已知 $(n,d,\lambda)$-图 $G$ 满足以下邻域增长性质（[[Spectral expander]]）：
$$
|N_G^\ell(S)|\ge\min\left(\frac{n}{2},\,|S|\cdot\left(\frac{d}{\lambda}\right)^{\ell-1}\right).
$$

取 $\ell=C\log n/\log(d/\lambda)$ 使得 $(d/\lambda)^{\ell-1}\ge n$。则对任意非空 $S\subseteq L$：
$$
|N_G^\ell(S)|\ge\min(n/2,\,|S|\cdot n)\ge n/2.
$$

在辅助图 $H$ 中，$N_H(S)$ 恰好就是 $N_G^\ell(S)$ 在 $R$ 中对应的副本。因此：
$$
|N_H(S)|\ge n/2\ge|S|\quad(\text{当 }|S|\le n/2\text{ 时}).
$$

对于 $|S|>n/2$，如果 $|N_H(S)|<|S|$，则 $R\setminus N_H(S)$ 是在 $R$ 侧不被 $S$ 覆盖的顶点集 $T$，满足 $|T|=n-|N_H(S)|>n-|S|$。由对称性，$N_H(T)$ 与 $S$ 不交——从而 $|N_H(T)|\le n-|S|<|T|$，与 $|T|\le n/2$ 的 Hall 条件矛盾。

因此 Hall 条件全局成立 → $H$ 有完美匹配 $M$。

### Step 2: 去交引理（从匹配到点不交路径）

**问题：** $M$ 给出 $n$ 条路径 $\{P_v\}$——每条匹配边 $(v^L,\pi(v)^R)$ 对应 $G$ 中一条长度 $\le\ell$ 的 $(v,\pi(v))$-路径。但这些路径**可能相交**——它们在 $G$ 中可能共享顶点。

**去交引理（Deconfliction Lemma）：** 在 $(n,d,\lambda)$-图（$d/\lambda\ge C$）中，若存在覆盖所有顶点的长度 $\le\ell$ 的路径族（允许相交），则存在长度 $\le 3\ell$ 且**点不交**的路径族覆盖相同的端点对。

**去交的机制：**

假设两条路径 $P_u$ 和 $P_v$ 在顶点 $x$ 处相交：
1. 在 $x$ 附近找一条"绕路"——用 expander 的局部边来重新路由 $P_u$ 避开 $P_v$
2. expander mixing lemma 保证：$x$ 的邻域中有 $\Omega(d)$ 个顶点，其中至少 $\Omega(d)$ 个不在 $\{P_w\}$ 的已占用顶点中
3. 将 $P_u$ 穿过 $x$ 的那一段替换为绕路（长度增加 $\le O(1)$）
4. 重复直到所有冲突消除

**关键参数：**
- 每条路径初始长度 $\le\ell$
- 每次去交最多增加 $O(1)$ 长度
- 每个顶点至多被一条路径使用（最终状态）
- 一条路径最多被重路由 $O(\log n)$ 次（因为每次重路由减少某种势函数）
- 最终路径长度 $\le\ell+O(\log n)=O(\ell)$

### Step 3: 完成证明

将去交引理应用于 Step 1 得到的匹配路径族 → 得到 $n$ 条点不交的路径，每条长度 $\le O(\ell)=O(\log n/\log(d/\lambda))$。

调整参数 $C$ 吸收常数因子，即得定理陈述。

## 技术核心

1. **归约的艺术——路由 → 匹配。**  
   这是本文最漂亮的 insight。路由（一个图论/几何问题）被转化为匹配（一个组合/代数问题）。这一步消解了所有几何复杂性——Hall 条件只关心"有多少顶点可达"，不关心"路径怎么走"。

2. **$\ell$-步邻域增长是 expander 的"全部"。**  
   整个 Hall 条件验证只用到了 expander 的一个性质：小集合的 $\ell$-步邻域很大。所有其他 expander 性质（mixing lemma、Cheeger 不等式等）都没有直接出现。这说明对于路由问题，邻域增长就是 expander 的"核心能力"。

3. **去交是"后处理"。**  
   证明的结构是先忽略"不交"约束找路径（任意相交都行），找到后再去交。这种"先解松弛问题再修正"的策略非常聪明——它在最容易的地方用匹配（不考虑相交），在最需要的地方用 expander（逐点解冲突）。

4. **与排序网络和预留连接器的三角关系。**  
   | 方法 | 构造性 | 灵活性 | 简洁性 |
   |---|---|---|---|
   | 排序网络 (AKS) | 显式 | 固定 | 中 |
   | 预留连接器 | 隐式（概率方法） | 最强（任意 $\phi$） | 低（构造复杂） |
   | **匹配归约（本文）** | 纯存在性 | 弱（只证明存在） | **最高** |
   
   三者互补。匹配方法最简洁——适合快速建立"这个图类可以路由"的信心。

5. **$\ell$ 的取值是最优的。**  
   $\ell=C\log n/\log(d/\lambda)$ 恰好是 expander 的直径量级。如果路径更短，expander 中某些点对之间可能根本没有路径，Hall 条件会失败。因此路径长度的下界来自 expander 的结构极限，上界来自算法保证——达到最优（相差常数因子）。

## 与我的研究的关联

- 这是我三个"expander 中路由"视角之一（排序网络 / reserved connector / matching），与 [[Reserved connector theorem]] 互补
- 匹配归约的"先松弛再修正"策略可能适用于 Hamilton 构造：先找覆盖所有顶点的 2-正则子图（允许是多个圈的并），再"去交"（连接）为单个圈
- Hall 条件验证中的邻域增长与 [[Spectral expander]] 的核心性质直接挂钩——这是最干净的"谱→组合"应用之一
- 路径长度 $\log n/\log(d/\lambda)$ 与 connector 路径长度量级一致——说明这是 expander 中"局部连接"的自然尺度

## 可追踪问题

> [!question] 继续追的问题
> 1. 去交引理能否改进为**保持长度不增**？即能否找到长度仍为 $\le\ell$（而非 $3\ell$）的点不交路径？
> 2. 如果 $\pi$ 是某个"好"置换（比如有界位移），路径长度能否进一步缩短？
> 3. 匹配归约能否推广到边不交路径（而非点不交）？辅助图应该怎么改？
> 4. 能否将存在性证明变成构造性算法？即在多项式时间内**找到**这些点不交路径？
> 5. 如果图不是正则的，但保持谱扩张条件（如 irregular expander），匹配归约还能工作吗？

## 下一步精读

- Section 2：$\ell$-步邻域增长的精确陈述——理解 expander 的邻域增长如何与 $d/\lambda$ 挂钩
- Section 3（去交引理）：细节最值得看——如何在 expander 中"局部绕路"而不引起连锁冲突
- 与 AKS sorting network 和 reserved connector 的量化比较——理解三种方法的"常数因子"差异

## 日记

Nenadov 这篇 4 页的 Combinatorica 短文是我读过的最优雅的 expander 路由证明。核心想法只有两个：(1) 用匹配来"抽象掉"路径的几何，(2) 在最后一步才用 expander 来处理相交。这种"推迟处理困难约束"的策略非常值得学习。

与 [[Draganić–Nenadov (2023) — Edge-disjoint paths in expanders online with removals]] 和 [[Draganic–Krivelevich–Nenadov (2022) — Rolling Backwards — Embedding Problems in Sparse Expanders]] 一起，这三篇文章构成了 Nenadov 的"expander 嵌入三部曲"：roll-back 处理离线嵌入，在线切换处理动态请求，匹配归约处理置换路由。三者从不同角度说明同一个道理：expander 的结构丰富性远超"直径小"——它能在各种约束下灵活地找到路径。


