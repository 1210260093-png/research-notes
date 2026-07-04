---
tags:
  - expanders
  - pseudorandom_graphs
  - spectral_method
category: concepts
---

>[!tip] Definition  
>一个图 $G$ 称为 **$(n,d,\lambda)$-graph**，如果：  
>- $|V(G)|=n$；  
>- $G$ 是 $d$-正则图；  
>- 除了平凡特征值 $d$ 之外，邻接矩阵的其余特征值的绝对值都至多为 $\lambda$。  

---  

## 直观理解

我们通常把  ${d}/{\lambda}$  看作图的“谱拟随机性”或“谱扩张性”强弱指标。这个比值越大，图越像随机图，也越容易推出各种扩张性质。    
  
$(n,d,\lambda)$-graph 是图论里研究 **拟随机图** 的标准模型之一。  
  
- $d$ 控制稠密程度；  
- $\lambda$ 衡量“偏离均匀分布”的程度；  
- 当 $\lambda\ll d$ 时，边在不同顶点集之间的分布接近随机图中的期望行为。  
  
因此，很多组合性质都会从  $\lambda \ll d$  推出。  
  
---  
  
>[!danger] Expander Mixing Lemma  
对任意 $X,Y\subseteq V(G)$，都有  $$  \left|e(X,Y)-\frac{d|X||Y|}{n}\right|  
\le \lambda \sqrt{|X||Y|}.  $$
这里 $e(X,Y)$ 表示 $X$ 与 $Y$ 之间的边数。  
  
这说明：如果 $\lambda$ 相对 $d$ 很小，那么任意两个集合之间的边数都接近“随机预期值”  $d|X||Y|/n$  。

---  
  
>[!note] 与 [[C-expander]]  的关系
对每个常数 $C>0$，都存在常数 $C_0=C_0(C)$，使得只要  $$  \frac{d}{\lambda}\ge C_0,  $$则每个 $(n,d,\lambda)$-graph 都是一个 $C$-expander。    
  
**Proof Outline**

用 expander mixing lemma 验证[[C-expander]]定义中的两条性质(a),(b)。

对 (a)，取 $X\subseteq V(G)$，满足 $|X|<n/(2C)$，并设 $B:=X\cup N(X)$。因为 $X$ 与 $V(G)\setminus B$ 之间没有边，所以
$$
e(X,V(G)\setminus B)=0.
$$
由 expander mixing lemma，
$$
\frac{d|X|(n-|B|)}{n}\le \lambda\sqrt{|X|(n-|B|)}.
$$
于是
$$
|X|(n-|B|)\le \frac{\lambda^2 n^2}{d^2}.
$$
若 $d/\lambda$ 足够大，则 $n-|B|$ 很小，也就是 $|B|$ 很大，从而 $|N(X)|=|B|-|X|\ge C|X|$。因此小集合有线性外邻居增长。

对 (b)，若 $X,Y\subseteq V(G)$ 不交且 $|X|,|Y|\ge n/(2C)$，同时假设 $e(X,Y)=0$，则由 expander mixing lemma，
$$
\frac{d|X||Y|}{n}\le \lambda\sqrt{|X||Y|}.
$$
约去 $\sqrt{|X||Y|}$ 得
$$
\frac{d}{n}\sqrt{|X||Y|}\le \lambda.
$$
而 $|X|,|Y|\ge n/(2C)$，所以 $\sqrt{|X||Y|}\ge n/(2C)$，从而 $d/\lambda\le 2C$。故当 $d/\lambda$ 足够大时，这是不可能的，于是任意两个这样的不交大集合之间必有边。

因此，只要 $d/\lambda$ 充分大（常数只依赖于 $C$），每个 $(n,d,\lambda)$-graph 都是 $C$-expander。

---

**与随机正则图**

$(n,d,\lambda)$-graph 是研究随机正则图和伪随机图的核心工具。[[Friedman's second eigenvalue Theorem（随机正则图的第二特征值）]] 表明随机 $d$-正则图 a.a.s. 满足 $\lambda\le 2\sqrt{d-1}+\varepsilon$，因此随机正则图是渐近最优的 spectral expander。


---

**See also**
- [[C-expander]] — 谱扩张蕴含组合扩张
- [[AKS Question universal of bounded spanning trees in expander]] — $(n,d,\lambda)$-graph 是否包含所有有界度生成树？


