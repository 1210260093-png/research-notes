---
title: "Survey: Spread Measure and Robust Thresholds"
subtitle: "从 Kahn--Kalai 猜想到随机结构阈值工具箱"
date: 2026-06-11
tags:
  - survey
  - spread
  - threshold
  - random-structures
  - Kahn-Kalai
status: polished-draft
authors:
  - Me
---

# Spread Measure 与 Robust Thresholds 论文地图

> [!summary] 一句话版本
> 这份笔记把 18 篇论文按 spread、阈值、随机生成结构、Hamiltonicity 与设计理论重新排成一张阅读地图。  
> 主线是：spreadness 如何把“存在一个结构”升级为“存在一个不集中的结构分布”，并进一步导向 Kahn--Kalai 型阈值与随机图/超图中的鲁棒生成结果。

> [!tip] 读法
> 先看 **0. 总览** 确定五个方向，再读 **1. Kahn--Kalai / Spread / 阈值理论** 建立主线。  
> 如果关心应用，跳到 Hamiltonicity、随机图生成子结构和 Steiner Triple Systems 三部分。  
> 最后用 **6. 论文间的逻辑关系** 和 **7. 总结** 回看整张图。

> 分析日期：2026-06-11
> 论文来源：`C:\Users\aaazl\Desktop\中转站`
> 总计：18 篇 PDF

---

## 0. 总览

这 18 篇论文围绕**五个核心研究方向**：

| 主题 | 篇数 | 关键词 |
|------|------|--------|
| Kahn–Kalai 猜想 / Spread / 阈值 | 8 | spread, threshold, expectation-threshold, sunflower |
| Hamiltonicity / Dirac 型结果 | 3 | robust Hamiltonicity, perturbed graphs, square of cycle |
| 随机图 / 生成子结构 | 4 | spanning trees, F-cycles, perfect matchings, embedding |
| Steiner Triple Systems | 2 | STS, high-girth, design theory, threshold |
| Survey | 1 | sharp thresholds survey |

---

## 1. Kahn–Kalai 猜想 / Spread / 阈值理论（8 篇）

### 1. Park & Pham (2024) — *A Proof of the Kahn–Kalai Conjecture*

- **期刊**：J. Amer. Math. Soc., Vol. 37 (2024), 235–243
- **arXiv**：2203.17207

**主要结果**：证明了 Kahn–Kalai 猜想（"expectation-threshold 猜想"）：

$$
p_c(\mathcal{F}) = O\big(q(\mathcal{F}) \cdot \log \ell(\mathcal{F})\big)
$$

其中 $p_c$ 是递增性质 $\mathcal{F}$ 的阈值概率，$q(\mathcal{F})$ 是期望阈值（expectation-threshold），$\ell(\mathcal{F})$ 是最小极小元的规模。核心意义：**naive 的 union bound 下界在 $\log\ell$ 倍以内是紧的**。

**证明思路**：随机迭代构造。每一步随机采样坐标子集 $W_i$（概率 $Cq$），将当前函数 $f_{i-1}$ 限制到 $W_i$ 赋 1 后的 minterm 分为"大的"（→辅助函数 $g_i$）和"小的"（→下一步 $f_i$），迭代不超过 $\log_2\ell$ 步。

**贡献类型**：结果 + 方法（spread 方法的核心应用）。

---

### 2. Park & Vondrák (2024) — *A Simple Proof of the Nonuniform Kahn–Kalai Conjecture*

- **期刊**：arXiv 预印本 (2024)

**主要结果**：将 Park–Pham 定理推广到**非均匀乘积测度**（不同坐标可以有不同概率），给出了更简洁的证明，bound 为：

$$
p_c \leq 4 q_c \log_2(7\ell)
$$

**贡献类型**：方法（大幅简化证明，推广到非均匀测度）。

---

### 3. Tran & Vu (2024) — *A Short Proof of the Kahn–Kalai Conjecture*

- **期刊**：arXiv 预印本 (2024)

**主要结果**：以约一页的**归纳论证**重新证明了 Kahn–Kalai 猜想，常数约 3.998，是当时最简洁且常数最优的证明。

**证明思路**：对 $\ell(\mathcal{F})$ 做归纳，关键技巧是对布尔函数进行"分裂"然后应用归纳假设。

**贡献类型**：方法（极致简洁）。

---

### 4. Bell (2023) — *Park–Pham Theorem with Optimal Convergence Rate*

