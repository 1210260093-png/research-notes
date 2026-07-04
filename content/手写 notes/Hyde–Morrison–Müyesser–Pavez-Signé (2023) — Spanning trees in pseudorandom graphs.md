---
authors: Joseph Hyde, Natasha Morrison, Alp Müyesser, Matías Pavez-Signé
year: 2023
arxiv: "2311.03185"
pages: 15
subjects: math.CO
tags:
  - embedding
  - sorting_network
  - spanning_trees
  - pseudorandom_graphs
  - expanders
  - reserved_connector
sources:
  - "[arXiv:2311.03185](https://arxiv.org/abs/2311.03185)"
  - "[[Hyde-etal-2023-Spanning-trees-in-pseudorandom-graphs-via-sorting-networks.pdf]]"
---


>[!example] Main Theorem
对任意 $\Delta\in \mathbb{N}$，都存在一个正常数 $C$，使得下述结论成立：每个满足  
>$$  
>\lambda \le \frac{d}{C\log^3 n}  
>$$ 
>的 $(n,d,\lambda)$-图，都是 $\mathcal{T}(n,\Delta)$-universal 的。

这推进了 question [[AKS Question universal of bounded spanning trees in expander|AKS Question]] 的完全解决。

## Sorting network

[[Reserved connector theorem]]

> [!theorem] **Reserved Connector Theorem**
> 存在绝对常数 $C_{2.3}$，使得下述结论成立。
>
> 设 $1/n\ll 1/K\ll 1/C_{2.3}$，并设 $D,m\in\mathbb N$ 满足 $m\le n/100D$ 且 $D\ge 100$。
>
> 设 $G$ 是一个有 $n$ 个顶点的 $m$-joined 图，并且包含两个互不相交的子集 $V_1,V_2\subseteq V(G)$，满足$|V_1|=|V_2|\le n/K\log^3 n,$
> 并令 $\ell:=\lfloor C_{2.3}\log^3 n\rfloor.$ 假设 $I(V_1\cup V_2)$ 在 $G$ 中是 $(D,m)$-extendable 的。
  >
则存在一个 $(D,m)$-extendable 子图 $S_{\mathrm{res}}\subseteq G$，使得对任意双射 $\phi:V_1\to V_2$，都存在一个 $P_\ell$-factor 属于 $S_{\mathrm{res}}$，其中每一条 $P_\ell$ 的两个端点分别是某个 $v\in V_1$ 和 $\phi(v)\in V_2$。  