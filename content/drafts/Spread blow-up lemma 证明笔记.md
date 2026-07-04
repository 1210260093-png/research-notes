

> 论文: *Spread blow-up lemma with an application to perturbed random graphs* (Rajko Nenadov, Huy Tuan Pham, arXiv:2410.06132, 2024)

---

## 1. 证明总路线图

### 主定理: Lemma 2 (Spread Blow-up Lemma)

**依赖结构:**

```
Lemma 2 (Spread Blow-up Lemma)
│
├── 正确性 (存在满足条件的 embedding)
│   ├── 算法 (Phase I + Phase II)
│   │   ├── Phase I (嵌入 H\B)
│   │   │   ├── Definition 8 (S-quasirandom embedding)
│   │   │   ├── Claim 9 (quasirandom → ε′′-regular 二分图)
│   │   │   │   └── Lemma 4 (quasirandom graphs 的双分图版本判定准则)
│   │   │   ├── Claim 10 (|Ei| ≤ ε′′N，保证 exceptional step 合法)
│   │   │   │   └── Claim 9
│   │   │   ├── Claim 11 (bound on |Lj|，控制低度顶点数量)
│   │   │   │   └── Claim 9
│   │   │   └── |Aj+1| 的下界 (保证算法不会卡住)
│   │   │       └── ε-regularity + Markov不等式 + Claim 11
│   │   ├── Phase II (嵌入 B，使用 spread perfect matchings)
│   │   │   └── Lemma 7 (spread perfect matchings)
│   │   │       ├── Lemma 5 ((ε,δ)-super-regular → ε′-super-regular with specified d)
│   │   │       │   └── 随机下采样 + 贪心修边
│   │   │       └── Theorem 6 (Pham–Sah–Sawhney–Simkin: spread PM in ε-super-regular)
│   │   └── Lemma 5 (允许假设 ε-super-regular + uniform density d)
│   │
│   └── 参数层级: ε ≪ ε′ ≪ ε′′ ≪ β ≪ δ₃ ≪ δ₂ ≪ δ₁ ≪ δ₀ ≪ d, α
│
└── 顶点展开性 (O(1/N)-vertex-spread)
    ├── Phase I: |Aj+1| ≫ δ₂N 大 → 每次选择 spread → 用 Aj+1 大小控制概率
    ├── Phase II: Lemma 7 本身是 O(1/m)-spread
    ├── Exceptional step: Di 的大小 βN 足够大
    └── 三个来源 chain 起来：|Aj+1| / |Di| / Lemma 7
```

```
Theorem 3 (Application: perturbed random graphs)
│
├── Regularity lemma → reduced graph R
├── Lemma 12 (star partition, K_{1,k} 分解)
│   └── max flow / min cut argument
├── Lemma 13 (O(1/n)-vertex-spread distribution of ξ-good bijections)
│   └── Lemma 2 (Spread Blow-up Lemma) ← 核心依赖
├── Lemma 15 (induced distribution λ on Hφ is C′-spread)
│   └── Claim 16 (edge bound: v(T)(k-1) - (1+γ)(k-1))
│       + 生成函数式计数 + union bound
└── Theorem 14 (Spiro, spread → threshold without log factor)
    └── 等价于 Kahn-Kalai 猜想的加强形式
```

### 主证明的主线

整个 Lemma 2 的证明思路可以概括为一句话：**把 Komlós–Sárközy–Szémeredi 的算法化 blow-up 引理中的 "存在性" 步骤，逐个替换为 "均匀随机选择"（在足够大的候选集 Aj+1 上），从而自然的构造一个 spread 分布；最后用 Pham–Sah–Sawhney–Simkin 的 spread perfect matching 结果完成剩余部分。**

核心策略是：
1. 把 embedding 过程设计成一个算法，每一步有大量候选顶点可选（|Aj+1| $\gg$ $\delta_{2}$N）；
2. 每一步「均匀随机」选择一个候选 $\to$ 因为这些候选集很大，所以对任意固定的 k 个顶点对，它们一起被某一步恰好选中的概率 $\leq$ (C/N)^k，这正好给出 O(1/N)-vertex-spread 性质；
3. 证明算法不会卡住 $\to$ 需要维持一个关键的不变式 "S-quasirandom embedding"，它保证在每一步都能找到足够多的候选顶点；
4. 最后剩下的部分（集合 B）因为特别设计（度为 $\Delta$、彼此距离 $\geq$ 4），可以用已有的 spread perfect matching 定理直接处理。

---

## 2. 每个关键引理的作用

### Lemma 4 (Bipartite quasirandomness criterion)

原论文引用 Thomason [18] 和 Chung–Graham–Wilson [5] 的经典结果。这里只需其双分图版本。

**它想解决的问题**：给定一个二分图，如何用一个解析条件（关于公共邻域的二阶矩）来判定它是 $\varepsilon$-regular 的。

**输入条件的作用**：条件 $$\sum_{x,x'} |N_G(x) \cap N_G(x')|^2 \leq d^4|X|^2|Y|^2 + \xi|X|^2|Y|^2$$ 是说 "公共邻域大小的平方和接近完全随机二分图的行为"（在完全随机二分图中，这个和等于 $$d^4|X|^2|Y|^2$$）。

**输出结论的意义**：满足这个条件的二分图一定是 $\varepsilon$-regular 的。

**在主证明中的位置**：Claim 9 使用它。Claim 9 说：如果 $\varphi$ 是 S-quasirandom 的，那么从 U 到 Vi 的辅助二分图 Bi($\varphi$, U) 是 $\varepsilon''$-regular 的。论证方式就是用 (P1) 和 (P2) 去验证 Lemma 4 的条件。

**证明难点**：Lemma 4 本身是已知结果，作者不证明它。

---

### Lemma 5 (($\varepsilon$,$\delta$)-super-regular $\to$ $\varepsilon'$-super-regular with specified density)

**它想解决的问题**：输入一个 ($\varepsilon$,$\delta$)-super-regular 的二分图 G，想要一个子图是 $\varepsilon'$-super-regular 且密度恰好为某个指定的 d（且所有边密度统一为 d）。

**输入条件的作用**：
- ($\varepsilon$,$\delta$)-super-regular 保证了每个顶点的度至少 $\delta$ N，这确保了在随机下采样后，低度顶点仍然可以从不属于 L$\cup$ H 的大集合中补边；
- $\varepsilon$-regular 保证了大部分顶点度接近均值，这确保了随机下采样 + 补边后图的 regularity 不退化太多。

**输出结论的意义**：获得一个所有 super-regular pair 密度都相同（均为 d）且可以取 $\varepsilon'$ = O($\varepsilon^{1/2}$) 的 $\varepsilon'$-super-regular 子图。这简化了 Lemma 2 的参数环境：可以假设所有 (Vi, Vj) 都是 $\varepsilon$-super-regular 且密度统一为 d。

**在主证明中的位置**：在 §2.3 开头：用 Lemma 5 取 d = $\delta$/2，把 ($\varepsilon$,$\delta$)-super-regular 转化为 $\varepsilon$-super-regular with uniform density d。这使得整个算法中的所有计算都用同一个 d。

**证明难点**：
1. 随机下采样：每条边以概率 d/d_{0} 保留 $\to$ 获得子图 G̃；
2. 用 Chernoff 不等式和 union bound 证明 G̃ 在所有大子集对上仍接近 regular（这里有一个精细的技术点：union bound 需要覆盖指数多的大子集对，但 Chernoff 给的概率衰减是 $$\exp(-c\gamma^2 d_0 |X_1'||X_2'|)$$，对 $$|X_i'| \geq \varepsilon N$$ 这足够小）；
3. 构造性地修理低度顶点（L）和高度顶点（H）：从 V(G) \ (L$\cup$ H) 中补/删边，这个操作只改变 $$O(\varepsilon N)$$ 条边在受影响的顶点周围；
4. 最后证明在子集大小 $\geq$ $\varepsilon'$N 时（$\varepsilon'$ = O($\varepsilon^{1/2}$)），edge correction 的误差 $$O(\varepsilon N)(|X_1'|+|X_2'|)$$ 可以被吸收进 $\varepsilon'$-regularity 的容差中。

---

