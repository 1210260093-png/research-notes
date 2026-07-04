---
title: "The Hamilton space of pseudorandom graphs"
authors: "Micha Christoph, Rajko Nenadov, Kalina Petrova"
year: 2026
source: "Journal of Combinatorial Theory, Series B, 176, 254–267"
doi: "10.1016/j.jctb.2025.09.002"
url: "https://linkinghub.elsevier.com/retrieve/pii/S0095895625000693"
zotero: "zotero://select/library/items/6VZAFAVZ"
status: "temporary note"
cssclasses:
  - paper-note
tags:
  - ai_draft
  - hamiltonicity
  - expanders
  - pseudorandom_graphs
  - spectral_method
  - parity_switcher
---

# The Hamilton space of pseudorandom graphs

> [!summary] 读完先记住什么
> 以前只知道 expander 里**存在** Hamilton 圈。这篇文章问了一个更深刻的问题：所有的 Hamilton 圈放在一起，它们的对称差能生成多大的空间？答案是：**几乎所有偶圈都能被 Hamilton 圈生成**——这意味着 Hamilton 圈不是孤零零几个，而是丰富到足以"编织"出几乎整个 cycle space。核心工具是一个叫 **parity-switcher** 的局部 gadget——它能翻转一个圈相对于参考结构的奇偶性——从而允许从一个 Hamilton 圈逐步"变形"到另一个。

## 背景：问题是什么

### 从"存在一个"到"空间有多大"

经典的 Hamiltonicity 研究的是：给定图 $G$，$G$ 是否包含 Hamilton 圈？

- 对于 $(n,d,\lambda)$-图（$d/\lambda\ge C$），答案是肯定的——多篇工作证明了 expander 中 Hamilton 圈的存在性，例如 [[Draganić–Montgomery–Munhá Correia–Pokrovskiy–Sudakov (2024) — Hamiltonicity of expanders]]、[[Ferber et al. (2025) — Hamiltonicity of Sparse Pseudorandom Graphs]]。

本文跳到了下一层问题：**如果 expander 有 Hamilton 圈，那么它的 Hamilton 圈"集合"有多大？确切地说，它们在 $\mathbb{F}_2$ 上张成的向量空间有多大？**

### Cycle Space 和 Hamilton Space

图 $G$ 的边集可以看作 $\mathbb{F}_2$ 上的向量空间 $\mathcal{E}(G)$（每条边是 $\{0,1\}$ 坐标）。一个圈（cycle）$C\subseteq E(G)$ 是该空间中的一个向量。

- **Cycle space $\mathcal{C}(G)$：** 所有圈张成的子空间。经典结果：对连通图，$\dim\mathcal{C}(G)=e(G)-n+1$。一个基由基本圈（spanning tree 的非树边）给出。

- **Even cycle space $\mathcal{C}_{\text{even}}(G)$：** 所有**偶长度**圈张成的子空间。对二部图，$\mathcal{C}_{\text{even}}(G)=\mathcal{C}(G)$；对非二部图，$\dim\mathcal{C}_{\text{even}}(G)=e(G)-n$。

- **Hamilton space $\operatorname{Ham}(G)$：** 由**所有 Hamilton 圈**（作为 $\mathbb{F}_2$ 向量）张成的子空间。

**核心问题：** $\operatorname{Ham}(G)$ 有多大？它等于整个 $\mathcal{C}(G)$ 吗？如果不是，差多少？

直观上，Hamilton 圈是最"长"的圈——它们应该能组合出各种短的和中等的圈。但具体能生成多少，取决于图的结构。

## 主定理

> [!theorem] Theorem 1（Hamilton 空间几乎等于偶圈空间）
> 存在绝对常数 $C>0$，使得对每个 $(n,d,\lambda)$-图 $G$（$d/\lambda\ge C$），有
> $$
> \operatorname{Ham}(G)\supseteq\mathcal{C}_{\text{even}}(G),
> $$
> 即所有偶圈都在 Hamilton 圈张成的空间里。

> [!theorem] Theorem 2（最优性——奇圈不保证被生成）
> 上述包含是最优的：存在 $(n,d,\lambda)$-图（$d/\lambda\ge C$）和一个奇圈 $C_{\text{odd}}$ 满足 $C_{\text{odd}}\notin\operatorname{Ham}(G)$。

**推论（维数下界）：** 对连通非二部图，
$$
\dim(\operatorname{Ham}(G))\ge e(G)-n.
$$

