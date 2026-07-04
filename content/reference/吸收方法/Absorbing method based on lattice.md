---
tags:
  - hamiltonicity
  - absorbing_method
  - spanning_trees
  - matchings_tilings_factors
  - probabilistic_method
category: theorems-tools-methods
status: unfinished
---

这是 [[Absorbing method]] 的一个进阶变体，与 [[Distributive absorption method]] 共同构成吸收方法的三大分支。

## 为什么需要更精细的吸收（动机）  
  
在很多问题中，困难不只是：  
  
> 剩下的顶点少  
  
而是：  
  
> 剩下的顶点在不同部分中的分布必须满足整除条件  
  
例如：  
  
- perfect matching：总数必须是偶数    
- \(H\)-tiling：总数必须是 \(|H|\) 的倍数    
- multipartite / hypergraph setting：    
  各部分之间必须满足更复杂的平衡关系  
  
这就引出了 lattice-based absorption。  
  
---  
  
## 3. 基于格的吸收方法（Lattice-based Absorption）  
  
### 3.1 基本设定  
  
设顶点划分为：  
  
$$  
V = V_1 \cup \cdots \cup V_r.  
$$  
  
一个局部结构（如一个 \(H\)-copy）对应指标向量：  
  
$$  
\mathbf{i} = (|V(H)\cap V_1|,\dots,|V(H)\cap V_r|)  
$$  
  
这些向量生成一个整数格：  
  
$$  
L \subseteq \mathbb{Z}^r  
$$  
  
---  
  
### 3.2 核心思想  
  
吸收的对象不再是“任意小集合”，而是：  
  
> 指标向量落在格 \(L\) 中的小集合  
  
即对于 leftover \(R\)，要求：  
  
$$  
\mathbf{i}_{\mathcal P}(R) \in L  
$$  
  
---  
  
### 3.3 与普通吸收法的区别  
  
| 普通吸收   | 基于格的吸收 |     |                          |     |
| ------ | ------ | --- | ------------------------ | --- |
| 控制 \(  | R      | \)  | 控制向量 \( \mathbf{i}(R) \) |     |
| 单一整除条件 | 多维线性约束 |     |                          |     |
| 一维问题   | 多维格问题  |     |                          |     |
  
---  
  
### 3.4 一个典型例子  
  
若允许的结构类型为：  
  
$$  
(2,1),\ (1,2)  
$$  
  
则格为：  
  
$$  
L = \langle (2,1),(1,2) \rangle  
$$  
  
只有当 leftover 向量 \((a,b)\in L\)，才能被吸收。  
  
---  
  
## 4. Lattice-based Absorption 的标准框架  
  
### 4.1 顶点划分  
  
选择：  
  
$$  
\mathcal P = \{V_1,\dots,V_r\}  
$$  
  
来源可能是：  
  
- extremal structure  
- regularity partition  
- hypergraph clustering  
  
---  
  
### 4.2 构造 robust edge-lattice  
  
只取“出现很多次”的局部结构，生成格 \(L\)。  
  
关键词：  
  
- robust vectors  
- edge-lattice  
  
---  
  
### 4.3 transferral  
  
若格包含：  
  
$$  
\mathbf{u}_i - \mathbf{u}_j  
$$  
  
说明可以在不同部分之间调节顶点数量。  
  
---  
  
### 4.4 absorbing set（带格条件）  
  
构造 \(A\subseteq V\)，满足：  
  
若 \(R\) 很小且  
  
$$  
\mathbf{i}(R)\in L  
$$  
  
则 \(A\) 可吸收 \(R\)。  
  
---  
  
### 4.5 控制 leftover  
  
在 almost spanning 阶段后，必须证明：  
  
$$  
\mathbf{i}(R)\in L  
$$  
  
这是 lattice 方法中最关键的一步之一。  
  
---  
  
## 5. 关键概念总结  
  
- **robust edge-lattice**  
- **divisibility barrier**  
- **transferral**  
- **index vector**  
- **partition-based absorption**  
  
---  
  
## 6. 文献脉络 
  
### 6.1 源头框架  
  
#### Keevash–Mycroft (2015)  
  
*A Geometric Theory for Hypergraph Matching*  
  
- 引入：  
  - robust edge-lattice  
  - divisibility barrier  
  - transferral  
- 建立“格结构刻画 perfect matching 障碍”  
  
👉 所有 lattice-based absorption 的理论源头  
  
---  
  
### 6.2 Han 系列：方法成型  
  
#### Jie Han (2015–2018 系列)  
  
- *Near Perfect Matchings in Uniform Hypergraphs*  
- *On Perfect Matchings and Tilings in Uniform Hypergraphs*  
  
特点：  
  
- 明确使用 **lattice-based absorbing method**  
- 将 Keevash–Mycroft 框架转化为实际证明工具  
  
👉 方法真正“可操作化”  
  
---  
  
#### Gao–Han–Zhao  
  
- \(K_4^-\)-factor in 3-graphs  
  
特点：  
  
- 明确写出术语：  
    
  > lattice-based absorbing method  
  
👉 术语正式出现  
  
---  
  
### 6.3 后续发展（标准工具）  
  
#### Ding–Han–Sun–Wang–Zhou  
  
*Tiling multipartite hypergraphs in quasi-random hypergraphs*  
  
- 明确称：  
    
  > key tool is the lattice-based absorption method  
  
👉 在 quasi-random setting 中标准化  
  
---  
  
#### Chang–Ge–Han–Wang  
  
*Matching of given sizes in hypergraphs*  
  
- 使用：  
  - robust lattice  
  - divisibility barrier  
  
👉 格方法成为主流技术  
  
---  
  
#### Gan–Han (2022+)  
  
- perfect matching decision problem  
  
👉 扩展到结构刻画与算法问题  
  
---  
  
### 6.4 图论中的应用（较少但存在）  
  
#### Hu–Li–Wang–Yang (2022)  
  
- graph tilings with constraints  
  
👉 表明方法不仅限于超图  
  
---  
  
## 7. 一句话总结方法论  
  
普通吸收法：  
  
> 只关心“剩下多少”  
  
基于格的吸收法：  
  
> 关心“剩下多少 + 分布是否可线性组合”  
  
---  
  
## 8. 研究视角下的理解（很重要）  
  
可以把 lattice-based absorption 理解为：  
  
> 将“可吸收性问题”转化为一个整数格上的可达性问题。  
  
核心变成：  
  
- 构造格 \(L\)  
- 证明 leftover 向量在 \(L\)  
- 用 absorbing set 实现构造  
  
---  
  
## 9. 读论文时重点关注  
  
当你看到吸收法 + lattice 时，重点看：  
  
1. partition 是怎么选的    
2. lattice 是怎么定义的    
3. 是否有 transferral    
4. absorbing set 吸收哪些向量    
5. leftover 如何被控制进 lattice    
  
---  
  
## 10. 最后一句直观理解  
  
> 吸收方法解决“少量剩余”，    
> lattice 方法解决“剩余如何分布”。  
  
二者结合，才能解决 **hypergraph perfect matching / tiling 的整除障碍问题**。

---

如果你下一步想更“研究导向”一点，我建议可以再补一张卡片：

👉 **“divisibility barrier vs space barrier” 对比卡片**

这个基本就是 lattice 方法真正要解决的问题核心。