### Theorem 6 (Pham–Sah–Sawhney–Simkin: spread perfect matchings)

这是 Pham–Sah–Sawhney–Simkin [16, Theorem 4.2] 的结果。原文不证明它。

**它想解决的问题**：给定一个 $\varepsilon$-super-regular 的二分图（两部分大小相同，密度 $\geq$ d_{0}），构造一个在完美匹配上的分布，使得这个分布是 O_d(1/m)-spread 的。

**输出结论的意义**：这是整个 proof pipeline 的终端——Phase II 中，B 的嵌入直接依赖 Lemma 7（它是 Theorem 6 的 ($\varepsilon$,$\delta$)-版本），而 Lemma 7 本身通过 Lemma 5 从 Theorem 6 推出。

---

### Lemma 7 (Spread perfect matchings in ($\varepsilon$,$\delta$)-super-regular graphs)

**它想解决的问题**：Theorem 6 要求图是 $\varepsilon$-super-regular（度双边控制在 (d$\pm$$\varepsilon$)N），而实际给的是 ($\varepsilon$,$\delta$)-super-regular（度只下界 $\delta$ N，不保证上界）。Lemma 7 把定理推广到这个更弱的输入条件。

**输出结论的意义**：使得 Phase II 可以直接应用于 ($\varepsilon$,$\delta$)-super-regular pair 的剩余部分。

**在主证明中的位置**：Phase II。先确保剩余二分图满足 Lemma 7 的条件（每条边有足够大的度），然后直接调用。

**证明难点**：由 Lemma 5，先把 ($\varepsilon$,$\delta$)-super-regular 图转化为 $\varepsilon'$-super-regular 子图（指定密度 d），然后在这个子图上调用 Theorem 6。

---

### Claim 9 (Quasirandom embedding $\to$ $\varepsilon''$-regular bipartite)

**它想解决的问题**：在嵌入过程中，给定一个 S-quasirandom 的部分嵌入 $\varphi$，对于任意同质子集 U（所有顶点有相同的 |NH(x) $\cap$ S| = $\ell$），辅助二分图 Bi($\varphi$, U)（U 连到 Vi，边表示 "候选"）是 $\varepsilon''$-regular 的。

**输入条件的作用**：
- U $\cap$ W = $\emptyset$ $\to$ 对 x $\in$ U 有 Wx = Vh(x)，所以 (P1) 给出无约束的下界；
- U $\cap$ NH(D) = $\emptyset$ $\to$ 对 x $\in$ U，不需要考虑 D 嵌入造成的不可控影响；
- 所有 x 有 |NH(x) $\cap$ S| = $\ell$ $\to$ 保证了 (P1) 和 (P2) 中所有指数一致，这是应用 Lemma 4 的前提；
- |U| $\geq$ $\delta_{3}$N $\to$ 保证足够的子集大小来推 regularity。

**输出结论的意义**：这是整个算法的核心枢纽。它把 "S-quasirandom" 这个全局代数条件，转化为局部二分图的 $\varepsilon''$-regular 性质，从而允许使用 regularity 方法的标准推论（如大子集中每条边都有大量候选邻域）。

**在主证明中的位置**：
- Claim 10 直接用它来证明 exceptional step 合法
- Claim 11 直接用它来 bound Lj 的大小
- 证明 |Aj+1| 的下界也暗中依赖它（通过 regularity 推 "绝大多数顶点都 OK"）

**证明难点**：用 (P1) 和 (P2) 去验证 Lemma 4 的 l_{2} 条件。公式是：