- **期刊**：arXiv 预印本 (2023)

**主要结果**：改进了 Park–Pham 定理的 $\varepsilon$-版本，得到**最优收敛速率** $O(1/\sqrt{q})$。具体地，若性质 $\mathcal{F}$ 在概率 $p$ 下成立的概率为 $1-\varepsilon$，则它能在 $p \cdot (1 + O(q\log\ell))$ 的概率下被覆盖。

**贡献类型**：方法（最优收敛速率）。

---

### 5. Pham, Sah, Sawhney & Simkin (2023) — *A Toolkit for Robust Thresholds*

- **期刊**：arXiv:2210.03064 (2023)

**主要结果**：将 Park–Pham 的 spread 方法发展为一套**通用工具包**，可以直接用于推导各种随机图/超图中生成结构的鲁棒阈值。核心是将 Kahn–Kalai 猜想的证明技术"产品化"：
- 阈值的一般上界框架
- 应用于**随机图 $G_{n,p}$** 和 **随机 $k$-超图 $\mathbb{G}^{(k)}(n,p)$** 的各种生成子结构（完美匹配、$K_r$-因子、生成树、Hamilton 圈、平方 Hamilton 圈、$F$-因子等）
- 证明一旦能给出合适的 spread 测度，阈值就自动上线

**贡献类型**：方法（技术产品化、大量应用的统一框架）。

---

### 6. Spiro (2023) — *A Smoother Notion of Spread Hypergraphs*

- **期刊**：arXiv 预印本 (2023)

**主要结果**：引入一种**更平滑的 spread 定义**，放宽了原定义中的某些技术限制。新的 spread 概念使框架更易应用，同时保留了稳健阈值的核心推论。证明了新定义下 spreadness 是旧定义的推广，且保留了"spread → 低阈值"的核心推理链。

**贡献类型**：方法（概念推广，降低应用门槛）。

---

### 7. Alweiss, Lovett, Wu & Zhang (2021) — *Improved Bounds for the Sunflower Lemma*

- **期刊**：Annals of Mathematics, Vol. 194 (2021), 795–815
- **arXiv**：1908.08483 | **初版**：STOC 2020

**主要结果**：对 Erdős–Rado (1960) 向日葵引理给出近 60 年来的首次重大改进。对任意 $r \geq 3$，存在常数 $C$ 使得：

$$
|\mathcal{F}| \geq \big(C r^3 \log w \log\log w\big)^w \quad\Longrightarrow\quad \text{包含 } r\text{-向日葵}
$$

将下界从型如 $w^w$（Ackermann-type）降至 $(\log w)^w$。**robust 向日葵定理**的 bound 在最次要项以内是最优的。

**证明思路**：首次引入 **spreadness**（均匀分布性）的雏形概念，结合编码论证和迭代结构定理。

**贡献类型**：结果 + 方法（spread 概念的发源地，启发了整个 Kahn–Kalai 系列）。

---

### 8. Kupavskii & Zakharov (2024) — *Spread Approximations for Forbidden Intersections*

- **期刊**：arXiv 预印本 (2024)

**主要结果**：将 spread 方法应用于**禁止相交问题**的近似。具体研究了集合族中禁止特定相交大小的 extremal 问题（Erdős–Ko–Rado 方向的推广），证明了一类禁止相交族的 spread 近似存在性，从而给出随机版本的上界。

**贡献类型**：结果（spread 方法在 extremal set theory 中的应用）。

---

## 2. Hamiltonicity / Dirac 型结果（3 篇）

### 9. Joos, Lang & Sanhueza-Matamala (2024) — *Robust Hamiltonicity*

- **期刊**：arXiv:2312.15262 (2024)

**主要结果**：研究了 Dirac 图的**鲁棒 Hamiltonicity**——给定一个满足 Dirac 条件（最小度 $\delta \geq n/2$）的图，即使对手**自适应地删除**一定比例的边，图仍然包含 Hamilton 圈。论文给出了对抗删除下仍保持 Hamiltonicity 的精确阈值条件，建立了 Dirac 图的 robust Hamiltonicity 框架。

**贡献类型**：结果 + 方法。

---

### 10. Anastos & Chakraborti (2023) — *Robust Hamiltonicity in Families of Dirac Graphs*

- **期刊**：arXiv 预印本 (2023)

