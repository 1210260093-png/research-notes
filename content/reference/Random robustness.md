---
tags:
  - resilience_perturbation
  - probabilistic_method
  - graph_theory
category: concepts
---

**Random robustness** 指图性质在随机操作下的稳定性。和 adversarial resilience 不同，这里的扰动通常是随机删边、随机加边或随机稀疏化。

## Main Forms

| 形式 | 问题 |
| --- | --- |
| random sparsification | 从 $G$ 中随机保留边，性质是否仍存在？ |
| random perturbation | 给 deterministic $G$ 加 $G(n,p)$，性质是否出现？ |
| sprinkling | 分多轮加入随机边，每轮保留可用结构 |
| hitting time robustness | 随机图过程到达某个局部条件时，是否立即获得全局性质？ |
| random subgraph robustness | $G_p$ 是否继承 $G$ 的 expansion / Hamiltonicity？ |

## Contrast with Local Resilience

[[Local resilience]] 是 adversarial deletion：对手选择最坏的删边方式。

random robustness 是 stochastic perturbation：边按随机规则加入或保留。它通常更容易成立，但结论也更接近 threshold theory。

## Typical Targets

- Hamilton cycle
- perfect matching
- expansion
- Ramsey property
- bounded-degree graph embedding

## See also

- [[Randomly perturbed graph]]
- [[Robust Hamiltonicity]]
- [[Robust Ramsey property]]
- [[Chen et al. (2025) — Robustness for expander graphs]]
- [[Hitting time for hamiltonian in expander]]


