
## 定义

一个图 $G$ 称为**点传递图**，如果对任意两个顶点 $u,v\in V(G)$，都存在一个图自同构
$$
\varphi\in \operatorname{Aut}(G)
$$
使得
$$
\varphi(u)=v.
$$

等价地说，图的自同构群 $\operatorname{Aut}(G)$ 在顶点集 $V(G)$ 上是传递作用的。

## 直观理解

点传递图的意思是：从图自身的对称性来看，所有顶点没有区别。

也就是说，图里没有哪个顶点是特殊的。任意一个顶点都可以通过某个保持邻接关系的对称变换搬到任意另一个顶点。

这比“每个点度数一样”更强。正则图只要求每个点有一样多的邻居；点传递图还要求这些点在整张图的全局结构中处在同一种位置。

## 基本性质

- 每个点传递图都是正则图。
- 点传递性比正则性强：正则图不一定点传递。
- 若 $G$ 是点传递图，则补图 $\overline G$ 也是点传递图。
- 每个 Cayley 图都是点传递图。
- 但不是每个点传递图都是 Cayley 图。
- 连通点传递图通常比一般正则图有更强的连通性。
- 若 $G$ 是连通 $d$-正则点传递图，则它的边连通度等于 $d$。
- 连通 $d$-正则点传递图的点连通度至少为 $2(d+1)/3$。
- 在一些特殊情形下，点连通度也等于 $d$，例如度数至多 $4$、图也是边传递图、或图是 minimal Cayley graph 的情形。

## 例子

- 完全图 $K_n$
- 圈 $C_n$
- 超立方体 $Q_d$
- Cayley 图
- Petersen 图
- 许多高度对称的正则多面体图

## 非例子

- 路径 $P_n$，当 $n\ge 3$。
- 星图 $K_{1,n}$，当 $n\ge 2$。
- 一般正则图不一定点传递，例如 Frucht graph。

## 和 Cayley 图的关系

Cayley 图天然是点传递的。

设 $\Gamma=\operatorname{Cay}(H,S)$ 是群 $H$ 关于生成集 $S$ 的 Cayley 图。群 $H$ 对自己有右乘作用：
$$
x\mapsto xh.
$$
这个作用可以把任意群元素搬到任意另一个群元素，并且保持 Cayley 图的边结构，所以 Cayley 图是点传递图。

反过来不成立：点传递图不一定是 Cayley 图。

粗略地说，Cayley 图要求存在一个自由且传递的群作用；点传递图只要求自同构群在顶点上作用传递。

## 和 Hamilton 性的关系

点传递图是研究图的 Hamilton 性时非常自然的对象：它们可能很稀疏，但又具有很强的全局对称性。

Lovasz Hamilton path conjecture 猜想：

> 每个有限连通点传递图都有 Hamilton path。

更强的 Hamilton cycle 版本通常表述为：

> 除了少数已知例外，每个有限连通点传递图都有 Hamilton cycle。

因此，很多相关论文会研究弱化问题：如果一个连通点传递图有 $n$ 个顶点，那么至少能保证多长的 path 或 cycle？

## 常见用法

在论文里看到 vertex-transitive graph 时，可以先抓住三个关键词：

- **对称性**：所有顶点在自同构群下等价。
- **正则性**：所有顶点度数相同。
- **均匀性**：局部或全局构造通常不能依赖某个特殊顶点。

这种均匀性经常让 averaging、orbit-stabilizer、群作用、覆盖与平移参数等方法变得可用。


## 参考来源

- Chris Godsil and Gordon Royle, *Algebraic Graph Theory*, Chapter 3: Transitive Graphs.
- Wolfram MathWorld, "Vertex-Transitive Graph".
- Wikipedia, "Vertex-transitive graph".
- Lovasz Hamilton path conjecture 相关文献背景。
