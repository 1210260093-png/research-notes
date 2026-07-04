---
tags:
  - pseudorandom_graphs
  - embedding_universality
  - sorting_network
  - "#reserved_connector"
category: theorems-tools-methods
---
> [!theorem] **Reserved Connector Theorem**
> 存在绝对常数 $C_{2.3}$，使得下述结论成立。
>
> 设 $1/n\ll 1/K\ll 1/C_{2.3}$，并设 $D,m\in\mathbb N$ 满足 $m\le n/100D$ 且 $D\ge 100$。
>
> 设 $G$ 是一个有 $n$ 个顶点的 $m$-joined 图，并且包含两个互不相交的子集 $V_1,V_2\subseteq V(G)$，满足$|V_1|=|V_2|\le n/K\log^3 n,$
> 并令 $\ell:=\lfloor C_{2.3}\log^3 n\rfloor.$ 假设 $I(V_1\cup V_2)$ 在 $G$ 中是 $(D,m)$-extendable 的。
  >
则存在一个 $(D,m)$-extendable 子图 $S_{\mathrm{res}}\subseteq G$，使得对任意双射 $\phi:V_1\to V_2$，都存在一个 $P_\ell$-factor 属于 $S_{\mathrm{res}}$，其中每一条 $P_\ell$ 的两个端点分别是某个 $v\in V_1$ 和 $\phi(v)\in V_2$。  

---

## Definitions and Lemmas

### Definition 1.  (linking structure)
设 $H$ 是一个图，且 $A,B\subseteq V(H)$ 是两个互不相交且大小相同的顶点集。若对任意双射 $\varphi:A\to B$，都存在 $|A|$ 条两两点不交且长度相同的路径 $P_1,\dots,P_{|A|}$，使得下列条件成立，则称 $H$ 是一个 **$(A,B)$-linking structure**（连接器）。  
  
1. 这些路径覆盖 $H$ 的全部顶点，即  
$$  
V(H)=V(P_1)\cup \cdots \cup V(P_{|A|}).  
$$  
  
2. 对每个 $i\in [|A|]$，路径 $P_i$ 的两个端点是某个 $a\in A$ 与 $\varphi(a)\in B$。

这是一个很有吸收味道的结构，作用类似absorbor。

**Remark.**
- 那么 Main Theorem 可以概括为，如果满足条件 G 中就有一个保持 extendable 的 linking structure。
- 这个结构十分强，在于任意双射都可以找到这样一个类似于完美匹配的 path factor，而且长度相同。

---

### Definition 2.  (path-constructible)
设 $G$ 是一个图，且 $A\subseteq V(G)$。如果在 $G$ 中存在一列边不交路径 $P_1,\dots,P_t$，满足下列性质，则称 $G$ 是 **$A$-path-constructible** 的。  
  
(i)  $E(G)=\bigcup_{j\in [t]} E(P_j)$ .    
  
(ii) 对每个 $i\in [t]$，路径 $P_i$ 的内部顶点与集合 $A\cup \bigcup_{j\in [i-1]}V(P_j)$ 不相交。  
  
(iii) 对每个 $i\in [t]$，路径 $P_i$ 的两个端点中至少有一个属于集合 $A\cup \bigcup_{j\in [i-1]}V(P_j)$。


### Compare Lemma. 

对每个满足 $k \equiv 2 \pmod 4$ 的正整数 $k$，都存在一个图 $G_k$，其中有两两不同的顶点 $v_1^{\mathrm{in}}, v_2^{\mathrm{in}}, v_1^{\mathrm{out}}, v_2^{\mathrm{out}}$ 以及路径 $P_1, P_2, Q_1, Q_2 \subseteq G_k$，使得下列性质成立：  
1. $|G_k| = 2k(k-1).$ 
2. $\Delta(G_k)=3.$
3. 对每个 $z \in \{v_1^{\mathrm{in}}, v_2^{\mathrm{in}}\}$，图 $G_k$ 是 $\{z\}$-path-constructible 的，并且所用路径的长度都介于 $k$ 与 $2k+1$ 之间。  
4. $P_1$ 是一条从 $v_1^{\mathrm{in}}$ 到 $v_2^{\mathrm{out}}$ 的路径，$Q_1$ 是一条从 $v_2^{\mathrm{in}}$ 到 $v_1^{\mathrm{out}}$ 的路径，$P_2$ 是一条从 $v_1^{\mathrm{in}}$ 到 $v_1^{\mathrm{out}}$ 的路径，而 $Q_2$ 是一条从 $v_2^{\mathrm{in}}$ 到 $v_2^{\mathrm{out}}$ 的路径。  
5. 对每个 $i \in [2]$，$$V(G_k)=V(P_i)\cup V(Q_i),$$也就是说，$G_k$ 的顶点集被 $V(P_i)$ 和 $V(Q_i)$ 划分。  
6. $$|V(P_1)|=|V(P_2)|=|V(Q_1)|=|V(Q_2)|=k(k-1).$$
>[!tip] Key Lemma. 
存在常数 $C_{4.4}$，使得对任意 $n,k$ 以及任意  
>$$  
>\ell\ge \lceil C_{4.4}k^2\log n\rceil,  
>$$  
>都存在一个图 $G$，满足 $\Delta(G)=4$，并且包含两个互不相交的子集 $A,B\subseteq V(G)$，其中 $|A|=|B|=n$，使得下列性质成立。  
  >