相比之下，整个 cycle space 的维数是 $e(G)-n+1$。所以 Hamilton 圈张成的空间几乎等于整个 cycle space——就差奇圈那一维。对二部图（所有圈都是偶的），$\operatorname{Ham}(G)=\mathcal{C}(G)$——Hamilton 圈生成了**整个** cycle space。

## 定义与符号

| 符号 | 含义 | 备注 |
| --- | --- | --- |
| $\mathcal{C}(G)$ | cycle space | 所有圈（作为 $\mathbb{F}_2$ 向量）张成的子空间 |
| $\mathcal{C}_{\text{even}}(G)$ | even cycle space | 所有偶圈张成的子空间，维数 $e(G)-n$（非二部） |
| $\operatorname{Ham}(G)$ | Hamilton space | 所有 Hamilton 圈张成的子空间 |
| $\triangle$ | 对称差 | 两个边集的对称差 = 在 $\mathbb{F}_2$ 中的加法 |
| $R$-parity-switcher | 相对 $R$ 的奇偶切换器 | 内部有两条 parity 不同的 spanning path |
| $W$ | parity-switcher 占用的顶点子集 | $|W|=O(\log^2 n)$ |
| $P_{\text{even}},P_{\text{odd}}$ | switcher 的两条内部路径 | 在 $R$ 中的边数分别为偶数和奇数 |

**Cycle space 的基.** 取任意 spanning tree $T$，对每条非树边 $e\notin T$，$T\cup\{e\}$ 包含唯一一个圈（基本圈）。所有基本圈构成 $\mathcal{C}(G)$ 的一组基。

**Hamilton 圈作为向量.** 对 Hamilton 圈 $H$，其对应的向量 $h\in\mathbb{F}_2^{e(G)}$ 满足：$h(e)=1$ 当且仅当 $e\in E(H)$。$\operatorname{Ham}(G)$ 是所有这样的 $h$（对所有 Hamilton 圈 $H$）张成的子空间。

## [[Parity-switcher]]：本文的核心发明

在 expander 中如何构造？

在 $(n,d,\lambda)$-图（$d/\lambda\ge C$）中构造 parity-switcher：

1. **找偶环 $C$：** expander 中有大量长度 $\le O(\log n)$ 的圈。从中筛选满足"与 $R$ 的交有奇数条边"的偶环——用 expander mixing lemma 证明存在性。

2. **找内部路径 $P_i$：** $v_i$ 和 $v_{2k-i+2}$ 之间的最短路径长度 $O(\log n)$。用 Menger 定理 + 扩张性保证可找到互不交的路径族。

3. **找外部路径 $Q_1,Q_2$：** 选 $a,b$ 在 $W$ 外部足够远处。

总大小 $|W|=O(\log^2 n)$。

## 证明流程

> [!route] 总体路线
> 证明的核心是"用 parity-switcher 做局部手术"：
>
> $$
> \text{散布 parity-switcher 网络}
> \Rightarrow
> \text{初始 Hamilton 圈 }H_0
> \Rightarrow
> \text{沿 }C_{\text{even}}\text{ 逐边切换}
> \Rightarrow
> H_0\triangle C_{\text{even}}\text{ 也是 Hamilton 圈}
> \Rightarrow
> C_{\text{even}}\in\operatorname{Ham}(G).
> $$

### Step 1: 构造 Parity-Switcher 网络（Lemma 3.1）

在 $G$ 中散布 $\Theta(n/\log^2 n)$ 个互不交的 parity-switcher。

**构造方法：**
1. 随机选取"种子顶点"——以一定概率在种子周围尝试构造 parity-switcher
2. 每个种子以正概率成功构造一个 $W$
3. 用 Lovász Local Lemma（[[Lovász Local Lemma (LLL)]]）选出一组互不冲突的 switcher
4. LLL 条件可满足：每个 $W$ 大小 $O(\log^2 n)$，在 expander 中至多与 $\operatorname{poly}(\log n)$ 个其他种子的区域冲突——依赖度可控

**为何需要这么多 switcher：** 每个 switcher 只能"翻转"一条边。要覆盖整个 $C_{\text{even}}$（长度可能达到 $\Theta(n)$），需要 $\Theta(n)$ 个 switcher 协同工作——每个翻转 $C_{\text{even}}$ 中的一条边。

### Step 2: 用 Parity-Switcher 翻转一条边（Lemma 3.2）

> [!lemma] Switching Lemma
> 设 $W$ 是 $R$-parity-switcher，$a,b$ 是其外部接口。则 $W$ 内部存在两条 $(a,b)$-路径 $P_{\text{even}}$ 和 $P_{\text{odd}}$，满足：
> - 两者覆盖 $W$ 的所有内部顶点
> - $|E(P_{\text{even}})\cap E(R)|$ 是偶数
> - $|E(P_{\text{odd}})\cap E(R)|$ 是奇数