$$
$\sum_{x,x'\in U}$ |C_$\varphi$(x) $\cap$ C_$\varphi$(x')|^2
$\leq$ (d+$\varepsilon$)^{4$\ell$} |U|^2 N^2 + $\varepsilon'$ N^4
= (d'+$\cdot$ s)^4 |U|^2 N^2 + \text{小误差}
$$

这里关键是将 $$|U|^2 N^2$$ 提取出来 —— 用 (P2) 来 bound 满足 (2) 的 pair 的贡献，用 (P1) 的 trivial bound N 来 bound 违反 (2) 的少数 pair 的贡献。Lemma 4 的条件要求误差 $$\xi$$ 足够小，这里 $$\xi = O(\varepsilon'/d'^4)$$，由参数层级 $$\varepsilon' \ll \delta_3 \ll d$$ 保证。

---

### Claim 10 (Bound on |Ei|)

**它想解决的问题**：在 exceptional step（j = |NH(B)|），需要确保 |Ei| $\leq$ |Di| = $\lceil$$\beta$ N$\rceil$，否则不能将 Ei 一对一映射到 Di。Claim 10 证明 |Ei| $\leq$ $\varepsilon''$N $\ll$ $\beta$ N。

**输入条件的作用**：B 中顶点的度被修改为精确 $\Delta$，且在 NH(B) 被嵌入后，每个 b $\in$ Bi 有精确 $\Delta$ 个已嵌入的邻域。由 Claim 9，Bi($\varphi$, Bi) 是 $\varepsilon''$-regular 的。

**输出结论的意义**：确保 exceptional step 合法——Ei 的大小远小于 Di 的大小。

**证明难点**：由 $\varepsilon''$-regularity，Bi($\varphi$, Bi) 中度小于 (d'-$\varepsilon''$)N 的顶点数 $\leq$ $\varepsilon''$N，而 $\delta_{1}$ $\ll$ d'（通过 d' $\geq$ (d-$\varepsilon$)^$\Delta$ 和参数链保证），所以 degree < $\delta_{1}$|Bi| 的顶点数 $\leq$ $\varepsilon''$N。这正是 Ei 的定义。

---

### Claim 11 (Bound on low vertices Lj)

**它想解决的问题**：在每一步 j（j 是 s 的倍数时），识别那些候选集太小的顶点（|C$\varphi$(x) \ $\varphi$(Xj)| < $\delta_{1}$N），将它们移前嵌入。需要证明这些 "低度" 顶点的数量可控（|Lj| < r($\Delta$+1)$\delta_{3}$N），以确保重排顶点不破坏结构。

**输入条件的作用**：设若不然，存在一个 $\ell$-类 Ui$\ell$ 大小为 $\geq$ $\delta_{3}$N。由 Claim 9，Bi($\varphi$, Ui$\ell$) 是 $\varepsilon''$-regular 的。

**输出结论的意义**：控制住低度顶点的数量，保证：
1. 整个 Phase I 中移位的顶点总数 $\leq$ O($\delta_{3}$N/$\delta_{2}$)，远小于 $\delta_{0}$N，所以 B 中大部分顶点仍留在 XT 外，Phase II 可以顺利运行；
2. 来自 reordering 的顶点不会对后续步骤产生不可控的影响。

**证明难点**：
- 关键不等式：从 j=0 到当前步骤，reordering 发生次数 $\leq$ 1/$\delta_{2}$，每次移位最多 r($\Delta$+1)$\delta_{3}$N + |W| + |NH(D)| 个顶点，总和为 (6) 式；
- $\varepsilon''$-regularity 保证了 (Ui$\ell$, Fi) 的密度至少 d' = (d-$\varepsilon$)^$\ell$ - $\varepsilon''$，从而存在顶点 x $\in$ Ui$\ell$ 在 Fi 中有 $\gg$ $\delta_{1}$N 个邻域，与 x $\in$ Lj 矛盾。

---

### Claim 16 (Edge bound in components of T)

**它想解决的问题**：在 Lemma 15 中，要对 |E(T)| 有一个严格的上界——任何由 H$\varphi'$ 中的边构成的连通子图 T，如果 v(T) $\leq$ n/(2km)，则 |E(T)| $\leq$ v(T)(k-1) - (1+$\gamma$)(k-1)。这个 $\delta$ v(T) 的 "亏额" 是后面计数收敛的关键。

**输入条件的作用**：
- v(T) $\leq$ n/(2km) $\to$ T 的顶点至多跨两个连续的 IS 段；
- k $\geq$ 3 $\to$ 确保亏额 $\gamma$ > 0；
- H$\varphi$ 的边结构：只有特定类型的边（同星内：距 $\leq$ k 且 $\xi$(i)=0, $\xi$(j)=1；异星间或涉及 V_{0} 有额外限制）。

**输出结论的意义**：确保 Lemma 15 中 (11) 右边的和以几何级数收敛，最终给出 (C'/n)^{t/(k-1)} 的 bound。

**证明难点**：
- 区分不同类型的顶点：W 中的顶点、Z^{+} 中的顶点、边界顶点；
- W 中第 i 个首/尾顶点（i $\leq$ k）的度至多 k-1+i-1（因为一边是段边界），普通 W 顶点度至多 2(k-1)；
- Z^{+} 中顶点度至多 2(k-1)，且至少一个 Z^{+} 顶点对 W 有非零度时它最多对 W 有 k 条边；
- 综合起来得到上界，再验证对 k $\geq$ 3 这个上界确实 $\leq$ v(T)(k-1) - (1+$\gamma$)(k-1)。

这里需要进一步检查的部分：作者说 "which we can verify to be bounded above by v(T)(k-1) - (1+$\gamma$)(k-1) for a constant $\gamma$ > 0 for all 1 $\leq$ v(T) $\leq$ n/(2km), assuming k $\geq$ 3"，但没有写出具体验证过程。关键是首尾部顶点的度数亏额——当一个顶点有 k-1+i-1 度（而非 2(k-1)）时，相对于 "每人 2(k-1) 度" 的上界就产生了亏额。两个边界（段的头和尾）各有一个方向损失。$\gamma$ 的取值依赖于 k。

---

## 3. 拆解主证明

### Step 1. 参数选择与预处理

**目标**：把问题标准化，使所有 super-regular pair 有统一密度。

**操作**：
- 确定参数链 $$\varepsilon \ll \varepsilon' \ll \varepsilon'' \ll \beta \ll \delta_3 \ll \delta_2 \ll \delta_1 \ll \delta_0 \ll d, \alpha$$
- 用 Lemma 5 取 d = $\delta$/2，把 G 的每个 (Vi, Vj) 的 ($\varepsilon$,$\delta$)-super-regular 转化为 $\varepsilon$-super-regular with density d
- 扩充 H 使 |Hi| = N，|V(H)| = rN = n（加孤立点）
- 选择 Di, Bi $\subset$ eq Hi \ W，满足：
  - |Bi| = $\lceil$$\delta_{0}$N$\rceil$，|Di| = $\lceil$$\beta$ N$\rceil$
  - B $\cup$ D 与 W 无边
  - B $\cup$ D 中任意两点距离 $\geq$ 4
- 修改 H：给 B 加边使每点 degree = $\Delta$，且所有点 degree $\leq$ $\Delta$+1

**为什么这样做**：
- 统一密度 d：所有后续计算只涉及一个 d；
- B 的作用：这些是最后用 spread PM 嵌入的顶点——需要它们互不干扰（距离 $\geq$ 4），且度精确为 $\Delta$（方便应用 Claim 9）；
- D 的作用：作为 "缓冲区" 来吸收 exceptional step 中被映射出去的 Ei 的顶点；
- W 是用户指定的约束集，B$\cup$ D 与 W 无关 $\to$ W 的约束不会影响最后阶段的 spread PM。

**用到的工具**：Lemma 5

**得到的结论**：可以不失一般性地假设所有 (Vi, Vj) 是 $\varepsilon$-super-regular with density d。

**和下一步的关系**：有了整齐的参数和统一的 d，下一步定义算法和 quasirandom embedding。

---

### Step 2. 定义 S-quasirandom embedding (Definition 8)

**目标**：定义一个可在嵌入过程中维持的不变式，它保证下一步总有足够多的候选。

**操作**：给定 S $\subset$ eq V(H) 和 $\varphi$: H[S] $\to$ G，称 $\varphi$ 是 S-quasirandom 如果：

- (P1): 对每个 x $\in$ V(H) \ S，$$|C_\varphi(x)| \geq (d - \varepsilon)^{|N_H(x) \cap S|} |W_x|$$，其中 $$C_\varphi(x) = W_x \cap \bigcap_{y \in N_H(x) \cap S} N_G(\varphi(y))$$
- (P2): 对每个 i $\in$ R，$$\{x,y\} \in (H_i \setminus (N_H(D) \cup S))^2$$ 中，除至多 $$\varepsilon' |S| N$$ 对以外，满足 $$|C_\varphi(x) \cap C_\varphi(y)| \leq (d + \varepsilon)^{|N_H(x) \cap S| + |N_H(y) \cap S|} N$$

**为什么这样做**：
- (P1) 来自 regularity 的自然推广：如果每个已嵌入邻域提供约 d 倍的因子，那么经过 $\ell$ 步后候选集大小应约为 d^$\ell$ · |W_x|；
- (P2) 是 "quasirandom" 的核心——它说 C$\varphi$(x) 和 C$\varphi$(y) 的交集大小接近两个独立集合的交（$$d^{\ell_1 + \ell_2} N$$），这对大多数 (x,y) 对成立。这正是 Lemma 4 的条件（应用到 Claim 9）的根本来源；
- NH(D) 被排除是因为 D 的嵌入方式不可控（exceptional step 把 Ei inject 到 Di），所以它们的邻域交互无法保证 (P2)。

**得到的结论**：定义了一个在嵌入过程中可以递归维护的性质。

**和下一步的关系**：Claim 9 把这个性质转化为二分图的 $\varepsilon''$-regularity。

---

### Step 3. Phase I 算法设计

**目标**：设计一个贪心嵌入算法，每次都在一个大的候选集中均匀随机选择。

**操作**：
1. 初始排序：NH(B) 在最前，B 在最后
2. 对 j = 0, 1, 2, ...：
   - 当 j 是 s = $\lceil$$\delta_{2}$N$\rceil$ 的倍数时：计算 Lj = {x $\notin$ Xj: |C$\varphi$(x) \ $\varphi$(Xj)| < $\delta_{1}$N}，将 Lj 移至前面
   - 计算 Aj+1 $\subset$ eq C$\varphi$(x_{j+1}) \ $\varphi$(Xj)：所有满足条件 (i) 和 (ii) 的候选顶点
   - 从 Aj+1 中均匀随机选 v，令 $\varphi$(x_{j+1}) = v
3. Exceptional step（j = |NH(B)| 时）：
   - 计算 Ei = {v $\in$ Vi \ $\varphi$(Xj): |{b $\in$ Bi: v $\in$ C$\varphi$(b)}| < $\delta_{1}$|Bi|}
   - 随机 inject $\rho$ i: Ei $\to$ Di，嵌入对应顶点
   - 更新所有其他顶点的相对顺序
4. 当 V(H) \ Xj $\subset$ eq B 时，Phase I 终止

**为什么这样做**：
- 排序：NH(B) 最先嵌入是为了尽早把它们嵌入从而可以开始使用 Claim 9（B 的度精确为 $\Delta$，且所有邻域已嵌入，所以 $\ell$ = $\Delta$ 固定）；B 最后嵌入是为了用 spread PM——因为 Phase I 是贪心的，无法保证 spread 性到 B，但 B 被特殊设计以至于最后剩下的二分图仍满足 Lemma 7 的条件；
- Lj 前移：如果一个顶点的候选集太小（< $\delta_{1}$N），继续下去只会更糟——必须趁早嵌入它；
- Aj+1 的两个条件：(i) 保证嵌入 x_{j+1} 后，所有未嵌入邻域 y 的候选集 C$\varphi$(y) 不会突然严重缩小；(ii) 保证 quasirandom 性质得以维持；
- Exceptional step：在刚好嵌入完 NH(B) 之后，用 Claim 10 确认只有少部分 Vi 中的顶点对 B 的覆盖不足——将这些顶点映射到 D 中消耗掉，确保 Phase II 中 B 的剩余部分有足够的候选度。

**用到的工具**：Definition 8, Claim 9, Claim 10

**得到的结论**：一个递归定义的嵌入算法，每次在 Aj+1 中均匀随机选择。

---

### Step 4. Early stage 分析 (j < |NH(B)|)

**目标**：证明在嵌入 NH(B) 的过程中不会出现低度顶点。

**操作**：对每个 x $\in$ V(H)，对每个已嵌入的邻域 y $\in$ NH(x) $\cap$ Xj，由 $\varepsilon$-super-regularity，C$\varphi$(x) 缩小因子至多 (d-$\varepsilon$)（(P1) 的最坏情况）。因此 $$|C_\varphi(x)| \geq (d - \varepsilon)^{\Delta+1} \alpha N \gg \delta_1 N + |N_H(B)|$$。

**为什么这样做**：这个下界直接意味着在 j < |NH(B)| 时不可能有 x $\in$ Lj（因为 Lj 定义为候选 < $\delta_{1}$N 的顶点，而这里的下界远大于 $\delta_{1}$N）。

**用到的工具**：$\varepsilon$-super-regularity, (P1)

**得到的结论**：Early stage 中 Lj = $\emptyset$，没有顶点被前移。

**和下一步的关系**：确保 NH(B) 按原始顺序被嵌入，且嵌入后 $\varphi$ 是 X_{|NH(B)|}-quasirandom 的。

---

### Step 5. Exceptional step 分析 (j = |NH(B)|)

**目标**：处理 Ei 集合——那些在 Phase I 后对 B 覆盖不足的顶点，将它们从 embedding pool 中移除（映射到 D 中）。

**操作**：
- 对每个 i $\in$ R，令 Ei = {v $\in$ Vi \ $\varphi$(Xj): v 在 Bi($\varphi$, Bi) 中度 < $\delta_{1}$|Bi|}（即 v 是 Bi 中很少顶点的候选）
- Claim 10 证明 |Ei| $\leq$ $\varepsilon''$N
- 因为 |Di| = $\lceil$$\beta$ N$\rceil$ $\gg$ $\varepsilon''$N（由参数层级 $\varepsilon''$ $\ll$ $\beta$），可以将 Ei 注入到 Di
- 将 $\rho$ i(Ei) 移到排序最前面，令 $\varphi$($\rho$ i(v)) = v（即消耗 D 中的顶点来接收 Ei 中的顶点）
- 嵌入后更新 $\varphi$：D 的已嵌入顶点自然满足 (P1)（因为它和 NH(B) 没有边，(P1) 退化为 trivial），而 (P2) 不涉及 NH(D)

**为什么这样做**：这些 Ei 中的顶点如果留在 Vi 中，会在 Phase II 中破坏 Lemma 7 的最小度条件。解决方案是用 D 的顶点去 "接收" 它们——D 本来就是预留出来做这个用的。之所以 D 和 B 之间距离 $\geq$ 4，就是为了确保嵌入 D 不影响 B 的候选集性质。

**用到的工具**：Claim 9, Claim 10

**得到的结论**：Exceptional step 合法，且完成后 $\varphi$ 仍然是 Xj-quasirandom 的。

**和下一步的关系**：清除了 Ei，为 Phase II 中应用 Lemma 7 做好准备。

---

### Step 6. Regular stage 分析 (j > |NH(B)|)

**目标**：证明 Phase I 可以持续到所有 H \ B 都被嵌入为止。

**核心**：两个关键结果：
1. Claim 11：|Lj| < r($\Delta$+1)$\delta_{3}$N $\to$ 被前移的顶点总量可控
2. |Aj+1| $\gg$ $\delta_{2}$N $\to$ 候选集始终很大（算法不会卡住，也保证了 vertex-spread）

#### 6a. Claim 11 的证明

**操作**：反证法。设存在 Lj 违反 bound。取一个 i $\in$ R 和 $\ell$ $\in$ {0,...,$\Delta$+1} 使得 Ui$\ell$（所有满足 |NH(x) $\cap$ Xj| = $\ell$ 的 x $\in$ Hi $\cap$ Lj \ (...)）的大小 $\geq$ $\delta_{3}$N。

由 Claim 9，Bi($\varphi$, Ui$\ell$) 是 $\varepsilon''$-regular。令 Fi = Vi \ $\varphi$(Xj)。由于 reordering 发生次数 $\leq$ 1/$\delta_{2}$，总共前移的顶点至多 (6) 式——这远小于 $\delta_{0}$N。所以 |Fi| $\geq$ $\delta_{0}$N/2 $\gg$ $\varepsilon''$N。

由 $\varepsilon''$-regularity，(Ui$\ell$, Fi) 密度至少 d' = (d-$\varepsilon$)^$\ell$ - $\varepsilon''$。所以存在 x $\in$ Ui$\ell$，|C$\varphi$(x) \ $\varphi$(Xj)| $\geq$ d'|Fi| $\gg$ $\delta_{1}$N，与 x $\in$ Lj 矛盾。

**这里参数链的关键作用**：
- $\delta_{3}$ ← 决定 Ui$\ell$ 的大小下界。$\delta_{3}$N 必须足够大以便 $\varepsilon''$-regularity 有意义；
- $\delta_{1}$ ← 决定 "低度" 的阈值；(d-$\varepsilon$)^$\ell$ · ($\delta_{0}$/2) 必须 $\gg$ $\delta_{1}$；
- $\delta_{2}$ ← s = $\lceil$$\delta_{2}$N$\rceil$ 是 check Lj 的步长；$\delta_{2}$ 必须 $\gg$ $\delta_{3}$ 以使每次移位的顶点数被吸收。

#### 6b. |Aj+1| 的下界

**操作**：三部分估计：
1. 由 (7) 式，|C$\varphi$(x_{j+1}) \ $\varphi$(Xj)| $\geq$ (d-$\varepsilon$)^{$\Delta$+1}$\delta_{1}$N - 2s $\gg$ $\delta_{2}$N（通过归纳和 Lj 的处理方式保证）；
2. 由 $\varepsilon$-regularity，至多 O($\varepsilon$)N 个 v $\in$ C$\varphi$ 违反条件 (i)（用 regularity 的典型推论：对固定的 y，绝大多数 v 满足 |N(v) $\cap$ C$\varphi$(y)| $\geq$ (d-$\varepsilon$)|C$\varphi$(y)|）；
3. 违反条件 (ii)（即打破 (P2)）的 v：用 Markov 不等式 bound——随机选 v 的期望破坏 pair 数 $\leq$ $\varepsilon$|P|，总破坏 $\leq$ $\varepsilon'$N 对 $\to$ 至多 O($\varepsilon'$)N 个 v 使 (P2) 不成立。

合在一起：|Aj+1| $\geq$ |C$\varphi$(x_{j+1}) \ $\varphi$(Xj)| - O($\varepsilon'$)N $\gg$ $\delta_{2}$N。

**为什么这样做**：条件 (i) 和 (ii) 各自只排除 O($\varepsilon'$)N 个顶点，剩余的候选集仍然很大。

**用到的工具**：$\varepsilon$-regularity, Markov 不等式, Claim 11

**得到的结论**：(8) 式：|Aj+1| $\gg$ $\delta_{2}$N。这保证：
- 算法不会在某一步因 Aj+1 = $\emptyset$ 而卡住；
- 每一步的概率 mass 均匀分布在 $\gg$ $\delta_{2}$N 个顶点上 $\to$ 任意固定 k 个顶点对的总概率 $\leq$ (1/($\gg$$\delta_{2}$N))^k = O(1/N)^k。

---

### Step 7. Phase II 分析

**目标**：证明 Phase II（嵌入 B 的剩余部分）合法。

**操作**：
- 令 B'i = Bi \ XT（尚未嵌入的 B 中顶点），Fi = Vi \ $\varphi$(XT)
- 由 Claim 11，|B'i| $\geq$ |Bi| - O($\delta_{3}$N/$\delta_{2}$)（只有被前移的 B 中顶点可能在 Phase I 被嵌入，而移位的 B 顶点来自 Lj，其总量由 Claim 11 控制）
- 由 Claim 9，Bi($\varphi$, B'i) 是 $\varepsilon''$-regular 的
- |Fi| = |B'i|（因为 Vi 中已有精确 N - |B'i| 个顶点被使用）$\to$ 二分图是 balanced 的
- 由 exceptional step 和 (7) 式保证的最小度 $\to$ Lemma 7 的条件满足
- 对每个 i，调用 Lemma 7 得到一个 O(1/N)-spread 分布 µi 在 B'i 和 Fi 之间的完美匹配上

**为什么这样做**：Phase I 是贪心的，不能保证 B 中顶点的嵌入是 spread 的——因为到 Phase I 结束时，某些 B 中顶点可能只剩很少的候选。Phase II 用一个全局的 spread PM 来解决这个问题。关键是：Phase I 对所有顶点（除了 D 中消耗的顶点）保持了一致的 quasirandom 性质，所以 B'i 和 Fi 之间的二分图仍然满足 regularity + 最小度条件。

**用到的工具**：Claim 9, Claim 11, Lemma 7

**得到的结论**：Phase II 合法，B 的剩余部分以 O(1/N)-spread 的方式被嵌入。

---

### Step 8. Vertex-spread 性质

**目标**：证明最终分布 $\lambda$ 是 O(1/N)-vertex-spread 的。

**操作**：
- Phase I 的每一步：从 Aj+1 中均匀随机选择，而 |Aj+1| $\gg$ $\delta_{2}$N。因此对任意固定 k 个顶点-位置对，它们在 Phase I 中被满足的概率 $\leq$ (1/($\gg$$\delta_{2}$N))^k = O(1/N)^k；
- Exceptional step：每个 $\rho$ i 从 Di 的剩余部分中均匀随机选择 $\to$ |Di| = $\lceil$$\beta$ N$\rceil$ $\gg$ 1/N，这也是 O(1/N)-spread 的；
- Phase II：Lemma 7 本身保证 O(1/N)-spread；
- 三个来源通过 chain rule 组合 $\to$ 总体 O(1/N)-vertex-spread。

**为什么这样做**：Vertex-spread 的定义要求对任意 k 个不同的 (xi, yi) 对，联合概率 $\leq$ q^k。这等价于说分布的条件概率在每一步都被一个大分母 bound 住。Phase I + Exceptional step + Phase II 都是 "在大集合中均匀选择" 的变体，所以这个性质自动成立。

**用到的工具**：(8) 式的下界、Lemma 7

**得到的结论**：$\lambda$ 是 O(1/N)-vertex-spread 的。Lemma 2 证毕。

---

## 4. 精读关键证明段落

### 4.1 S-quasirandom 定义的动机与维护

**原文在做什么**：Definition 8 定义了 S-quasirandom 嵌入。它不是 classical quasirandom 的概念（那些是关于图的），而是关于一个部分嵌入 "好" 的程度——已经嵌入的顶点 S 给未嵌入顶点留下的候选集 C$\varphi$(x) 有多大，以及候选集之间的交集有多 "独立"。

**为什么要这么做**：
- (P1) 是最基本的必要条件：如果部分嵌入 $\varphi$ 用掉了 x 的 $\ell$ 个邻域，那么 x 的候选集应该大约是 d^$\ell$ · |Wx|。如果这个数值太小，后续步骤可能没有足够的选择；
- (P2) 是 subtler 的：如果两个顶点的候选集高度相关（交集异常大），那么 Claim 9 中的二分图就不是 quasirandom 的，无法推出 $\varepsilon''$-regularity。P2 排除了这种可能性——除了极少对以外，两个顶点的候选集行为像独立的。
- NH(D) 被排除在 (P2) 之外，是因为 D 中的顶点在 exceptional step 中被一组高度相关的选择映射出去，所以它们邻域的候选集可能不独立。但由于 D 被选在 H 中隔离的位置，这不会影响其他顶点。

**这一步真正得到什么**：一个可以在算法中递归维护的 invariant。每次嵌入新顶点，只要从 Aj+1 中选取（条件 (ii) 保证了这一点），X_{j+1}-quasirandom 性质就自动维持。

---

### 4.2 Claim 9 的计数论证

**原文在做什么**：Claim 9 说：如果 $\varphi$ 是 S-quasirandom 的，且 U 是一组 "同质" 的未嵌入顶点（所有顶点的已嵌入邻域数相同 = $\ell$，U 不涉及 W 或 NH(D)，|U| $\geq$ $\delta_{3}$N），那么二分图 Bi($\varphi$, U)（U 对 Vi，边 = "v $\in$ C$\varphi$(x)"）是 $\varepsilon''$-regular 的，密度至少 (d-$\varepsilon$)^$\ell$。

证明分两步：
1. 密度下界：直接来自 (P1)——每个 x $\in$ U 有 |C$\varphi$(x)| $\geq$ (d-$\varepsilon$)^$\ell$ N；
2. $\varepsilon''$-regularity：用 Lemma 4。计算 $$\sum_{x,x'} |C_\varphi(x) \cap C_\varphi(x')|^2$$。对满足 (P2) 的对，上界是 (d+$\varepsilon$)^{2$\ell$} N^2；对不满足 (P2) 的 $\leq$ $\varepsilon'$|S|N 对，trivial bound 是 N^2（显然 |C$\varphi$(x) $\cap$ C$\varphi$(x')| $\leq$ N）。总计：

$$
\begin{aligned}
$\sum_{x,x'}$ |C_$\varphi$(x) $\cap$ C_$\varphi$(x')|^2
&$\leq$ |U|^2 $\cdot$ (d+$\varepsilon$)^{2$\ell$} N^2 + $\varepsilon'$|S|N $\cdot$ N^2 \\
&= (d')^4 |U|^2 N^2 + O\!\left(\frac{$\varepsilon'$}{$\delta$_3^2 d^{4$\ell$}}\right) |U|^2 N^2
\end{aligned}
$$

因为 $$|U| \geq \delta_3 N$$ 且 $$|S| \leq n = O(N)$$，这里用 d' = (d+$\varepsilon$)^$\ell$（近似）。

**为什么要这么做**：这是整个证明的技术核心。把 S-quasirandom 这个看似抽象的性质翻译成一个可以直接使用 regularity 理论的具体性质——辅助图的 $\varepsilon''$-regularity。这一步把 "定义了一个好性质" 变成了 "这个性质确实有用"。

**这一步真正得到什么**：证明 S-quasirandom embedding 确实保证了后续候选图的 regularity，从而后续所有基于 regularity 的估计（Claim 10, Claim 11, |Aj+1| 下界等）都有了合法的基础。

**需要注意的地方**：这里有一个隐含的近似——把 d' = (d-$\varepsilon$)^$\ell$ 和 (d+$\varepsilon$)^$\ell$ 之间的差距吸收了。因为 $\varepsilon$ $\ll$ d，两者之比是 (1 $\pm$ O($\varepsilon$/d))^$\ell$，可以被参数链吸收。

---

### 4.3 Claim 11 的反证论证——为什么 Lj 不会太大

**原文在做什么**：假设存在一个 j $\in$ sZ 使得 |Lj \ (W $\cup$ NH(D))| $\geq$ r($\Delta$+1)$\delta_{3}$N。按照 Lj 中顶点的已嵌入邻域数 $\ell$ 和所属部分 i 进行分类。由 pigeonhole 原理，存在某个 i $\in$ R 和 $\ell$ $\in$ {0,...,$\Delta$+1} 使得 Ui$\ell$（Lj 中属于 Hi、有 $\ell$ 个已嵌入邻域的顶点）的大小 $\geq$ $\delta_{3}$N。

现在考虑辅助图 Bi($\varphi$, Ui$\ell$)。由 Claim 9，它是 $\varepsilon''$-regular 的。另一方面，Vi 中至多有一部分顶点已经被使用（$\varphi$(Xj)），剩余集合 Fi 仍然很大（|Fi| $\geq$ $\delta_{0}$N/2），因为总共在 reordering 中前移的顶点 $\leq$ O($\delta_{3}$N/$\delta_{2}$) $\ll$ $\delta_{0}$N。

由 $\varepsilon''$-regularity，(Ui$\ell$, Fi) 的密度至少 (d-$\varepsilon$)^$\ell$ - $\varepsilon''$。这意味着存在一个 x $\in$ Ui$\ell$ 在 Fi 中有邻域 $\geq$ ((d-$\varepsilon$)^$\ell$ - $\varepsilon''$)|Fi| $\gg$ $\delta_{1}$N 个。但 x $\in$ Lj 意味着 |C$\varphi$(x) \ $\varphi$(Xj)| < $\delta_{1}$N——矛盾。

**为什么要这么做**：
- 这个反证是典型的 regularity 方法论证：如果 Lj 太大，regularity 保证了一定存在高密度的大子集，从而任何顶点都有大量邻域，这就与 Lj 的定义矛盾；
- 这里 "大" 的阈值 $\delta_{3}$ 必须仔细选择：一方面 $\delta_{3}$ $\gg$ $\varepsilon''$（使得 $\varepsilon''$-regularity 有意义），另一方面 $\delta_{3}$ $\ll$ $\delta_{2}$（使得 reordering 的总量被控制）。

**这一步真正得到什么**：
- 直接结果：|Lj| $\leq$ O($\delta_{3}$N)；
- 推论：整个 Phase I 中移位的顶点总数 $\leq$ O($\delta_{3}$N/$\delta_{2}$) $\ll$ $\delta_{0}$N；
- 更进一步的推论：这确保 Phase II 中 B 的剩余集合 B'i 仍然足够大（至少 $\geq$ $\delta_{0}$N/2），满足 Lemma 7 的应用条件。

---

### 4.4 |Aj+1| 下界的三部分估计

**原文在做什么**：证明 |Aj+1| $\gg$ $\delta_{2}$N。

**第一部分**（C$\varphi$ 大小本身）：由 (7) 式，|C$\varphi$(x_{j+1}) \ $\varphi$(Xj)| $\geq$ (d-$\varepsilon$)^{$\Delta$+1}$\delta_{1}$N - 2s $\gg$ $\delta_{2}$N。这个下界是通过一个两步归纳得到的——如果一个顶点 x 在 j $\in$ sZ 时不在 Lj 中，那么经过 s 步后它的候选集至少缩小因子 (d-$\varepsilon$)^{d_{1}}，其中 d_{1} 是 x 在这 s 步中新嵌入的邻域数；如果它在 Lj+s 中（意味着候选太小需要被前移），它会在接下来的 s 步内被嵌入，而这两轮 s 步的累积损失是 controllable 的。

**第二部分**（条件 (i)）：对每个 y $\in$ NH(x_{j+1})\Xj，需要 |NG(v) $\cap$ (C$\varphi$(y) \ $\varphi$(Xj))| $\geq$ (d-$\varepsilon$)|C$\varphi$(y) \ $\varphi$(Xj)|。由 $\varepsilon$-regularity（应用于 pair (Vh(x_{j+1}), Vh(y))），至多 O($\varepsilon$)N 个 v 对固定的 y 违反这个条件。对至多 $\Delta$+1 个 y union bound，至多 O$\Delta$($\varepsilon$)N 个 v 违反。

**第三部分**（条件 (ii)，维护 (P2)）：考虑 P——所有至少有一个端点在 NH(x_{j+1}) 中的、当前满足 (2) 的顶点对（已排除 NH(D) 附近的）。对每对 (x,y) $\in$ P，至多 $\varepsilon$ N 个 v 的加入会破坏它（这是 $\varepsilon$-regularity 的典型推论：将 v 加入 S 后，C$\varphi$(x) $\cap$ C$\varphi$(y) 的变动被 regularity 控制）。总共有 |P| 个这样的对。随机选择 v 时，破坏的对数的期望是 $\leq$ $\varepsilon$|P|。由 Markov 不等式，破坏超过 (2($\Delta$+1)$\varepsilon$/$\varepsilon'$)|P| 对（这对应 $\varepsilon'$N 个新破坏的对）的概率 $\leq$ $\varepsilon'$/(2($\Delta$+1)) $\ll$ 1。因此至多 O($\varepsilon'$)N 个 v 会使 (P2) 不成立。

**为什么要这么做**：分三部分的逻辑很清晰：
1. C$\varphi$ 本身要大（由 quasirandom 性质保证）；
2. 嵌入 x_{j+1} 后，所有未嵌入的邻域 y 的候选集不能突然严重缩小（这是贪心算法能持续的关键——如果嵌入了 x_{j+1} 导致某个 y 的候选集崩溃，后面就无法嵌入 y 了）；
3. Quasirandom 性质要能维持（这是整个归纳的基础）。

**这一步真正得到什么**：(8) 式：|Aj+1| $\gg$ $\delta_{2}$N。这是一个下界，意味着：
- 算法不会在 Phase I 中卡住（总有候选可选）；
- Vertex-spread 性质有保证（候选集越大 $\to$ 选择越 spread）。

**参数链在这一步的作用**：
- 需要 $\varepsilon$, $\varepsilon'$ $\ll$ $\delta_{2}$ 使得 O($\varepsilon'$)N $\ll$ $\delta_{2}$N（排除的顶点远小于候选集大小）；
- 需要 $\delta_{1}$ $\gg$ $\delta_{2}$ 的适当大小关系（通过 (7) 式体现）。

---

### 4.5 Lemma 5 的随机下采样与 union bound

**原文在做什么**：Lemma 5 通过三个步骤构造所需子图：
1. 以概率 d/d_{0} 独立保留每条边 $\to$ 获得 G̃；
2. 修理低度顶点：对每个 v $\in$ L（度 < (d-2$\varepsilon$)N），从 V(G) \ (L$\cup$ H) 中补到正好 dN 条边；
3. 修理高度顶点：对每个 v $\in$ H（度 > (d+2$\varepsilon$)N），从 V(G) \ (L$\cup$ H) 中删除多余的边；
4. 最后贪心地微调到精确密度 d。

然后证明得到的图是 $\varepsilon'$-super-regular 的。

**为什么要这么做**：
- 直接的随机下采样可能留下低度或高度顶点，而这些顶点会破坏 super-regularity 的度条件。但由于 G 原本是 ($\varepsilon$,$\delta$)-super-regular，原图中每个顶点的度至少 $\delta$ N，所以低度顶点在 L 中只占 O($\varepsilon$) 比例。修边只用 V(G)\(L$\cup$ H) 中的顶点，这些顶点占了 1-O($\varepsilon$) 比例 $\to$ 修边对他们的度的影响是 O($\varepsilon$)N，可以被参数吸收。
- Union bound 的关键在于 Chernoff 给出的概率衰减是 $$\exp(-c\gamma^2 d_0 |X_1'||X_2'|)$$，对 $$|X_i'| \geq \varepsilon N$$，这意味着概率 $\leq$ $$\exp(-c\gamma^2 d_0 \varepsilon^2 N^2)$$。需要用 union bound 覆盖的子集对数量是 $$\binom{N}{\geq \varepsilon N}^2 \leq 2^{2N}$$，而指数衰减的速率是 N^{2} 级的 $\to$ 对于足够大的 N，union bound 通过。

**这一步真正得到什么**：一个稠密且度条件更强的子图，使得 Theorem 6 可以应用。特别地，从 ($\varepsilon$,$\delta$)-super-regular（仅度下界 $\delta$ N）升级到 $\varepsilon'$-super-regular（度在 (d$\pm$$\varepsilon'$)N 之间），密度从任意 d_{0} $\geq$ $\delta$ 降到了指定的 d。

**一个需要进一步检查的技术细节**：在随机下采样后，对 $$|X_1'|, |X_2'| \geq \varepsilon' N$$ 的子集对验证 $\varepsilon'$-regularity。作者说 edge correction 的贡献是 $$O(\varepsilon N)(|X_1'|+|X_2'|)$$，且当 $$|X_1'|, |X_2'| \geq \varepsilon' N = \Theta(\varepsilon^{1/2})N$$ 时，这个量 $\leq$ ($\varepsilon'$/2)|X_1'||X_2'|。这里需要验证 $$O(\varepsilon N) \cdot \max(|X_1'|,|X_2'|) \leq (\varepsilon'/2) |X_1'||X_2'|$$，等价于 $$O(\varepsilon N) \leq (\varepsilon'/2) \min(|X_1'|,|X_2'|) = (\varepsilon'/2) \varepsilon' N = \Theta(\varepsilon N)$$，这确实可以通过调节常数实现。

---

### 4.6 Lemma 15 的计数估计（最密集的技术段落）

**原文在做什么**：Lemma 15 要证明 $\lambda$（由 $\mu$ 诱导的 H$\varphi$ 的分布）满足 Spiro 定理（Theorem 14）所需的条件。核心计算是：

对固定的 $\xi$-good $\varphi'$ 和 H' $\subseteq$  $H \varphi'$，估计 Pr[|E(H') $\cap$ E(H$\varphi$)| = t]。