**主要结果**：研究**一族 Dirac 图**的 robust Hamiltonicity——不仅是单张图，而是满足 Dirac 条件的图族中所有成员同时保留 Hamiltonicity 的稳健性条件。证明了存在一种边保留策略使得族中所有图同时具有 Hamiltonian 性质。

**贡献类型**：结果（从单图推广到图族）。

---

### 11. Böttcher, Parczyk, Sgueglia & Skokan (2024) — *Square of Hamilton Cycle in Perturbed Graphs*

- **期刊**：arXiv 预印本 (2024)

**主要结果**：证明了在**扰动图**（任意稠密图 + 少量随机边）中，Hamilton 圈的**平方**（距离 ≤2 的边也连接）以高概率存在。具体地，对任意 $G$ 满足最小度 $\delta(G) \geq \alpha n$，向 $G$ 中随机添加 $cn$ 条边后，结果图以高概率包含平方 Hamilton 圈。改进了已知的扰动图结果范围。

**贡献类型**：结果（平方 Hamilton 圈的扰动阈值）。

---

## 3. 随机图 / 生成子结构（4 篇）

### 12. Bastide, Legrand-Duchesne & Müyesser (2024) — *Random Embeddings of Bounded Degree Trees*

- **期刊**：arXiv 预印本 (2024)

**主要结果**：证明了**有界度树**在随机图 $G(n,p)$ 中的嵌入阈值。在 $p = \Omega(n^{-1} \log n)$ 的条件下（即 $G_{n,p}$ 几乎连通），任意最大度不超过 $\Delta$ 的 $n$-顶点树可以以高概率被嵌入。关键是用 spread 方法统一处理各种树嵌入问题。

**贡献类型**：结果（spread 方法在树嵌入中的首次明确应用）。

---

### 13. Diaz & Person (2023) — *Spanning $F$-cycles in Random Graphs*

- **期刊**：arXiv 预印本 (2023)

**主要结果**：确定了随机图 $G(n,p)$ 中包含**生成 $F$-圈**（以 $F$ 为因子的圈）的阈值。更精确地，对于给定的固定图 $F$，确定了 $G(n,p)$ 包含 $n/|F|$ 个 $F$ 拷贝按圈状连接而成的生成结构的 sharp threshold。

**贡献类型**：结果（$F$-圈的 sharp threshold）。

---

### 14. Kang, Kelly, Kühn, Osthus & Pfenninger (2024) — *Perfect Matchings in Random Sparsifications of Dirac Hypergraphs*

- **期刊**：arXiv 预印本 (2024)

**主要结果**：研究 Dirac 超图的**随机稀疏化**——从一个满足 Dirac 条件的 $k$-超图中随机保留每条边（概率 $p$），确定了结果超图包含完美匹配的最小 $p$。核心贡献是建立了超图 Dirac 条件下完美匹配的随机稳健阈值。

**贡献类型**：结果（Dirac 超图 → 随机稀疏化 → 完美匹配）。

---

### 15. Kelly, Müyesser & Pokrovskiy (2024) — *Optimal Spread for Spanning Subgraphs of Dirac Hypergraphs*

- **期刊**：J. Combin. Theory Ser. B (2024)
- **arXiv**：2308.08535

**主要结果**：为 Dirac 超图中的**生成子图**存在性构造了**最优的 spread 测度**。证明了在 Dirac 超图中，各种生成子结构（完美匹配、Hamilton 圈、$F$-因子等）对应的超图族具有最优 spreadness 上界，从而利用 spread → threshold 的框架推导出最优的阈值/鲁棒性结论。这是 spread 方法在 Diract 型结果中最深刻的应用。

**贡献类型**：方法（spread 框架 + Dirac 条件的最优结合）。

---

## 4. Steiner Triple Systems / 设计理论（2 篇）

### 16. Sah, Sawhney & Simkin (2023) — *Threshold for Steiner Triple Systems*

- **期刊**：Geometric and Functional Analysis (GAFA), Vol. 33 (2023), 1141–1172
- **arXiv**：2204.03964

**主要结果**：首次确定了**Steiner Triple System (STS)** 在随机 $3$-超图中的存在阈值：

$$
p = n^{-1+o(1)}
$$

即 $\mathbb{G}^{(3)}(n, p)$ 中当 $p = \exp(C(\log n)^{3/4})/n$ 时，以高概率包含一个阶为 $n$ 的 STS（当 $n \equiv 1, 3 \pmod{6}$）。下界由简单必要条件给出（每条 $K_n$ 的边必须出现在至少一个三角形中），对应的 threshold 也是 $n^{-1+o(1)}$，故结果是紧的（至多次指数因子）。

