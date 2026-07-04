---
tags:
  - resilience_perturbation
  - graph_theory
category: concepts
---

设 $G$ 是图，$\mathcal P$ 是一个图性质。$G$ 关于 $\mathcal P$ 的 **local resilience** 衡量：

> 每个顶点附近最多允许被对手删掉多少条 incident edges，剩余图仍然满足 $\mathcal P$。

常见表述是：若对任意 $H\subseteq G$，只要
$$
\Delta(H)\le r
$$
就有
$$
G-H\in\mathcal P,
$$
则称 $G$ 对 $\mathcal P$ 有 local resilience 至少 $r$。

比例版本更常见：若
$$
d_H(v)\le \rho d_G(v)\quad \forall v
$$
仍保证 $G-H\in\mathcal P$，则说 $G$ 对 $\mathcal P$ 有比例 local resilience 至少 $\rho$。

## Intuition

local resilience 比 global resilience 强，因为对手可以集中攻击少数区域，只要每个顶点处没有删太多。

典型例子：

$$
G(n,p)\text{ 对 Hamiltonicity 的 local resilience 大约是 }(1/2-o(1))np.
$$

意思是：随机图中每个顶点附近删掉少于一半的边，剩余图仍然 Hamiltonian。

常数 $1/2$ 经常来自 Dirac 型障碍：若能删掉每个顶点约一半的边，就可能把图切成类似二部障碍或断开结构。

## Variants

- **edge local resilience**：局部删边。
- **vertex local resilience**：局部删点或删邻域。
- **degree resilience**：用剩余最小度或每点剩余比例描述。
- **codegree resilience**：超图版本，限制每个小集合附近可被删掉的扩展数。

## See also

- [[Global resilience]] — 限制总删除量，而不是每个点附近的删除量
- [[Robust Hamiltonicity]] — Hamiltonicity 是 local resilience 最经典的目标性质
- [[Sudakov–Vu (2008) — Local resilience of graphs]]
- [[Dirac theorem]] — 完全图中 Hamiltonicity local resilience 的原型