>>1. $G$ 是 $A\cup B$-path-constructible 的，且所用路径的长度介于 $k$ 与 $4k$ 之间。  
>>2. 对任意双射 $\phi:A\to B$，在 $G$ 中都存在一个 $P_\ell$-factor，使得其中每一条路径的两个端点分别是某个 $a\in A$ 和 $\phi(a)\in B$。  

**Remark.**  也就是存在一个可以解构为一些 paths的 linking structure。因为 linking structure 强大，所以这个 lemma 也很强。

---

## Proof outline of Main Theorem.

我们通过 Key Lemma 得到一个可以解构为 paths 的linking structure。因为起点（$V_1\cup V_2$）是 [[(D,m)-extendable]]，由 [[Extendable method]]，我们可以逐步嵌入长度约为$\Theta(\log n)$ 的 paths，最终完全嵌入该结构。这里需要注意的是，因为该连接器实际上很小，而且嵌入的路长是$\Theta(\log n)$，是最理想的长度，所以该操作可以持续进行。

## Proof outline of Key Lemma.

**一句话版**：先取一个深度为 $O(\log⁡n)$的并行 sorting network 作为蓝图，然后把 network 中的每一个 comparator 都替换成一个 compare graph，最后把这些 compare graphs 按层连接起来，得到命题中的图 $G$。

在 [[Sorting network]] 里，一共有 $\ell$（先后进行的比较）层， 记为$\mathcal{C}_1,\mathcal{C}_2,\dots,\mathcal{C}_\ell$。 每个层由一些（不交的）比较器=comparator 组成，即 $\mathcal{C}_* \subseteq \binom{[n]}{2}$（详情看链接）。每一层都做同样一件事：对若干对 register 同时做 comparison，而那些没有参与 comparison 的 register 就原样往下一层传。本文里就是严格照着这个结构来造图的。

先添加 $\ell-1$  个大小为 $|A|=|B|$ 的点集 $W_1,W_2,\dots,W_{\ell-1}$，记 $A=W_0, B=W_{\ell}$。对任意 $i \in [\ell]$ 我们在W_i 和 W_{i-1}之间添加如下结构：
- 若 $(j,k) \in \mathcal{C}_{i}$ 则在 $W_{i-1}^{j},W_{i-1}^{k},W_{i}^{j},W_{i}^{k}$ 之间添加一个 compare graph， 以 $W_{i-1}^{j},W_{i-1}^{k}$ 为输入端， $W_{i}^{j},W_{i}^{k}$ 为输出端。
- 若 $h$ 不在 $\mathcal{C}_{i}$ 的任何对中，则在 $W_{i-1}^{h},W_{i}^{h}$ 之间添加一条路。

这里 compare graph 的作用不是只给出一个小图，而是给出一个**可以模拟一次比较操作的 gadget**：它有两个输入端、两个输出端，并且内部存在两种特殊的全覆盖路径系统。一种对应“两个值交换位置”，另一种对应“两个值保持原顺序”。所以，compare graph 实际上提供的是 comparator 的图论版本。而对那些在该层中没有参与比较的 registers，因为不需要交换，所以只放一条从输入端到输出端的路径，表示这个 register 在这一层直接通过。

这样构造以后，Key Lemma 中的性质 (i) 也就自然出现了。原因是：宏观来看该图本身就是按“先接入一层，再接入下一层”的方式搭出来的，而 compare graph 自身可以从一个端点开始逐步拆成一串路径。因此，把层间连接路径、各层中的直通路径以及每个 compare graph 内部的这串路径分解按构造顺序排起来，就得到一个 $A\cup B$-path-construction。

最后证明 (ii) 时，给定任意双射 $\phi:A\to B$，就把它看成 sorting network 的输入输出要求。对每个 comparator，根据在 sorting 过程中应当执行“交换”还是“不交换”，在 compare graph 给出的两种局部路径系统中选取相应的一种。由于整个 network 会把输入按正确方式传到输出端，这些局部选择组合起来，就得到一个覆盖全图的 $P_\ell$-factor，使得每个 $a\in A$ 都连接到 $\phi(a)\in B$。

