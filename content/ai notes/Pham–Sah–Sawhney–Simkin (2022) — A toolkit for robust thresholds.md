---
type: paper
title: A Toolkit for Robust Thresholds
authors:
  - Huy Tuan Pham
  - Ashwin Sah
  - Mehtaab Sawhney
  - Michael Simkin
arxiv: ""
journal: ""
year: 2022
date: ""
tags:
  - spread_thresholds
  - probabilistic_method
citekey: BT4BIPGF
category: papers
zotero: ""
level: 3
keywords:
  - thresholds
  - spread measure
  - Rödl nibble
  - robust thresholds
  - codegree
status: read
艺名: PSSS定理
---

# A Toolkit for Robust Thresholds

## 1. 基本信息、背景与问题

**我为什么读这篇**：FKNP 证明了 $p_c\le Kq_f\log\ell$ 对所有单调性质 universal 成立，但 $\log\ell$ 因子在有些问题中不是最优的。本文把 spread 分布和 Rödl nibble 结合，发展出一套可精确确定阈值（去掉对数损失）的工具包。

> [!abstract] 一句话总结
> 本文把 spread 分布和 Rödl nibble 结合——在可以构造并维护 spread 结构的具体模型中，可以精确确定阈值（去掉对数损失）。不是 "FKNP 但无 log"，而是适用于满足额外结构性条件的设定。

**这篇文章研究的问题是**：

> [!question] 核心问题
> 在什么条件下，可以用 nibble 迭代替代 FKNP 的一次性 hitting，从而去掉 universal $\log\ell$ 因子？

**相关背景**：

- 已知结果 1：FKNP 给出 $p_c\le Kq_f\log\ell$（universal，所有单调性质）
- 已知结果 2：对许多具体性质，$\log\ell$ 不是紧的
- **本文改进**：对可构造 spread + codegree bounded 的性质，给出 $p_c\le C(r)\cdot q$（无对数损失）

---

## 2. 主定理

> [!theorem] Theorem（Robust Threshold）
> 设 $\mathcal{H}$ 是 $r$-bounded $r$-uniform hypergraph，顶点集为 $X$。若存在 $X$ 上的 $q$-spread 概率测度 $\mu$（支撑在 $\mathcal{H}$ 的边上），且 $\mathcal{H}$ 的 codegree 充分小（任意两条边交 $\le r-2$ 个顶点），则存在绝对常数 $C=C(r)$ 使得
> $$
> p_c(\mathcal{H})\le C\cdot q.
> $$

条件的含义：

| 条件 | 作用 | 能否放松 |
|------|------|----------|
| $q$-spread 测度存在 | 提供初始均匀性 | 必须可构造 |
| codegree $\le r-2$ | 保证 nibble 冲突图稀疏 | 本质性的 |
| $r$-uniform | 每条边大小固定 | 可推广 |

**"Robust" 的三层含义**：
- 对 adversarial deletion robust（删除少量顶点/边后阈值不变）
- 对每轮 nibble leftover robust（迭代残留结构保持 spread）
- 常数 $C$ 不依赖于 $\ell$——去掉了 $\log\ell$ 因子

---

## 3. 证明主线

> [!idea] 整体思路
> 把 FKNP 的"一次性 spread hitting"替换为"逐轮 nibble"——每轮用 spread 测度随机选取一小部分不交的目标结构（超边），更新剩余结构和测度，保持 spread 性质不退化。迭代到全部顶点被覆盖。

### Step 1. 建立基础结构——Nibble 框架

1. **Ground hypergraph**：$\mathcal{H}$（$r$-uniform），顶点 $X$，每条边对应一个目标结构
2. **每轮操作**：
   - 从当前 spread 测度 $\mu_i$ 随机选取一小部分超边，使它们**两两不交**（codegree 条件保证冲突图足够稀疏）
   - 将这些超边的顶点从 $X$ 中移除
   - 更新 $\mu_i\to\mu_{i+1}$：在剩余顶点上重新定义 spread 测度
3. **冲突管理**：codegree $\le r-2$ 条件保证随机选取的超边间冲突少——标准 Rödl nibble 的 setting
4. **迭代轮数**：$\approx\log_{1+\varepsilon}|X|$ 轮，每轮消耗约 $\varepsilon$ 比例的顶点

### Step 2. 核心 invariant

每轮维护的不变量：

$$
\mu_i(\{S:S\supseteq T\})\le q_i^{|T|}\quad\text{对剩余顶点集上所有 }T,
$$

