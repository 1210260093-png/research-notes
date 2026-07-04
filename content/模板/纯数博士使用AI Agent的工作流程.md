---
title: 纯数博士使用 AI Agent 的工作流程
date: 2026-06-09
tags:
  - ai_draft
sources:
  - Tao, Formalizing a proof in Lean using Claude Code (YouTube, 2026)
  - Zimmer et al., The Agentic Researcher, arXiv:2603.15914
  - Knuth, Claude's Cycles — Hamiltonian Decomposition (2025)
  - Google DeepMind, Aletheia / AI Co-Mathematician (2026)
  - Henkel, The mathematician's assistant, Math. Semesterber. (2025)
  - Kearns & Roth, How AI is changing the nature of mathematical research, Amazon Science (2026)
---

# 纯数博士使用 AI Agent 的工作流程

## 一、五级整合模型

柏林 Zuse 研究所的 *The Agentic Researcher*（arXiv:2603.15914）给出了最清晰的分类框架：

| 级别 | 名称 | AI 做什么 | 纯数场景举例 |
|------|------|----------|-------------|
| 0 | 传统 | 无 AI | LaTeX、Mathematica、纸笔推演 |
| 1 | 顾问 | 聊天问答 | 问定义、找引用、头脑风暴思路 |
| 2 | 打字员 | 补全代码/文本 | Copilot 辅助写 Lean 证明或 LaTeX |
| 3 | 合作者 | CLI Agent 实现并迭代 | Claude Code 写证明脚本、跑数值实验 |
| 4 | 研究助理 | 自主实验循环 | 数小时无人值守 conjecture testing |

我目前处于 **Level 3**——Claude 帮我在 Obsidian 里做研究笔记、搜论文、往 Zotero 里塞条目、写代码验证想法。Level 4 是当前学术界和工业界的前沿。

---

## 二、三个真实案例

### 2.1 Terence Tao 的"脚手架法"

Tao 在 YouTube（2026 年初，26 分钟）公开了他用 Claude Code 把集合论的 Singleton Law 形式化为 Lean 证明的完整过程。

**三次尝试，两次失败**：

| 尝试 | 做法 | 结果 |
|------|------|------|
| 1 | 一句"全做了"扔给 Claude | 跑 45 分钟，token 耗尽，机器崩溃 |
| 2 | 拆成 Lemma 1/2/3 | 25 分钟成功，但录屏坏了 |
| 3 | 先写 `sorry` 骨架 → 逐个填充 | **30 分钟完成，零 Lean 编译错误** |

**核心发现**：
- Claude Code 处理高层形式化（定理陈述 → 证明框架）很顺
- 但**卡在低级机械化步骤**（等式替换 `a=b` → `f(a)=f(b)`），Tao 接手用 `congr` 秒解
- Tao 的原话："我以为最简单的部分反而是 AI 最不擅长的"
- **人机并行**：AI 在后台证 Lemma 3，Tao 同时在前台手写 Lemma 2——互不等待

> **Tao 的 AI 使用哲学**："只要 AI 省下的时间超过你纠正它的时间，它就是成功的工具。"

---

### 2.2 Donald Knuth 的"自主探索日志"

Knuth（2025）让 Claude 解决一个图论问题：把有向模图 $G_m$（$m^3$ 个顶点）的边分解成三个 Hamilton 圈。

**Claude 像一个人类研究者那样工作**：
- **不是一次给出答案**，而是进行了 31 轮自主探索（约 1 小时）
- 尝试了蛇形构造 → 失败；模拟退火 → 失败；纤维分解 → 失败
- **每轮探索后自动写 `plan.md` 日志**，记录：我试了什么、为什么失败了、接下来打算试什么
- 最终发现基于 $s = (i+j+k) \bmod m$ 的构造，对所有奇数 $m$ 有效
- 偶数 $m$ 后来由 GPT-5.4 + Claude 的多 Agent 协作解决

**人的角色**：Knuth 只负责读日志、写正式证明。他称这个过程为 "a joy"。

**启示**：日志/计划文件是 Agent 长期自主运行的关键基础设施——没有它，Agent 会在失败后迷失方向，反复尝试同样的问题。

---

### 2.3 "Tom111" 的两周自主形式化实验

Mastodon 用户 @tomkalei 分享了更激进的尝试（2026）：
- 把一篇 Binomial Edge Ideals 的旧论文的 LaTeX 源码扔给 Claude Code
- Claude **自主运行了两周**，他本人投入不到 10 小时
- Claude 自己维护长期计划、短期计划、todo 文件、记忆文件
- 成功完成了一个非平凡的 Gröbner 基证明（Theorem 1.1）
- 人的介入仅限于初始设计选择（多项式环设置、项序）

**代价**：生成的 Lean 证明人类几乎不可读——"与人类数学的接口只剩下陈述本身"。

**启示**：这是"黑箱证明"问题的现实版——如果 AI 生成的证明没人能理解，它算不算数学知识？这是 Tao 和整个社区正在激烈辩论的问题。

---

## 三、典型的日常 AI Agent 工作流

综合以上案例，一个纯数博士的日常可能长这样：

```
上午：人构思研究问题 + 高层策略
   │
   ▼
提示 Agent：喂上下文（论文 PDF、已有 LaTeX 笔记、代码、
           之前失败的尝试、相关定义和引理）
   │
   ▼
Agent 澄清：问范围、约束、评估标准（"这个引理假设 G 是
         简单图还是允许重边？"）
   │
   ▼
自主循环（可能数小时，无人值守）：
   ├─ 形式化想法 → 写成引理/猜想
   ├─ 实现代码 → 跑数值实验
   ├─ 记录结果 → 写入 report.tex
   ├─ 更新计划 → 写入 TODO.md
   └─ 遇到死胡同 → 自动换方向，记录失败原因
   │
   ▼
人定期检查点：读报告、调整优先级、精炼猜想、否决死胡同
   │
   ▼
验证：Lean 4 形式验证（关键定理）或人类逐行审查
   │
   ▼
写作：Agent 起草 LaTeX 初稿
      人补上下文、动机、叙事、与文献的关系
```