**Remark.** 整个证明里 compare graph 的作用其实有两层：**局部上，它模拟了一个 comparator；全局上，它还保证可以被组织成 path-constructible 的大图。** 


## Proof of Compare Lemma.

我们将从一个长度为 $2k$ 的圈 $C$ 出发构造图 $G_k$，方法是在圈上若干特定的顶点对 $a,b\in V(C)$ 之间加入路径 $P(ab)$。令 $U=\{u_1,\ldots,u_k\}$ 和 $V=\{v_1,\ldots,v_k\}$ 为两个互不相交的顶点集，并令 $C$ 是定义在 $U\cup V$ 上的圈，它通过加入如下边得到：

- $u_1v_2,\ u_kv_{k-1}$；
- 对每个奇数 $i\in [k-1]$，加入边 $u_i u_{i+1}$ 和 $v_i v_{i+1}$；
- 对每个偶数 $i\in [k-2]$，加入边 $u_i v_{i+2}$；
- 对每个满足 $3\le i\le k$ 的奇数 $i$，加入边 $u_i v_{i-2}$。

例如：
- 当 $k=2$ 时，我们有四圈 $C=u_1u_2v_1v_2u_1,$
- 而当 $k=6$ 时，我们有$C=u_1u_2v_4v_3u_5u_6v_5v_6u_4u_3v_1v_2u_1.$
设
$$
S:=\{(u_i,u_{i+1}): i\in [k-2],\ i\text{ 为偶数}\}\cup \{(v_i,v_{i+1}): i\in [k-2],\ i\text{ 为偶数}\}.
$$
图 $G_k$ 由环 $C$ 通过以下方式得到：对于每一对 $(a,b)\in S$，在 $a$ 与 $b$ 之间加入一条路径 $P(ab)$，并且这条路径使用 $2k$ 个新顶点。对于每个 $(a,b)\in S$，记 $P(ba)$ 为按相反方向遍历的路径 $P(ab)$，也就是说，它是从顶点 $b$ 开始、以 $a$ 结束的那条路径。再设
$$
v_1^{\mathrm{in}}:=u_1,\qquad
v_2^{\mathrm{in}}:=v_1,\qquad
v_1^{\mathrm{out}}:=u_k,\qquad
v_2^{\mathrm{out}}:=v_k.
$$
现在定义
$$
P_1:=u_1P(v_2v_3)P(u_5u_4)\cdots P(v_{k-4}v_{k-3})P(u_{k-1}u_{k-2})v_k,
$$
$$
Q_1:=v_1P(u_3u_2)P(v_4v_5)\cdots P(u_{k-3}u_{k-4})P(v_{k-2}v_{k-1})u_k,
$$
$$
P_2:=u_1P(u_2u_3)P(u_4u_5)\cdots P(u_{k-2}u_{k-1})u_k,
$$
$$
Q_2:=v_1P(v_2v_3)P(v_4v_5)\cdots P(v_{k-2}v_{k-1})v_k.
$$

现在我们来检验 $G_k$ 具有所需的性质。注意到，性质 (i)、(ii) 和 (iv) 都由构造立即推出。为了验证 (iii)，令 $P_1'$ 和 $P_2'$ 为两条边不相交、长度均为 $k$ 的路径，它们有相同的端点，并且满足
$$
P_1'\cup P_2'=C,
$$
同时设 $z$ 是 $P_1'$ 的一个端点。再令路径 $P_j'$（其中 $j\ge 3$）按任意顺序对应于各条路径 $P(ab)$。由构造可知，
$$
\bigcup_{j\ge 1} P_j'
$$
的边集恰好等于 $E(G)$，并且序列中的每一条路径 $P_j'$ 与此前各条路径 $P_{j'}'$（$j'<j$）若有交点，则只可能在 $P_j'$ 的端点处相交。因此 $G$ 是 $\{z\}$-path-constructible 的。

对于 (v)，注意到对每个偶数 $i$，路径 $P(u_i u_{i+1})$ 出现在 $P_2$ 中，而路径 $P(u_{i+1}u_i)$ 出现在 $P_1\cup Q_1$ 中。类似地，对每个偶数 $i$，我们有路径 $P(v_i v_{i+1})$ 出现在 $Q_2$ 中，而路径 $P(v_i v_{i+1})$ 出现在 $P_1\cup Q_1$ 中。由于 $G_k\setminus \{u_1,v_1,u_k,v_k\}$ 中的所有顶点都出现在某条 $P(ab)$ 中，因此显然 (v) 成立。

最后，(vi) 也成立，因为每条 $P(ab)$ 都包含 $2k+2$ 个顶点，这样的路径在 $P_1,Q_1,P_2,Q_2$ 中各出现 $\frac{k}{2}-1$ 条，并且还有 $4$ 个“端点”顶点 $u_1,v_1,u_k,v_k$。$\square$

