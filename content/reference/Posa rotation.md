---
tags:
  - hamiltonicity
  - embedding_universality
  - posa_rotation
category: theorems-tools-methods
---

## 定义  
  
Pósa rotation 是 Hamilton 路径 / 长路问题中的一个基本操作。    
设  
$$  
P=v_1v_2\cdots v_t  
$$  
是图 $G$ 中的一条路径，并把 $v_1$ 固定为一个端点。若对某个 $i<t-1$，边 $v_t v_i$ 存在，那么可以把路径末端这段“翻转”，得到新路径  
$$  
P'=v_1v_2\cdots v_i v_t v_{t-1}\cdots v_{i+1}.  
$$  
这条新路径与原路径使用同样的顶点集，只是端点发生了变化。这个操作就称为一次 **Pósa rotation**。  
  
---  
  
## 直观理解  
  
它的作用是：  
  
- 不增加新顶点；  
- 保持路径长度不变；  
- 通过“旋转”路径尾部，制造出很多不同的端点。  
  
所以它的核心思想不是“立刻变长”，而是：  
  
> 先从一条最长路径出发，利用 rotation 产生很多可能的端点，再尝试从这些端点向外延伸。  
  
这就是著名的 **rotation-extension** 方法。  
  
---  
  
## 为什么叫 rotation  
  
因为当末端 $v_t$ 连到路径内部某个顶点 $v_i$ 时，可以把边 $v_i v_{i+1}$ 断开，再加入边 $v_t v_i$，这样路径尾部  
$$  
v_{i+1}v_{i+2}\cdots v_t  
$$  
就被反向接回去，看起来像是绕着支点 $v_i$ “转了一下”。  
  
这里：  
  
- $v_i$ 常叫 **pivot**；  
- 新端点从 $v_t$ 变成了 $v_{i+1}$。  
  
---  
  
## 基本图像  
  
原路径：  
$$  
v_1-\cdots-v_i-v_{i+1}-\cdots-v_t  
$$  
  
若有额外边 $v_t v_i$，则旋转后变成：  
$$  
v_1-\cdots-v_i-v_t-v_{t-1}-\cdots-v_{i+1}.  
$$  
  
于是端点从  
$$  
(v_1,v_t)  
$$  
变成  
$$  
(v_1,v_{i+1}).  
$$  
  
---  
  
## 核心用途  
  
### 1. 产生很多端点  
  
从一条最长路径出发，连续做 rotation，可以得到许多不同的另一端点。    
这些端点组成的集合通常记为某个 endpoint set。  
  
### 2. 逼出扩张性质  
  
如果图有较强扩张性，那么这些可达端点集合往往不能太小。    
因为每次 rotation 都可能产生新的端点，而扩张又会迫使这种“可达性”迅速增长。  
  
### 3. 导出 Hamilton cycle 或更长路径  
  
若某个新端点还能连到路径外的点，就能把路径延长，这与“最长路径”矛盾；    
若两个合适端点之间有边，就可能把整条路径闭成 Hamilton cycle。  
  
---  
  
## 一个最常见的使用框架  
  
1. 取一条最长路径 $P$；  
2. 固定一个端点，反复做 Pósa rotation；  
3. 得到很多可能的另一端点；  
4. 证明这些端点集合很大；  
5. 用图的扩张性 / 连边性质推出：  
   - 要么路径还能继续延长；  
   - 要么可以闭合成 Hamilton cycle。  
  
---  
  
## 应该记住的核心结论  
  
Pósa rotation 的真正价值不在于一次操作本身，而在于下面这句话：  
  
> 一条最长路径并不是“僵死”的；通过 rotation，它往往隐藏着大量可替换端点。  
  
这使得“最长路径”从一个静态对象，变成了一个可以被系统搜索的结构族。  
  
---  
  
## 在 expander 里为什么特别有用  
  
在 expander 中，端点集合一旦开始增长，就很容易借助邻居扩张迅速变大；    
而一旦端点集合和它们的邻居都很大，就可以用“大集合之间必有边”这类性质把路径闭合起来。  
  
所以很多 Hamiltonicity 证明都可以概括为：  
  
$$  
\text{long path}+\text{Pósa rotations}+\text{expansion}\Longrightarrow \text{Hamilton cycle}.  
$$  
  
---  
  
## 一句话总结  
  
> **Pósa rotation 是把一条长路径的尾部翻转，从而在不改变顶点集的前提下制造新端点的操作；它是 rotation-extension 方法的核心。**

## See also
- [[DFS algorithm]] — 另一种找长路径的方法，DFS 给出初始长路径，Pósa rotation 将其推向 Hamilton 圈
- [[C-expander]] — expansion 性质使得 rotation 产生的端点集迅速增长
- [[Chernoff Bound]] — 在随机图中用 rotation-extension 时常配合 Chernoff 控制度数

