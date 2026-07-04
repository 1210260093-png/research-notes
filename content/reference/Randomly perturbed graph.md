---
tags:
  - resilience_perturbation
  - probabilistic_method
  - graph_theory
category: concepts
---

**Randomly perturbed graph** 模型研究：

> 一个 deterministic host graph 加上一小部分随机边后，是否获得某个全局性质？

典型形式是
$$
G_\alpha \cup G(n,p),
$$
其中 $G_\alpha$ 是一个 $n$ 点 deterministic graph，常满足
$$
\delta(G_\alpha)\ge \alpha n,
$$
而 $G(n,p)$ 提供随机扰动。

## Intuition

deterministic host graph 提供密度或局部结构，随机边负责打破 extremal obstruction。

例如一个 dense graph 可能因为接近二部、分块或奇偶障碍而没有某个 spanning structure；加入少量随机边后，这些障碍通常被随机边连接起来。

## Robustness Angle

random perturbation 和 [[Local resilience]] 是互补的：

- resilience：从一个有性质的图中删东西，性质还能不能保留？
- perturbation：给一个可能没有性质的图加随机东西，性质能不能出现？

两者都在研究性质对局部结构和随机噪声的稳定性。

## Typical Targets

- Hamilton cycle
- perfect matching
- $H$-factor
- Ramsey property
- bounded-degree spanning tree embedding

## See also

- [[Robust Hamiltonicity]]
- [[Robust Ramsey property]]
- [[Hefetz–Krivelevich (2026) — Hamilton cycle space in random regular and randomly perturbed graphs]]
- [[HG in a graph perturb a regular graph]]


