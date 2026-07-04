---
title: "Unbounded degree spanning hypertrees in Dirac hypergraphs"
authors: [Yaobin Chen, Seonghyuk Im, Junchi Zhang]
year: 2025
citekey: 65Q7ZUZG
tags:
  - ai_draft
  - roll_back
  - absorbing_method
  - spanning_trees
  - dirac_type
category: papers
level: 3
---

论文：Unbounded degree spanning hypertrees in Dirac hypergraphs

作者：Yaobin Chen、Seonghyuk Im、Junchi Zhang（2025）

---

## 完整定理

设 $H$ 是 $k$-均匀 Dirac 超图：每个 $(k-1)$-子集至少包含在 $(\frac12+o(1))n$ 条超边中。

则 $H$ 包含任意最大度 $\le\Delta$ 的生成超树，其中 $\Delta$ 可以随 $n$ 增长（$\Delta\to\infty$ as $n\to\infty$）。

## 无界度带来的新困难

之前 spanning tree/hypertree 嵌入工作（[[Johannsen et al. (2011)]]、[[Han–Yang (2023)]]、[[Hyde et al. (2023)]]）都要求目标树最大度 $\Delta$ 是常数。这保证了：
- 每个顶点嵌入时最多需要常数个邻居
- 吸收器的大小是常数
- LLL 的依赖度有界

当 $\Delta\to\infty$ 时：
- 某些"高度顶点"需要 $\Delta$ 个邻居——在嵌入时必须占用大量局部边
- 吸收器的大小随 $\Delta$ 增长——可能与图的全局大小竞争
- LLL 的依赖度可能超线性——传统的 LLL 不适用

## 方法：分层吸收体系

**核心思想**：将高度顶点的嵌入需求分解为多个层次，每层只处理常数度的连接。

### 树分解的多粒度版本

将目标超树 $T$ 分解为 $\log\Delta$ 层：
- 最底层：度 $\le\Delta_0$（常数）的常规部分——用标准方法嵌入
- 中间层：度在 $\Delta_0$ 和 $\Delta$ 之间的顶点——每层处理一个"度范围"
- 最顶层：度最大的少数顶点——专门处理

每层内部的最大度为常数→标准嵌入技术可用。层与层之间通过特殊的"过渡连接器"对接。

### 层级吸收器

每层配备专门的吸收器族：
- 低层吸收器：大小常数，处理常规度
- 中层吸收器：大小 $\Theta(\Delta_i)$（$\Delta_i$ 是该层的度上限），处理中等度
- 高层吸收器：大小 $O(\Delta)$，处理最高度

层级吸收器之间通过"纵向连接"（跨层连接路径）协调工作。吸收一个剩余顶点可能涉及多个层级的吸收器协同操作。

### Roll-back 在高层的作用

高层（度大）的嵌入更容易出错——一步错可能堵死后续很多步骤。Roll-back 在高层触发更频繁、撤回步数更多。低层（度小）相对稳定，很少需要回退。

## Dirac 条件的作用

Dirac 条件 $(\frac12+o(1))n$ 保证超图在每个局部区域有"几乎最大可能"的度。这为分层吸收器的构造提供了充足的原始材料——每层都能从超图的相应部分中抽取所需的结构。

## 与我的研究的关系

- 无界最大度是 spanning tree 嵌入的自然推广——许多实际网络中的生成树度并不小
- Yaobin Chen 在此文中同时使用吸收法和 roll-back——两种技术的协同是其研究风格
- 分层结构的设计思想在更复杂的嵌入问题中有普遍价值


