---
tags:
  - expanders
  - pseudorandom_graphs
  - spectral_method
category: theorems-tools-methods
---

这条结论通常称为 **Friedman 定理**。它也常被说成是 **Alon 的第二特征值猜想** 的证明。
随机正则图a.a.s. 是一个几乎最好的[[Spectral expander]]。
  
## 经典表述  
  
设 $d\ge 3$ 为固定整数，$G_{n,d}$ 表示均匀随机的 $d$-正则图。记  
$$  
\lambda(G_{n,d})=\max\{|\lambda_2|,|\lambda_n|\},  
$$  
即邻接矩阵除去平凡特征值 $d$ 之外，其余特征值绝对值的最大值。那么对任意固定 $\varepsilon>0$，都有 a.a.s. 
$$  
\lambda(G_{n,d}) \le 2\sqrt{d-1}+\varepsilon. 
$$
  



>也就是说，随机 $d$-正则图的非平凡特征值几乎达到 Ramanujan 界。随机 $d$-正则图本来就自动是 $d$-正则的，所以若要把它看成一个 $(n,d,\lambda)$-graph，a.a.s. 是一个  
$$  
(n,d,2\sqrt{d-1}+\varepsilon)\text{-graph}.  
$$
  
---

## 一个简要说明

这个数来自无穷 $d$-正则树的谱半径。随机 $d$-正则图在局部上看起来像 $d$-正则树，而 $d$-正则树的谱半径正好是  
$$  
2\sqrt{d-1}.  
$$  
因此人们预期：随机 $d$-正则图除了平凡特征值 $d$ 外，其余谱应该基本落在  
$$  
[-2\sqrt{d-1},\,2\sqrt{d-1}]  
$$  
附近。  
  