**如何用这个引理翻转一条边 $e\in C_{\text{even}}$：**

设当前有一个 Hamilton 圈 $H$，我们要"翻转" $H$ 中包含 $e$ 的状态（即从 $H$ 变为 $H\triangle\{e\}$——注意这只是一个边集变化，实际需要构造另一个 Hamilton 圈 $H'$）。

1. 在边 $e$ 附近找一个 parity-switcher $W$（$e$ 在 $W$ 的"影响范围"内）
2. 将 $H$ 穿过 $W$ 的路由替换为 $P_{\text{odd}}$（或 $P_{\text{even}}$）
3. 结果 $H'$ 仍然是 Hamilton 圈（因为 $P_{\text{odd}}$ 覆盖了 $W$ 的所有内部顶点）
4. $H'$ 与 $H$ 的唯一区别在于 $W$ 内部——而 $W$ 内部的奇偶性恰好翻转了 $e$ 的贡献

**技术要点：** $H$ 在进入 $W$ 之前和离开 $W$ 之后的路由不变。$W$ 就像一个"黑盒手术室"——内部可以切换奇偶性，外部完全不受影响。

### Step 3: 沿偶圈逐边切换（Theorem 1 的证明）

设 $C_{\text{even}}$ 是任意偶圈。证明 $C_{\text{even}}\in\operatorname{Ham}(G)$：

1. **选初始 Hamilton 圈 $H_0$。** expander 中 Hamilton 圈存在（由 [[Draganić et al. (2024) — Hamiltonicity of expanders]] 等结果保证）。

2. **沿 $C_{\text{even}}$ 的边走：** 设 $C_{\text{even}}=(e_1,e_2,\dots,e_{2m})$（偶长度）。

3. **逐边切换：** 对 $i=1,2,\dots,2m$：
   - 在 $e_i$ 附近找到 parity-switcher $W_i$
   - 执行切换操作：$H_{i-1}\to H_i$，其中 $H_i$ 与 $H_{i-1}$ 在 $W_i$ 内部路由不同
   - $H_i$ 仍然是 Hamilton 圈

4. **最终结果：** 经过 $2m$ 步后，
   $$
   H_{2m}=H_0\triangle C_{\text{even}}.
   $$
   因为 $C_{\text{even}}$ 的每条边被翻转了恰好一次（$2m$ 是偶数，整体效应是每条边出现一次）。

5. **结论：** $C_{\text{even}}=H_0\triangle H_{2m}$ 是两个 Hamilton 圈的对称差 → $C_{\text{even}}\in\operatorname{Ham}(G)$。

**为什么必须是偶圈：** 如果 $C$ 是奇圈（长度为奇数），则 $H_0\triangle C$ 中每个顶点的度数奇偶性会改变——奇圈 + 偶置换 → 顶点的度从 2 变为奇数——结果不可能是 Hamilton 圈。因此奇圈不能用"对称差两个 Hamilton 圈"的方式被生成。

### Step 4: 奇圈的最优性（Theorem 2）

在非二部 expander 中，存在奇圈 $C_{\text{odd}}\notin\operatorname{Ham}(G)$。