其中 $q_i$ 从 $q$ 开始，每轮变为 $q_{i+1}=q_i(1+o(1))$。spread 参数在迭代中几乎不退化。

### Step 3. 为什么能去 log

FKNP 一次性覆盖所有大小 $\le\ell$ 的极小元：$\log\ell$ 轮中每轮的命中率被 spread 均匀性所限（spread 条件给上界不给下界）。PSSS 不需要一次覆盖所有——每次只选一小部分不交的结构，条件更温和，spread 参数几乎不退化。最终迭代到全覆盖时，总概率消耗 = $q$（无 $\log\ell$ 放大）。

---

## 4. 关键引理

> [!lemma] Nibble main lemma
> 在 codegree bounded + spread measure 存在的条件下，单步 nibble 后剩余结构仍满足 spread，且 $q_i\to q_{i+1}=q_i(1+o(1))$。

**作用**：保证迭代可行性——spread 不退化是去 $\log\ell$ 的核心。

---

## 5. 技术亮点 & 可复用思想

> [!tip] 可拿走的方法
> 1. **Spread + nibble 组合**：spread 提供初始均匀性 + 每轮 invariant，nibble 提供逐步覆盖机制
> 2. **去 log 的条件**：codegree bounded 是关键——它保证冲突图稀疏，nibble 可行
> 3. **迭代 invariant 维护**：每轮 nibble 后的 spread 更新是技术核心

**适用条件 vs 边界**：

| 能用 PSSS | 不能用 PSSS |
|-----------|------------|
| 目标结构之间 codegree bounded | 目标结构高度相交 |
| 可构造够强的 spread measure | 无法构造 spread measure |
| Host 是完整随机图 | Host 是稀疏伪随机图（需额外分析） |
| 局部目标（$H$-因子等） | universality 问题（spanning tree universality） |

**应用表**：

| 应用 | 旧结果（FKNP） | PSSS 改进 | 需要条件 |
|------|-------------|----------|----------|
| $H$-因子 | $p_c=O(q_f\log n)$ | $p_c=O(q_f)$（sharp） | codegree on copies bounded |
| Ramsey 性质 | 含 $\log n$ 损失 | 去 log | codegree on monochromatic copies |
| 超图完美匹配 | $p_c=O(p_0\log n)$ | $p_c=O(p_0)$ | codegree $\le r-2$ |

**与 FKNP 的精确对比**：

| | FKNP | PSSS |
|------|------|------|
| 适用范围 | 所有单调性质 | 可构造 spread + codegree bounded |
| 结论 | $p_c\le Kq_f\log\ell$ | $p_c\le C(r)\cdot q$ |
| 对数损失 | universal（不可去） | 去掉了（结构允许） |
| 方法 | LP 对偶 + hitting lemma | Spread + Rödl nibble 迭代 |
| 每轮 invariant | 无（一次性） | spread 参数几乎不退化 |

---

## 6. 我没完全懂的地方

- [ ] nibble main lemma 的精确陈述：invariant 的数学形式，one-step update 的 $q_i$ 变化
- [ ] codegree 条件在 expander spanning tree 中是否成立？
- [ ] 文中应用的完整列表（是否有其他？）

---

## 7. 和我研究方向的关系

如果要用于 expander spanning tree，需逐一检查：

1. **Target family**：是什么？所有 bounded-degree spanning trees as subgraphs in $G_p$ where $G$ is an $(n,d,\lambda)$-graph？
2. **Spread measure**：是否存在 natural spread measure on embeddings / trees / connectors？[[Reserved connector theorem]] 是否提供？
3. **Conflict graph**：两个目标树的"冲突"是什么？共享边/顶点？codegree 是否符合 nibble 条件？
4. **Leftover invariant**：每轮移除 embedded tree 后，剩余 expander 仍满足 $(D,m)$-extendable？这与 [[Roll-back]] 和 [[Extendable method]] 的关系如何？
5. **Host graph 的非独立性**：ground set 是 expander 的边而非完整图——spread 定义中的 $X_p$ 是 expander 的随机子图，需调整理论。

这些不是自动成立的——"直接应用"需要逐项验证。

---

## 8. 后续计划

- [ ] 精确陈述 nibble main lemma 的 invariant
- [ ] 检查 expander spanning tree 中 codegree 条件是否成立
- [ ] 评估是否值得在 expander setting 中实现 nibble 迭代


