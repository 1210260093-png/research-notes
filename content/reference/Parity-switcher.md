---
tags:
  - hamiltonicity
  - parity_switcher
category: theorems-tools-methods
sources:
  - "[[Hefetz–Krivelevich (2026) — Hamilton cycle space in random regular and randomly perturbed graphs]]"
---

>[!danger] Definition (Parity-switcher)
给定一个图 $G$ 和一个子图 $R\subseteq G$。若子图 $W\subseteq G$ 由下述部分组成，则称 $W$ 是一个 **$R$-parity-switcher**：
>- 一个偶环$$C=(v_1,v_2,\dots,v_{2k}),$$
  且这个环在 $R$ 中包含奇数条边；
>- 对每个 $2\le i\le k$，都有一条连接 $v_i$ 与 $v_{2k-i+2}$ 的两两点不交路径 $P_i$。

在 Hefetz–Krivelevich 的用法里，$C$ 负责提供奇偶性差异，路径 $P_2,\dots,P_k$ 负责把偶环改造成一个可以嵌入到全局 Hamilton 圈里的 switching gadget。

---

## Remark

一个 parity-switcher 中包含两条 $W$的 Hamilton 路，也就是说，这两条路都经过 $V(W)$ 中的全部顶点：

- 
  $$
  v_1\to v_2 \xrightarrow{P_2} v_{2k}\to v_{2k-1}\xrightarrow{P_3} v_3\to v_4\xrightarrow{P_4} v_{2k-2}\to \cdots \to v_{k+1};
  $$

- 
  $$
  v_1\to v_{2k}\xrightarrow{P_2} v_2\to v_3\xrightarrow{P_3} v_{2k-1}\to v_{2k-2}\xrightarrow{P_4} v_4\to \cdots \to v_{k+1}.
  $$

---

关键的是，这两条路在 $R$ 中所含边数的奇偶性不同。原因是：

- 每一条 $P_i$（$2\le i\le k$）都会完整地出现在这两条路中；
- 而环 $C$ 的每一条边恰好只出现在其中一条路里。

因此，这两条 Hamilton 路之间的奇偶性差异，完全来自于环 $C$；而由于 $C$ 在 $R$ 中含有奇数条边，所以这两条路在 $R$ 中的边数奇偶性正好相反。

下面介绍一个该定义的应用场景

>[!danger] Key Lemma
  设 $G$ 是一个 $n$ 阶 Hamilton 图，其中 $n$ 为奇数，并且  $$  C_n(G)\ne C(G).  $$  
那么存在 $G$ 的一个子图 $R$，使得下面三个条件同时成立：  
>
(C1) $R\ne G$。
>
(C2) $G$ 的每一个 Hamilton 环都包含 $R$ 的偶数条边。
>
(C3) 对任意划分 $V(G)=A\cup B$，都有 $e_R(A,B)\ge e_G(A,B)/2$，并且 $R\ne G[A,B]$。
  
---  

### Proof：

给定边空间 $\mathcal E(G)$ 的一个子空间 $\mathcal S\subseteq \mathcal E(G)$，记它的正交补为
$$
\mathcal S^\perp=\{D\in \mathcal E(G):\langle D,S\rangle=0\text{ 对所有 }S\in \mathcal S\}.
$$
这里
$$
\langle D,S\rangle=\sum_{e\in E(G)} D(e)S(e),
$$
加法都在 $\mathbb F_2$ 中进行；对任意 $X\in \mathcal E(G)$，$X(e)$ 表示边 $e$ 是否属于 $X$ 的示性函数。

已知 $\mathcal C^\perp(G)$ 恰好就是图 $G$ 的割空间，也就是说，它由所有形如 $G[A,B]$ 的诱导二分子图对应的边集组成，其中也包括空集，这里 $V(G)=A\cup B$ 是任意一个顶点划分。

