---
tags:
  - resilience_perturbation
  - graph_theory
category: concepts
---

设 $G$ 是图，$\mathcal P$ 是一个图性质。$G$ 关于 $\mathcal P$ 的 **global resilience** 衡量：

> 总共删掉多少条边或多少个顶点后，剩余图仍然满足 $\mathcal P$。

边版本可以写成：若对任意 $H\subseteq G$，只要
$$
e(H)\le r
$$
就有
$$
G-H\in\mathcal P,
$$
则 $G$ 关于 $\mathcal P$ 的 global edge resilience 至少为 $r$。

## Local vs Global

global resilience 限制的是总删除量；[[Local resilience]] 限制的是每个顶点附近的删除量。

local resilience 通常更强，因为对手可以把删除集中到结构最脆弱的地方。例如删掉很少的总边数就能孤立一个顶点，从而破坏 Hamiltonicity；所以对于 spanning properties，纯 global resilience 往往太粗。

## Typical Use

- 连通性：至少要删掉 edge connectivity 条边才能断开。
- Hamiltonicity：总删边数不是最自然的尺度，local resilience 更有用。
- Ramsey / universality：有时研究删掉一个稀疏子图后性质是否仍保留。

## See also

- [[Local resilience]]
- [[Graph vulnerability parameters]]
- [[Robust Hamiltonicity]]


