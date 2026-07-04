---
tags:
  - resilience_perturbation
  - graph_theory
category: concepts
---

图论里 **robustness** 通常问：

> 一个图已经有某个性质或结构后，经过删除、扰动、随机稀疏化、染色、嵌入失败等操作，它还能不能保留这个性质？

按“破坏方式”可以分成几类。

| 概念 | 破坏方式 | 典型性质 |
| --- | --- | --- |
| [[Local resilience]] | 每个顶点附近删边受限 | Hamilton cycle, perfect matching |
| [[Global resilience]] | 总删边数受限 | 连通性、Hamiltonicity |
| [[Resilience variants]] | edge / vertex / degree / codegree resilience | spanning structures |
| [[Robust expansion]] | 删边后仍有扩张性 | Hamiltonicity, decomposition |
| [[Robust Hamiltonicity]] | 扰动后仍 Hamiltonian | Hamilton cycle |
| [[Robust matchability]] | 删边/删点后仍有 matching | perfect matching |
| [[Random robustness]] | 随机删边/加边/稀疏化 | Hamiltonicity, expansion |
| [[Randomly perturbed graph]] | dense graph 加随机边 | Ramsey, Hamiltonicity, embedding |
| [[Robust universality]] | 删边后仍包含整个目标类 | bounded-degree spanning trees |
| [[Robust Ramsey property]] | 染色或删边后仍强制单色结构 | Ramsey / size-Ramsey |
| [[Graph vulnerability parameters]] | 最少删点/删边使图碎裂 | connectivity, toughness |

## Two Axes

第一条轴是 **adversarial vs random**。

- adversarial robustness：对手可以有策略地删边或删点，例如 [[Local resilience]]。
- random robustness：随机删边、随机加边或随机稀疏化后仍保留性质，例如 [[Randomly perturbed graph]]。

第二条轴是 **property vs structure**。

- property robustness：剩余图仍满足某个性质，如 connected / Hamiltonian。
- structure robustness：仍能找到某类具体结构，如所有 bounded-degree spanning trees，见 [[Robust universality]]。

## See also

- [[Sudakov–Vu (2008) — Local resilience of graphs]] — local resilience 的经典来源
- [[Chen et al. (2025) — Robustness for expander graphs]] — expander 的随机删边 robustness
- [[Spectral expander]] — 谱扩张常用于证明删边后仍 robust
- [[C-expander]] — 扩张性是很多 robust Hamiltonicity 证明的核心