由于
$$
C_n(G)\subseteq C(G),
$$
再结合引理的假设
$$
C_n(G)\ne C(G),
$$
可知
$$
C_n^\perp(G)\setminus C^\perp(G)\ne \varnothing.
$$
从这个集合里取一个边数最大的元素，记为 $R\subseteq G$。

因为 $R\in C_n^\perp(G)$，所以按照定义，$G$ 的每一个 Hamilton 环与 $R$ 的交边数都是偶数。这就得到了条件 (C2)。

接下来注意到
$$
R+C^\perp(G)\subseteq C_n^\perp(G)
$$
并且它与 $C^\perp(G)$ 不相交，因为它是割空间 $C^\perp(G)$ 的一个陪集。因此，$R$ 本身不是一个割。另一方面，$R$ 在每个割上都至少包含一半的边：如果某个割 $(A,B)$ 满足
$$
e_R(A,B)<\frac{e_G(A,B)}{2},
$$
那么把这个割对应的边集 $G[A,B]$ 加到 $R$ 上，就得到
$$
R+G[A,B]\in C_n^\perp(G)\setminus C^\perp(G),
$$
而且这个新元素的边数比 $R$ 更多，这与 $R$ 的极大性矛盾。所以对任意划分 $V(G)=A\cup B$，都有
$$
e_R(A,B)\ge \frac{e_G(A,B)}{2},
$$
并且 $R\ne G[A,B]$。这就得到了条件 (C3)。

最后说明 (C1)。若 $R=G$，由于 $G$ 是 Hamilton 图，$R$ 中就包含一个 Hamilton 环。但前面已经知道每个 Hamilton 环在 $R$ 中的边数必须是偶数，而一个 Hamilton 环本身有 $n$ 条边；由于 $n$ 是奇数，这就矛盾了。因此
$$
R\ne G.
$$

所以这样的子图 $R$ 的确存在，并满足 (C1)、(C2)、(C3)。

---

## Recipe

用 parity-switcher 证明 $C_n(G)=C(G)$ 的典型流程是：

1. 反设 $C_n(G)\ne C(G)$，由上面的 Key Lemma 得到子图 $R$。
2. 在 $G$ 中找一个小的 $R$-parity-switcher $W$。
3. 在 $(G\setminus V(W))\cup\{v_1,v_{k+1}\}$ 中找一条 Hamilton 路 $P$，端点是 $v_1$ 和 $v_{k+1}$。
4. 在 $W$ 中选择一条从 $v_1$ 到 $v_{k+1}$ 的 Hamilton 路 $P'$，使得 $P\cup P'$ 在 $R$ 中的边数为奇数。
5. 于是 $P\cup P'$ 是 $G$ 的 Hamilton 圈，并且含有奇数条 $R$-边，和 (C2) 矛盾。

---

## 找短偶圈的工具

设 $R\subseteq G$，令 $\ell$ 为正整数。若：

- (L1) 对任意 $|S|\le 2\ell$ 和任意 $x,y\in V(G)\setminus S$，在 $R\setminus S$ 中都有一条从 $x$ 到 $y$ 的路，长度至多为 $\ell-1$；
- (L2) $R\ne G$，并且对任意划分 $V(G)=A\cup B$，都有 $R\ne G[A,B]$；

则 $G$ 中存在一个偶环 $C$，满足 $|C|\le 2\ell$，并且 $C$ 含有奇数条来自 $R$ 的边。

这个 lemma 负责 recipe 里的第一步：找到 parity-switcher 的短偶环部分。剩下的镜像连接路径部分通常由 [[Disjoint paths 工具]] 完成。

## See also
- [[Posa rotation]] — 同为 Hamilton 性工具，Pósa rotation 处理端点替换，parity-switcher 处理奇偶性切换
- [[Absorbing method]] — parity-switcher 可作为吸收器的一种 gadget
- [[Disjoint paths 工具]] — 用来补齐 parity-switcher 中连接镜像顶点的路径

---




