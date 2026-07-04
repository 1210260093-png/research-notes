---
tags:
  - hamiltonicity
  - resilience_perturbation
  - graph_theory
category: concepts
---

**Robust Hamiltonicity** 指一个图在某种扰动后仍然 Hamiltonian。

它不是单一正式定义，而是一簇问题：

| 类型 | 含义 |
| --- | --- |
| local resilience of Hamiltonicity | 每个顶点附近删边后仍有 Hamilton cycle |
| random robustness | 随机稀疏化后仍 Hamiltonian |
| robust expansion implies Hamiltonicity | robust expander 一定 Hamiltonian |
| Hamiltonian after perturbation | dense / pseudorandom host 加随机边后 Hamiltonian |

## Prototypical Example

Dirac 定理可以看成 $K_n$ 的 Hamiltonicity resilience 原型：

$$
\delta(G)\ge n/2 \Rightarrow G\text{ Hamiltonian}.
$$

也就是说，从 $K_n$ 中每个顶点附近删掉少于约 $n/2$ 条边，仍然保证 Hamiltonicity。

随机图版本：

$$
G(n,p)\text{ whp has local resilience }(1/2-o(1))np
$$
with respect to Hamiltonicity.

## Why Robustness Matters

Hamilton cycle 是 spanning structure，特别容易被局部障碍破坏：

- 孤立点会破坏 Hamiltonicity。
- cut vertex 或小割会破坏 Hamiltonicity。
- 近二部或奇偶障碍会破坏 Hamiltonicity。

因此 Hamiltonicity 的鲁棒性通常必须控制局部度、扩张性或 robust neighbourhood。

## See also

- [[Local resilience]]
- [[Robust expansion]]
- [[Posa rotation]]
- [[Sudakov–Vu (2008) — Local resilience of graphs]]
- [[Chen et al. (2025) — Robustness for expander graphs]]