**证明思路**：利用 **Frankston–Kahn–Narayanan–Park (FKNP)** 的 spread 框架，结合新的**迭代吸收**方法（iterative absorption）。

**贡献类型**：结果（首个 STS 存在阈值）+ 方法（迭代吸收）。

---

### 17. Kwan, Sah, Sawhney & Simkin (2024) — *High-Girth Steiner Triple Systems*

- **期刊**：arXiv 预印本 / Inventiones Math. 待发表 (2024)

**主要结果**：证明了**高围长（high-girth）Steiner Triple System** 的存在性。不仅构造了阶为 $n$ 的 STS，而且保证了该 STS 的**围长**（girth，即最小三角形以外的最短圈长度）不低于某一增长函数。这解决了设计理论中的一个经典问题：是否存在任意大围长的 STS。

**贡献类型**：结果（高围长 STS 的存在性，解决了长期未解问题）+ 方法。

---

## 5. Survey（1 篇）

### 18. Perkins (2024) — *Searching for Sharp Thresholds in Random Structures: A Survey*

- **期刊**：Survey (2024)

**主要结果**：这是一篇**综述文章**，系统梳理了随机结构中**尖锐阈值（sharp threshold）**的研究进展。内容涵盖：
- Kahn–Kalai 猜想的提出背景与历史
- Park–Pham 证明的概览与核心思想
- Spread 方法的发展脉络：Alweiss–Lovett–Wu–Zhang → FKNP → Park–Pham → toolkit
- 各类应用：Steiner Triple Systems、Latin squares、完美匹配、图因子等
- 未解决的问题与未来方向

**贡献类型**：综述（了解领域全貌的最佳入口）。

---

## 6. 论文间的逻辑关系

```
Sunflower Lemma (Alweiss et al. 2021)
    │  首次引入 spread 概念
    ↓
FKNP Framework (Frankston–Kahn–Narayanan–Park)
    │  建立 spread → threshold 的一般框架
    ↓
Kahn–Kalai 证明 (Park–Pham 2024) ──── 核心突破
    │
    ├──→ Tran–Vu (2024)       简化证明，最优常数
    ├──→ Park–Vondrák (2024)   非均匀推广
    ├──→ Bell (2023)           最优收敛速率
    ├──→ Spiro (2023)          更平滑的 spread 定义
    │
    ↓
Toolkit (Pham–Sah–Sawhney–Simkin 2023)
    │  将 spread 方法产品化
    │
    ├──→ STS 阈值 (Sah–Sawhney–Simkin 2023)      首次非平凡阈值
    ├──→ High-Girth STS (Kwan–Sah–Sawhney–Simkin 2024)
    ├──→ Dirac 超图最优 spread (Kelly–Müyesser–Pokrovskiy 2024)
    ├──→ 随机稀疏化 + 完美匹配 (Kang et al. 2024)
    ├──→ 有界度树嵌入 (Bastide et al. 2024)
    ├──→ Robust Hamiltonicity (Joos–Lang–Sanhueza-Matamala 2024)
    ├──→ Robust Hamiltonicity 图族 (Anastos–Chakraborti 2023)
    ├──→ 平方 Hamilton 圈 (Böttcher et al. 2024)
    └──→ Spread + 禁止相交 (Kupavskii–Zakharov 2024)

Survey: Perkins (2024) 总结以上所有
```

---

## 7. 总结

这批论文共同构成了一个**紧密联系的数学体系**，核心驱动因素是 2021 年以来围绕 **spread** 概念的革命性进展：

1. **方法源头**：Sunflower Lemma (2021) → spread 概念诞生
2. **里程碑**：Park–Pham (2024) 证明 Kahn–Kalai 猜想
3. **方法成熟**：Toolkit (2023) 将 spread 方法标准化、产品化
4. **应用爆发**：STS、Dirac 超图、Hamiltonicity、嵌入、阈值——各方向全面开花
5. **完善优化**：新证明 (Tran–Vu, Park–Vondrák)、更优常数 (Bell)、更广定义 (Spiro)

你的研究课题（absorbing method, connector reservation, parity-switcher, robustness-thresholds, roll-back extendable, spread measure）与这些论文高度相关——特别是 **spread/阈值方向** 和 **robust Hamiltonicity** 两条线。

