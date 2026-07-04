---
title: 笔记管理指南
date: 2026-06-09
tags:
category: 系统
---

# 笔记管理指南

## 核心原则

**笔记是为未来的你服务的，不是为现在的 Claude 服务的。** 宁可少写，写了的就要能信。

---

## 1. 笔记信任等级（替代"未检查"）

`未检查` 标签太模糊了——50 篇论文里 30 篇都标了 `未检查`，你就不知道该先看哪篇。换成三个等级：

| 标签 | 含义 | 谁写的 |
|---|---|---|
| `ai_draft` | Claude 生成的初稿，**内容未验证**。定理可能写错，证明可能胡编 | Claude |
| `已读-未整理` | 你读过论文了，笔记内容可信，但格式/深度还没打磨 | 你+Claude |
| （无特殊标签） | 内容已验证，可以放心引用 | 你 |

**使用规则**：
- Claude 新写的笔记一律标 `ai_draft`
- 你读完论文、确认内容正确后，把 `ai_draft` 删掉，换成 `已读-未整理`（如果还想后续打磨）或什么都不加（如果已经够好）
- 引用任何标了 `ai_draft` 的笔记之前，必须先验证

当前所有标 `未检查` 的笔记，建议批量改为 `ai_draft`。

---

## 2. 论文笔记的三层深度

不需要每篇都写成 Lang-Muyesser 模板那样。按需求分三层：

| 层级 | 内容 | 何时使用 |
|---|---|---|
| **L1: 骨架** | frontmatter + `[!summary]` 一句话 + 主定理 | 扫 arXiv 时快速记录，以后未必会读 |
| **L2: 标准** | L1 + 证明路线 + 关键技术点 + 与你的关联 | 跟你的方向相关，可能以后会引用 |
| **L3: 深读** | L2 + 逐章节分析 + 可追踪问题 + 日记 | 你正在用的核心论文 |

**当前问题**：很多笔记是 L3 深度但是 `ai_draft`——Claude 硬写的，你根本没验证。**L3 只有在你亲自读过论文之后才应该有。**

---

## 3. 精简 theorems-tools-methods

这个文件夹里应该只放**你真的在多个地方引用过的工具**。当前 ~20 条太多了。

**该留的**（你确实在用的）：
- Absorbing method / Distributive absorption method
- Extendable method / Roll-back
- Parity-switcher
- Posa rotation
- Reserved connector theorem
- Sorting network
- Robust expander
- 概率工具（Chernoff, Janson, LLL）

**该删或合并的**：单篇论文的引理（如 Friedman's second eigenvalue、Size-Ramsey number）。这些概念在对应的论文笔记里写清楚就够了，不需要独立文件。

**新增规则**：在想新建一条 theorems-tools-methods 之前，问自己——"我过去一个月里引用这个概念超过一次吗？"如果答案是否定的，写在论文笔记里就行。

---

## 4. 标签系统

当前标签太多了，建议收敛到几个核心维度：

**方法标签**（你最核心的几个）：
`absorbing_method` `roll_back` `extendability` `posa_rotation` `parity_switcher` `connector_reservation` `sorting_network` `spread` `regularity_lemma`

**对象标签**：
`Hamilton` `spanning_trees` `expanders` `pseudorandom_graphs` `random_graphs` `hypergraphs`

**状态标签**：
`ai_draft` `已读-未整理`

**不要**给每篇论文打 10 个标签。3-5 个最核心的就够了。标签的作用是以后能 Dataview 筛选，不是分类学。

---

## 5. 日常流程

### 读 arXiv 报告时
1. 看报告，勾出你真正想读的（通常 2-5 篇）
2. Claude 已经帮你下了 PDF

### 读论文时
1. 读完一篇，如果笔记是 `ai_draft`，验证关键定理陈述
2. 错了就改，对了就去掉 `ai_draft` 标签
3. 如果你想深入，在笔记末尾的 `## 日记` 区域写几行想法

### 做研究时
1. 需要引用某定理 → 先在 `theorems-tools-methods` 里搜，没有的话在对应论文笔记里找
2. 有新想法 → 写到 `日记/` 或对应 problem 的 working note 里
3. 不要边做研究边整理笔记——研究完了再回头清理

---

## 6. Dataview 自动化（减少维护成本）

你装了 Dataview 插件，可以用来动态生成列表，不需要手动维护索引。几个有用的查询：

**待验证的 AI 草稿**：
```dataview
LIST FROM "papers" WHERE contains(tags, "ai_draft")
```

**所有包含某方法的论文**（不用手动建索引）：
```dataview
LIST FROM "papers" WHERE contains(tags, "parity_switcher")
```

**最近未读的论文**：
```dataview
LIST FROM "papers" WHERE contains(tags, "ai_draft") SORT file.mtime DESC
```

这样你就不用手动维护任何索引文件——标签就是索引。

---

## 7. 当前待清理项（优先级排序）

1. **批量重命名 tag**：`未检查` → `ai_draft`（所有 Claude 写的笔记）
2. **删掉 `theorems-tools-methods/` 里你不会复用的条目**（至少删掉一半）
3. **`_tmp-paper-notes/` 里的东西要么移走要么删掉**（这个文件夹应该始终接近空的）
4. **每篇 `ai_draft` 笔记**：要么读一遍然后去标签，要么就接受它是草稿状态。不要长期停留在"未检查"——那等于既不信它又留着它