**构造方法：** 利用 $n$ 的奇偶性。若 $n$ 是奇数，则考虑条件 (C2) 和 (C3) 的最大子图 $R$（参见 [[Parity-switcher#Key Lemma|Parity-switcher Key Lemma]]）。可以证明存在某个奇圈不能由 Hamilton 圈生成——因为它与所有 Hamilton 圈的 $\mathbb{F}_2$ 内积非零。

这个最优性结果说明：本文的 Theorem 1 **精确刻画了** $\operatorname{Ham}(G)$——它就是偶圈空间，不多不少。

## 技术核心

1. **Parity-switcher 是"局部不影响全局"的典范。**  
   每个 switcher 大小 $O(\log^2 n)$，在 $n$ 个顶点的图中是微小的。但数量足够（$\Theta(n/\log^2 n)$）使得每个位置附近都有 switcher 可用。这体现了 expander 的"局部丰富性"。

2. **从"存在一个 Hamilton 圈"到"Hamilton 空间 = 偶圈空间"是质的飞跃。**  
   前者是 Hamiltonicity 研究的标准终点，后者在代数层面揭示了 Hamilton 圈的丰富度。它说明 expander 的 Hamilton 圈不是"侥幸找到的几个"——而是一整个高维空间的生成元。

3. **与 Hefetz–Krivelevich (2026) 的独立发现。**  
   两篇论文在同一年独立发现了 parity-switcher 这个 gadget。区别在于：
   | 方面 | Hefetz–Krivelevich | Christoph–Nenadov–Petrova |
   |---|---|---|
   | 图类 | 随机正则图 $G_{n,d}$（whp） | $(n,d,\lambda)$-图（确定性的） |
   | 结果性质 | 概率性的（whp） | 确定性的（$d/\lambda\ge C$） |
   | 技术核心 | 相同（parity-switcher） | 相同（parity-switcher） |

   这是罕见的"不同团队独立发现相同 gadget"案例——强有力地说明 parity-switcher 是 Hamilton 空间研究的"正确"工具。

4. **$\mathbb{F}_2$ 视角是 Hamilton 研究的代数化。**  
   将 Hamilton 圈视为边空间的向量，将切换视为向量加法——这是将组合问题代数化的经典策略。与 Pósa rotation 的组合视角互补。

5. **LLL 用于散布局部 gadget。**  
   散布 $\Theta(n/\log^2 n)$ 个互不交的 parity-switcher 是 LLL 的经典应用场景：每个 gadget 大小 $O(\log^2 n)$，冲突图度 $\operatorname{poly}(\log n)$，条件易满足。

## 与我的研究的关联

- [[Parity-switcher]] 是我 theorems 文件夹中整理的核心 gadget——本文是其"确定性的 expander 版本"
- Hamilton 空间是最强的 Hamiltonicity 结论——不仅有一个 Hamilton 圈，而是一整个"空间"那么多的 Hamilton 圈
- $d/\lambda\ge C$ 作为"足够好的伪随机性"的标准再次出现——与 [[Christoph et al. (2025) — New bounds for linear arboricity and related problems|Christoph et al. (2025)]]、[[Draganić–Montgomery–Munhá Correia–Pokrovskiy–Sudakov (2024) — Hamiltonicity of expanders]] 等论文一致
- Parity-switcher 的构造展示了在 expander 中"局部调整而不影响全局"的技术——这与 [[Absorbing method|absorbing method]] 的 philosophy 相同
- 与 [[Connector Reservation]] 不同：connector 处理的是"从已有结构生成新连接"，parity-switcher 处理的是"在已有的 Hamilton 圈之间切换奇偶性"

## 可追踪问题

> [!question] 继续追的问题
> 1. Parity-switcher 的最小可能大小是多少？$O(\log^2 n)$ 能否改进为 $O(\log n)$？
> 2. 能否用 parity-switcher 给出 $\dim(\operatorname{Ham}(G))$ 的精确值（而非仅下界）？什么情况下 $\operatorname{Ham}(G)=\mathcal{C}(G)$？
> 3. Parity-switcher 在非 expander 图中（如 $C_n^k$、随机扰动图）是否也能构造？
> 4. 与 Hefetz–Krivelevich 的随机版本相比，确定性的 $d/\lambda$ 条件是否可放松？临界 $d/\lambda$ 值是多少？
> 5. Hamilton 空间的"生成效率"——需要多少个 Hamilton 圈才能生成所有偶圈？$\Theta(n)$ 是最优的吗？

## 下一步精读

- Section 2：$\mathbb{F}_2$ 线性代数框架——cycle space, cut space, orthogonal complement 的精确定义
- Section 3：Parity-switcher 的构造细节——LLL 参数和 existence proof
- Section 4：Switching Lemma（Lemma 3.2）的证明——理解如何从 parity-switcher 结构中提取 $P_{\text{even}}$ 和 $P_{\text{odd}}$
- 与 Hefetz–Krivelevich (2026) 的比较——两个版本 parity-switcher 的异同

## 日记

这篇文章是我目前读过的 Hamiltonicity 论文里最"代数化"的一篇。它不满足于"存在一个 Hamilton 圈"，而是揭示了 expander 中 Hamilton 圈的代数结构——它们生成的空间几乎就是整个 cycle space。Parity-switcher 是一个天才级的 gadget 发明——它把"翻转一个圈中一条边的奇偶性"这个微妙的需求，转化为了一个可构造、可散布的局部子图。

从哲学层面看，这篇文章呼应了一个深刻的主题：**expander 不仅仅是"连通的"，而是"代数上丰富的"**。Hamilton 空间几乎等于 cycle space，这意味着 expander 中的 Hamilton 圈多到可以"编码"所有偶圈——这种丰富性是随机性和伪随机性共有的特征。


