---
tags:
  - hamiltonicity
  - embedding_universality
  - absorbing_method
  - extremal_ramsey_turan
  - graph_theory
category: theorems-tools-methods
---

##  基本思想

典型证明思路往往是下面三步：

### Step 1. 构造一个很小的 absorbing set

先找到一个小集合 $A \subseteq V(G)$，满足：

- $|A|$ 很小；
- 对任意足够小的“合适”顶点集 $R \subseteq V(G)\setminus A$，子图 $G[A\cup R]$ 中仍然存在同类型目标结构。

这时称 $A$ 可以吸收 $R$。

---

### Step 2. 在剩余顶点中构造 almost spanning structure

在 $V(G)\setminus A$ 上，构造一个覆盖几乎所有顶点的大结构。  
也就是说，除了一个很小的 leftover 集合 $R$ 之外，其余顶点都已经被目标结构覆盖。

---

### Step 3. 用 absorbing set 吸收 leftover

由于 $A$ 被设计成可以吸收小集合 $R$，于是把最后剩下的 $R$ 吸进去，就得到覆盖全体顶点的目标结构。

---


## 一个最典型的证明框架

很多吸收法证明都可以概括为下面的模板。

### 1. 构造局部吸收器

对**每个**“可被吸收的小对象” $x$（或小集合 $T$），证明图中存在**很多个**小结构 $A_x$，每个都能吸收它。  
这里常见做法是：

- 利用最小度条件；
- 利用伪随机性质；
- 利用扩张性质；
- 利用随机图中的局部丰富性；
- 或者用计数法说明这类吸收器很多。

---

### 2. 选出一族彼此不交的小吸收器

由于单个吸收器只能处理很少的顶点，需要选出很多个互不相交的局部吸收器，然后把它们拼接成一个全局 absorbing structure。

常见工具包括：

- 贪心选择；
- 随机抽样；
- Chernoff bound；
- nibble / semi-random 方法；
- matching argument。

---

### 3. 连接这些局部吸收器

把很多个小吸收器通过路径、边或连接器连起来，形成一个统一的 absorbing path、absorbing cycle 或 absorbing set。

这一步通常依赖图的连通性、扩张性或伪随机性。

---

### 4. 在删去吸收器后的大图中做近乎完美覆盖

这一步常常是“主体证明”的部分。  
例如：

- 用 rotation-extension 得到长路；
- 用 regularity/blow-up lemma 得到几乎完美 tiling；
- 用 greedy embedding 覆盖绝大多数顶点；
- 用 matching / packing argument 处理主体部分。

---

### 5. 吸收最后的 leftover

设最后剩下的顶点集为 $R$，规模很小，并满足可整除条件。由于预先构造的吸收器具有吸收能力，就把 $R$ 吞进去，从而完成整个 spanning 结构。

---


## 吸收方法的典型适用条件

吸收方法并不是凭空起作用的，通常需要图满足某种“丰富性”条件，例如：

- 较大的最小度；
- 良好的扩张性质；
- 伪随机性；
- 超正则 / 正则分解性质；
- 局部结构数量很多；
- 可以进行灵活连接。

直观上说，图里必须有足够多的局部冗余，才能预先埋下吸收器，并在最后仍有自由度把 leftover 吸收进去。

---


## 吸收方法的常见技术难点

### 1. 如何证明“有很多吸收器”

这通常需要局部计数。  
也就是说，对每个目标顶点或小集合，要证明存在很多不同的小结构都可以吸收它。

---

### 2. 如何让吸收器彼此不相交

单个吸收器存在不难，但要选出很多个两两点不交的吸收器，往往需要精细的随机选择或匹配论证。

---

### 3. 如何连接成一个整体

这一步常常依赖额外的 connecting lemma。  
很多论文中，吸收部分本身不是最难的，连接部分反而最技术化。

---

### 4. 如何控制 leftover 的类型

吸收器通常不是能吸收“任意”剩余集，而是只能吸收满足某种限制的剩余集。  
因此主体构造阶段必须同时控制：

- leftover 足够小；
- leftover 满足可整除条件；
- leftover 落在允许的类型中。

---

## 吸收方法与其他工具的配合

吸收方法很少单独出现，往往会和下面工具一起使用：

- minimum degree argument
- expansion
- regularity lemma
- blow-up lemma
- random sampling
- nibble
- [[Chernoff Bound]]
- Hall theorem / matching theory
- [[Posa rotation|rotation-extension]]
- connecting lemma
- [[Lovász Local Lemma (LLL)|LLL]]

吸收方法更多像一个”全局策略框架”，而不是单独的一条计算技巧。

---

## 读论文时应该重点看什么

如果一篇文章使用了吸收方法，读的时候可以重点盯住以下问题：
- 吸收的对象是什么: 是单个顶点、顶点对、小集合，还是某种局部结构？
- 吸收器长什么样: 是路径、圈、匹配、若干 gadget，还是一个顶点集？
- 吸收器的两种状态是什么: 它如何从“只覆盖自己”切换到“覆盖自己加 leftover”？
- 吸收器是如何被选出来的: 随机选？贪心选？计数后用 matching 选？
- 主体部分如何做到 almost spanning: 这是 regularity、扩张、随机图工具，还是一个贪心嵌入过程？
- 最后如何完成收尾: 是直接吸收，还是还需要额外连接、调整、平衡模条件？




---

## 之后可以继续补充的内容

这篇笔记后续可以继续补：

- absorbing path 的正式定义
- 哈密顿圈中的经典 absorbing lemma
- perfect matching / perfect tiling 中的 absorbing lemma
- reservoir method 与 absorbing method 的区别
- connecting lemma 的常见形式
- absorbing gadget 的具体例子
- 随机图中的 absorbing method
- robust expansion 与吸收方法的结合

## Variants and related methods
- [[Distributive absorption method]] — 将吸收能力分散到多个小吸收器，用模板统一协调
- [[Absorbing method based on lattice]] — 处理多维整除约束的格基吸收法
- [[Reserved connector theorem]] — linking structure 有很强的吸收味道
- [[Extendable method]] — 另一种处理 spanning 嵌入的全局框架