**第一步**：对固定的 T $\subset$ eq H'（|E(T)| = t），估计 Pr[H$\varphi$ $\cap$ H' = T]。令 c(T) 为 T 的连通分支数，v(T) 为 T 中出现度 $\geq$ 1 的顶点数。对每个连通分支 L，固定一个 "根" vL。用一个 DFS 顺序遍历 L 的顶点：每个新顶点 vj 必然和已排序的某个 vi（i < j）在 T 中相邻。给定 vi 的原像 ui（即 $\varphi$(ui) = vi），vj 的原像 uj 在至多 2k 个候选之中（因为 H$\varphi$ 中的边只连接距离 $\leq$ k 的顶点或异星间对应顶点）。

由 $\varphi$ 的 O(1/n)-vertex-spread 性质：条件于已固定的 v_{1},...,v_{j-1} 的原像，uj 恰好是那个正确原像的概率 $\leq$ C/n。对所有 v(T) - c(T) 个 "非根" 顶点累积（每个连通分支的第一个顶点不需要这个 bound），得到：

Pr[H$\varphi$ $\cap$ H' = 某个特定的 T] $\leq$ n^{c(T)} · C^{v(T)-c(T)} · (C/n)^{v(T)} = (C^{2}/n)^{v(T)} · (n/C)^{c(T)}

**第二步**（应用 Claim 16）：Claim 16 给出对连通分支数 c(T) 满足：
|E(T)| = t $\leq$ (k-1)v(T) - (1+$\gamma$)(k-1)c(T)
$\to$ v(T) $\geq$ t/(k-1) + (1+$\gamma$)c(T)

由此，对每个特定的 T：
(C^{2}/n)^{v(T)} · (n/C)^{c(T)} $\leq$ (C^{2}/n)^{t/(k-1) + (1+$\gamma$)c} · (n/C)^c
= (C^{2}/n)^{t/(k-1)} · (C^{2}/n)^{(1+$\gamma$)c} · (n/C)^c
= (C^{2}/n)^{t/(k-1)} · (C^{1+2$\gamma$} / n^{$\gamma$})^c

**第三步**（union bound over T）：具有 c 个连通分支和 v 个顶点的子图 T 的数量 $\leq$ $$\binom{h}{c} C^v$$ $\leq$ (eh/c)^c C^v。用 v $\leq$ t $\leq$ h（实际上 v $\leq$ t+1），计算：

$$
\begin{aligned}
&$\sum_{c=1}$^t \binom{h}{c} C^{v} $\cdot$ (C^2/n)^{t/(k-1)} $\cdot$ (C^{1+2$\gamma$} / n^$\gamma$)^c \\
&$\leq$ (C^2/n)^{t/(k-1)} $\cdot$ $\sum_{c=1}$^t \left(\frac{eh}{c} $\cdot$ C $\cdot$ \frac{C^{1+2$\gamma$}}{n^$\gamma$}\right)^c \\
&$\leq$ (C^2/n)^{t/(k-1)} $\cdot$ $\sum_{c=1}$^t \left(\frac{C'}{n^$\gamma$}\right)^c
\end{aligned}
$$

**第四步**（t $\geq$ n^{-$\gamma$} 的情况）：对 t $\geq$ n^{-$\gamma$/2}（这个条件具体化为 t $\geq$ hn^{-$\gamma$} 因为 h = O(n)），级数收敛为 O(1)，所以总和 $\leq$ (C'/n)^{t/(k-1)} = q^t，其中 q = C' n^{-1/(k-1)}。

**为什么要这么做**：结合 Claim 16 的 "亏额" bound 是这一切能 work 的核心原因。如果没有这个亏额——如果连通图可以有 v(k-1) 条边而不受惩罚——那么 (C^{2}/n)^{v} · (n/C)^c 就不能被 bound 为足够小的量。亏额 $\gamma$(k-1) 使得每个连通分支贡献一个额外的 (n^{-$\gamma$}) 因子，压过了组合因子 (eh/c)^c 的增长。

**这一步真正得到什么**：Pr[|E(H') $\cap$ E(H$\varphi$)| = t] $\leq$ q^t for q = Θ(n^{-1/(k-1)})，这正是 Spiro 定理（Theorem 14）要求输入分布满足的条件。

**一个值得注意的技术点**：作者用了 Spiro 的结果 [17] 而不是直接引用 Kahn-Kalai 猜想 [15] 的最终形式。区别在于 Spiro 的定理需要的条件比 Kahn-Kalai 弱（它允许一个多层级的 spread 条件，而不仅仅是 "q-spread"），这正是 Lemma 15 所验证的——分布 $\lambda$ 对不同大小的 t 有不同的约束。

---

## 5. 参数和不等式检查

### 5.1 参数层级（Lemma 2 内部）

```
ε ≪ ε′ ≪ ε′′ ≪ β ≪ δ₃ ≪ δ₂ ≪ δ₁ ≪ δ₀ ≪ d, α
```

每个参数的角色：

| 参数 | 角色 | 关键使用处 |
|------|------|-----------|
| $\varepsilon$ | regularity 参数 (G 的) | Lemma 4, 5 的输入 |
| $\varepsilon'$ | (P2) 中允许的坏对比例 | Definition 8, |Aj+1| 估计 |
| $\varepsilon''$ | Claim 9 输出的 regularity 参数 | Claim 9, 10, 11 |
| $\beta$ | |Di| = $\lceil$$\beta$ N$\rceil$，缓冲区大小 | Exceptional step, vertex-spread |
| $\delta_{3}$ | Claim 11 中 |Ui$\ell$| 的下界阈值 | Claim 11 |
| $\delta_{2}$ | Check Lj 的步长 s = $\lceil$$\delta_{2}$N$\rceil$ | Phase I, reordering 控制 |
| $\delta_{1}$ | "低度" 阈值 | Lj 定义, exceptional step |
| $\delta_{0}$ | |Bi| = $\lceil$$\delta_{0}$N$\rceil$，B 的大小 | Phase II 条件 |
| d | 统一密度 (= $\delta$/2) | 所有计算 |
| $\alpha$ | |Wx| $\geq$ $\alpha$ N 的下界 | (P1) 的下界 |

### 5.2 关键不等式链

**(7) 式的推导**：
$$|C_\varphi(x) \setminus \varphi(X_j)| \geq (d - \varepsilon)^{\Delta+1} \delta_1 N - 2s \gg \delta_2 N$$

这个推导的内在逻辑：
1. 如果 x $\notin$ Lj 且 j $\in$ sZ，则 |C$\varphi$(x) \ $\varphi$(Xj)| $\geq$ $\delta_{1}$N（直接来自 Lj 定义）；
2. 经过 s 步后，如果 x 在这 s 步中有 d_{1} 个新嵌入的邻域，每个邻域的嵌入至多把 |C$\varphi$(x)| 缩小因子 (d-$\varepsilon$)（这是 (P1) 的最坏情况分析——实际上可能更好，因为我们取了 Aj+1 中满足条件 (i) 的顶点）；
3. 所以 |C$\varphi$(x) \ $\varphi$(Xj+s)| $\geq$ (d-$\varepsilon$)^{d_{1}} $\delta_{1}$N - s（减 s 是因为至多 s 个顶点被重排到前面并被嵌入，这些可能不是原始 Xj+s 的计算结果中最优的）；
4. 如果 x $\in$ Lj+s，则 x 在下一 s 步内被嵌入，类似的计算给出累积损失 $\leq$ (d-$\varepsilon$)^{d_{1}+d_{2}}$\delta_{1}$N - 2s；
5. 在最坏情况 d_{1} + d_{2} $\leq$ $\Delta$ + 1，得到最终下界。

**Claim 11 中 (6) 式的合理性**：
```
(1/δ₂) · r(Δ+1)δ₃N + |W| + |NH(D)| = O(δ₃/δ₂)N ≪ δ₀N
```
需要：|W| $\leq$ $\beta$ N $\ll$ $\delta_{0}$N（因为 $\beta$ $\ll$ $\delta_{0}$），|NH(D)| $\leq$ r·$\Delta$·|D|/r $\leq$ $\Delta$·$\beta$ N $\ll$ $\delta_{0}$N（两点距离 $\geq$ 4 不能保证 NH(D) 的大小 bound，但这由 H 的最大度 $\Delta$ 和 |D| $\leq$ r$\beta$ N 保证）。确实 NH(D) 的大小 $\leq$ $\Delta$|D| $\leq$ r$\Delta$$\beta$ N，所以 O($\delta_{3}$/$\delta_{2}$ + r$\Delta$$\beta$ + $\beta$) $\ll$ $\delta_{0}$ 由参数链保证。

**|Aj+1| 下界中的 Markov 不等式**：
设随机变量 X = 被破坏的 pair 数（从 P 中）。E[X] $\leq$ $\varepsilon$|P|。由 Markov:
$$Pr[X > (2(\Delta+1)/\varepsilon') \varepsilon |P|] \leq \varepsilon'/(2(\Delta+1))$$
意味着至多 $\varepsilon'$N 个新的 pair 不再满足 (P2)（需要验证 |P| $\leq$ 2($\Delta$+1)N 的 bound：P 是至少包含一个 NH(x_{j+1}) 中顶点的满足 (2) 的 pair，|NH(x_{j+1})| $\leq$ $\Delta$+1，所以 |P| $\leq$ ($\Delta$+1)N + ($\Delta$+1)N = 2($\Delta$+1)N，合理）。

**Lemma 15 中 t $\geq$ hn^{-$\gamma$} 条件的角色**：
这个条件确保 $$\sum_c (C'/n^\gamma)^c$$ 收敛——因为 n^$\gamma$ $\to$ $\in$ fty 当 n $\to$ $\in$ fty，所以 $$C'/n^\gamma < 1$$，级数和为 O(1)。如果 t 太小，级数可能发散。作者取 $\ell$ = 1/$\gamma$ 和 ri = n^{1-i$\gamma$} 来满足 Theorem 14 的要求。

---

## 6. 证明中的核心想法

### 最关键的构造

**S-quasirandom embedding（Definition 8）**。这不是 classical quasirandomness，而是专门为这个 proof 设计的一个归纳不变式。它的巧妙之处在于：

- (P1) 是度条件的 "乘法版本"——随着更多邻域被嵌入，候选集以因子 $\approx$ d 缩小；
- (P2) 是独立性条件——大多数顶点对的候选集的行为像独立集合的交。

这个定义正好卡在 "够强以推出 regularity" 和 "够弱以在贪心嵌入过程中维持" 的交界处。

### 最关键的转化

**Claim 9：S-quasirandom $\to$ $\varepsilon''$-regular 辅助图**。这是代数性质（l_{2} 矩）到组合性质（regularity）的翻译。整个证明的 backbone 就是：保证 S-quasirandom $\to$ 辅助图 regular $\to$ 各种估计 work。

### 最关键的估计

**|Aj+1| $\gg$ $\delta_{2}$N**。这个下界同时服务于两个目的：
1. 算法正确性（Aj+1 $\neq$ $\emptyset$，算法不卡住）；
2. Vertex-spread 性质（候选越大 $\to$ 分布越 spread）。

三个误差项（C$\varphi$ 本身不够大、条件 (i) 违规、条件 (ii) 违规）各自只排除 O($\varepsilon'$)N 个顶点，而 C$\varphi$ 本身 $\gg$ $\delta_{2}$N，所以扣除后仍然大。

### 作者绕过困难的方式

**困难 1**：Classical blow-up lemma 只保证存在性，不保证分布 spread。

**绕过方式**：用算法化版本 [11] 的框架——每一步贪心选择时，候选集很大（|Aj+1| $\gg$ $\delta_{2}$N），所以均匀随机选择就是 spread 的。

**困难 2**：B 中顶点的嵌入。Phase I 是贪心的——如果 B 也在 Phase I 中被嵌入，到最后几个顶点时候选集可能很小，破坏 spread 性。

**绕过方式**：把 B 留到最后，用 Pham–Sah–Sawhney–Simkin 的 spread PM 结果全局处理。B 的设计（彼此距离 $\geq$ 4、度精确为 $\Delta$）确保 B 的剩余二分图满足 Lemma 7 的条件。

**困难 3**：某些顶点可能对 B 的覆盖不足（Ei），破坏 Phase II 的最小度条件。

**绕过方式**：Exceptional step。在恰好嵌入 NH(B) 之后，检查覆盖情况。不足的顶点被映射到 D（缓冲区），从而从 embedding pool 中排除。

**困难 4**：在 Lemma 15 中，直接的 spread bound 给出 $$(C/n)^{v(T)}$$，但这不足以压过组合计数 $$\binom{h}{c}$$。

**绕过方式**：Claim 16 证明了结构的 "亏额"——T 中每个连通分支严格少于 $$v(k-1)$$ 条边，亏额 $$(1+\gamma)(k-1)$$ 提供了额外的衰减因子 $$n^{-\gamma c}$$，刚好压过组合增长。

### 这个证明和常规方法相比，真正新在哪里

1. **Spread 版本的 blow-up lemma 本身是新的**。以前没有 spread 版本的 blow-up lemma。证明的关键创新是把 Pham–Sah–Sawhney–Simkin 的 spread perfect matching 技术和 Komlós–Sárközy–Szémeredi 的算法化 blow-up 技术融合在一起。

2. **S-quasirandom 作为归纳不变式的用法**。本质上是一个 "在线"（online）版本的正则性——在算法进行过程中，每一步都需要验证剩余图仍然是 "正则的"。

3. **证明的模块化**：Phase I 的贪心部分保证了 spread 性（因为每步候选大），而 Phase II 的全局部分保证了完成性（用 spread PM 处理剩余顶点）。这种 "贪心 + 全局收尾" 的结构是一个值得学习的 pattern。

4. **在应用中**（Theorem 3），将分割和控制与 spread 技术结合：用 Lemma 12 把 reduced graph 分解成 stars $\to$ 对每个 star 构造一个 spread 嵌入 $\to$ 用 Spiro 的弱化版 Kahn-Kalai 定理完成概率下界。这个流程比以前只用 regularity + blow-up 的方法更灵活，因为 spread 性质允许在最后的随机步骤中以接近最优的阈值 p 完成结构。

---

## 附录：后续可以进一步检查的问题

1. **Claim 16 亏额的详细验证**：作者只给了一个上界表达式然后断言 $\leq$ v(T)(k-1) - (1+$\gamma$)(k-1) 对 k $\geq$ 3 成立。具体 $\gamma$ 依赖于 k 以及边界顶点的度亏额的计算，值得展开验算。

2. **Lemma 5 中 union bound 的细节**：Chernoff + union bound 覆盖所有大子集对的论证需要验证概率指数衰减速率确实足够快。虽然这是 regularity 文献中的标准技术，但在 $\varepsilon'$ = O($\varepsilon^{1/2}$) 的参数关系下需要确认。

3. **Theorem 14 (Spiro) 的条件与 Lemma 15 输出的精确匹配**：Lemma 15 验证了对每对 (t, h) 有 Pr[|H' $\cap$ H$\varphi$| = t] $\leq$ q^t。但 Spiro 定理要求对整数 r_{1} > r_{2} > ... > r_$\ell$ 和任意 A $\subset$ eq X 满足 |A| $\geq$ t $\geq$ r_{i+1} 时有 bounds。Lemma 15 的 format 和这个要求之间的精确转化需要进一步确认。

4. **Phase I 结束时 B'i 和 Fi 的 balancedness**：算法声称 |Fi| = |B'i|，但这需要验证——因为 D 中的一些顶点可能被消耗，而 Phase I 中涉及 D 的嵌入方式可能不保持精确的一一对应。这依赖于 B 和 D 的精确选择和大小匹配。

5. **Exceptional step 后 maintaining S-quasirandom**：作者声称嵌入 D 的任意子集保持 (P1)（因为 D 与 NH(B) 无边），且 (P2) 不涉及 NH(D)。需要验证更新后的 $\varphi$（在增加了 D 中已嵌入的顶点后）确实满足 Definition 8 的所有条件——特别是对于 x $\in$ NH(D)（如果存在的话）的 C$\varphi$(x) 的 bound。