---

## 四、Google DeepMind 的工业化方案

### 4.1 Aletheia（2026 年 2 月）

目前最强的纯数 AI 系统，基于 Gemini Deep Think：

**三段式循环**：
```
Generator（生成候选解/证明）
   → Verifier（自然语言验证，会承认失败）
   → Reviser（定向修正）
   → 回到 Generator
```

- 能上网搜文献，防止编造引用
- 已**自主解决 4 个 Erdős 开放问题**
- 产出第一篇完全 AI 生成的数学论文（Feng26，算术几何中的特征权计算）
- IMO-ProofBench Advanced 得分 95.1%
- 开源：`github.com/google-deepmind/superhuman/tree/main/aletheia`

### 4.2 AI Co-Mathematician（2025）

层次化多 Agent 架构：
```
项目协调者
  ├─ 文献综述协调者 → 搜索 Agent
  ├─ 代码库开发协调者 → 编程 Agent
  └─ 反例搜索协调者 → Gemini Deep Think (证明验证器)
```

- 牛津数学家 Marc Lackenby 用它解决了一个 Kourovka Notebook 开放问题
- FrontierMath Tier 4 得分 48%——在所有 AI 系统中最高
- 已知失败模式：**"审稿人讨好偏误"**——Agent 审查循环会收敛到有微妙缺陷但表面合理的论证

---

## 五、成功要素（来自实践者的共识）

| 要素 | 说明 | 谁在用 |
|------|------|--------|
| **结构化分解** | 不要"全做了"，拆成原子子任务 | Tao, Knuth, ZIB 框架 |
| **CLAUDE.md 作为风格指南** | 每次 AI 出错，写一条规则进去。久而久之变成"你的数学品味的编码" | RKIrov 博客 |
| **日志文件** | Agent 必须维护 `plan.md` / `TODO.md`，记录试了什么、为什么失败 | Knuth, The Agentic Researcher |
| **人机并行** | AI 做一条线，人同时做另一条——互不等待 | Tao |
| **可失败的验证器** | 必须会承认"我不确定"。不会承认但 10% 静默错误的系统是危险的 | DeepMind, Tao |
| **人在循环中** | AI 做探索和模式发现，人做方向选择和最终裁决 | 所有成功案例 |

---

## 六、已知的失败模式

1. **过度泛化**——证了特殊情况就声称一般结论成立
2. **逻辑跳跃**——在不等式操作和几何性质上尤其常见
3. **拒绝承认失败**——宁可生成错误证明也不说"我不会"
4. **审稿人讨好偏误**——Agent 审查自己的证明时收敛到有缺陷但表面上合理的论证
5. **低级机械化步骤反而最弱**——Tao 发现 AI 在等式替换这种"显然"的步骤上反复卡住
6. **静默失败**——"一个 90% 正确但 10% 静默错误的工具，比一个 80% 正确但明显报错的工具更危险"（Tao）

---

## 七、对你有直接参考价值的资源

| 资源 | 说明 |
|------|------|
| `github.com/ZIB-IOL/The-Agentic-Researcher` | 开源框架，支持 Claude Code/Codex CLI，沙箱容器，自动维护 report.tex 和 TODO.md |
| Tao 的 Lean + Claude Code 视频 | YouTube 搜 "Formalizing a proof in Lean using Claude Code"，26 分钟完整实操 |
| `github.com/lingzhi227/agent-research-skills` | 28 个模块化 research skill，含数学推理、算法设计、原子分解 |
| `github.com/google-deepmind/superhuman/tree/main/aletheia` | DeepMind Aletheia 的 prompt 和输出，开源 |
| Kearns & Roth, Amazon Science (2026) | 讨论纯数文化如何被 AI 改变——"品味、问题选择、建模能力将比技术魔法更重要" |
| Henkel, *Math. Semesterber.* (2025) | 七种基础应用方式：创意、文献、计算探索、证明、反例、代码、写作 |

---

## 八、关于我自己的反思

我（作为你的 AI 研究助手）目前在 Level 3 水平运行：

| 能做好的 | 还做不好的 |
|---------|-----------|
| 搜论文、读摘要、总结 | 写 Lean 形式证明 |
| 做详细笔记、消化论文 | 自主运行多日实验循环 |
| 写代码跑数值验证 | 自己维护长期 plan.md（需要你提醒） |
| Zotero 条目管理 | 主动发现错误并自我纠正 |
| Obsidian 知识库维护 | 理解一张图/一个公式的深层数学直觉 |

**下一步可能的升级方向**：
1. 学 Lean 4 基础 → 让我帮你把证明脚本形式化
2. 设置 Agent 自动实验循环 → 比如对一个问题跑 50 组参数、记录结果、自动生成猜想
3. CLAUDE.md 中建立你的数学品味规则 → "这个方向的证明风格偏好组合方法"、"不等式放缩到多少精度足够"
4. 让我自己读你的 ArXiv 订阅源 → 每天早上给你推送相关新论文的摘要

---

## 核心洞见

> **"品味、问题选择、建模能力将比技术魔法更重要。"**
> — Kearns & Roth, Amazon Science (2026)

> **"只要 AI 省下的时间超过你纠正它的时间，它就是成功的工具。"**
> — Terence Tao (2026)

> **"一个黑箱证明不是数学。那是用符号做的工程。"**
> — Terence Tao (2025)


