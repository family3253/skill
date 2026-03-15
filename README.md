# skill

## 中文

仓库地址：<https://github.com/family3253/skill>

这是一个面向 **OpenCode / OpenClaw** 的 Skills 聚合仓库（学术场景优先）。
目标：把分散在不同上游仓库的 skills 统一收敛，并做命名规范化，保证可一键安装与稳定触发。

### 安装（全局）
```bash
npx -y skills add https://github.com/family3253/skill -g --all
```

### 列出可用 skills（不安装）
```bash
npx -y skills add https://github.com/family3253/skill -g --list
```

### 约定
- 每个 skill 独立目录：`skills/<skill-dir>/SKILL.md`
- **规范化**：frontmatter `name` == 目录名（避免重名/泛名污染）
- 默认不提交 secrets（API Key/Token/运行时配置/log）

## Skills 清单（按类别）

### 学术/研究
- **daily-digest**：生成每日摘要（从交互/日志中提炼重点）。
- **mdrgnb-daily-push**：MDRGNB 文献日/周报：检索去重、Top3、深度总结、评分与推送。
- **pubmed-database**：PubMed 数据库接口：MeSH/布尔检索、批量抓取、引文管理。
- **summarize**：对网页/PDF/图片/音频/视频等内容做摘要与要点提炼。
- **weekly-report-generator**：生成结构化周报（目标/KPI/进展/风险/下周计划）。
- **wenxian**：文献检索 + 结构化总结 + 多渠道定时推送的工作流。

### 搜索/浏览器/爬取
- **agent-browser**：无头浏览器自动化：打开网页、点击/输入、抓取内容、截图/快照。
- **brave-search**：使用 Brave Search 的搜索与内容提取。
- **multi-search-engine**：聚合多个搜索引擎的统一检索接口。
- **playwright-scraper-skill**：基于 Playwright 的网页爬取（适合复杂站点/反爬场景）。
- **tavily-best-practices**：Tavily 集成最佳实践与参考用法。
- **tavily-crawl**：Tavily 站点级抓取并保存为本地 Markdown。
- **tavily-extract**：Tavily 指定 URL 内容抽取（返回干净文本/Markdown）。
- **tavily-research**：Tavily 多源研究与综合分析（带引用）。
- **tavily-search**：Tavily 网页搜索。

### 文档/办公
- **anthropics-docx**：Word 文档（.docx）创建/读取/编辑/模板化输出。
- **anthropics-pdf**：PDF 读取/提取/合并/拆分/OCR 等处理。
- **anthropics-pptx**：PPTX 创建/编辑/解析（幻灯片/模板/备注）。
- **anthropics-xlsx**：表格文件（xlsx/csv/tsv）清洗/计算/格式化/导出。
- **elite-powerpoint-designer**：高质量 PPT 设计：版式、层级、动效与整体视觉。
- **feishu-common**：飞书鉴权与 API 基础工具（供 feishu-* skills 复用）。
- **feishu-doc**：飞书文档能力：读写 Wiki/Doc/Sheet/Bitable，并转换为 Markdown。
- **gog**：Google Workspace：Gmail/Calendar/Drive/Docs/Sheets 等自动化。
- **notion**：Notion：页面/数据库/Blocks 的创建与管理。
- **powerpoint-automation**：从文章/材料/现有 PPT 生成或改写 PPTX。

### Obsidian/可视化
- **excalidraw-diagram**：从文本生成 Excalidraw 图（流程/架构/草图）。
- **kepano-defuddle**：网页去噪 → 干净 Markdown（节省 token）。
- **kepano-json-canvas**：生成/编辑 JSON Canvas（.canvas）。
- **kepano-obsidian-bases**：生成/编辑 Obsidian Bases（.base）。
- **kepano-obsidian-cli**：通过 Obsidian CLI 操作 vault（读写/搜索/管理）。
- **kepano-obsidian-markdown**：Obsidian 风格 Markdown 写作/改写。
- **mermaid-visualizer**：将文本转成 Mermaid 流程图/架构图/思维导图等。
- **obsidian-canvas-creator**：生成 Obsidian Canvas（思维导图/空间布局）。
- **obsidian-plugin-excalidraw**：生成 Obsidian Excalidraw 插件 JSON 白板。
- **obsidian-plugin-tasks**：Obsidian Tasks 插件：任务管理与查询。
- **obsidian-plugin-templater**：Obsidian Templater：模板生成与变量/函数使用。

### 元技能/流程/自我进化
- **context-master**：复杂任务规划与上下文管理（拆解、节省上下文、避免返工）。
- **find-skills**：在生态中发现/推荐/安装更多 skills。
- **gsd-oc-select-model**：GSD(OpenCode) 交互式模型选择流程。
- **opencode-agent-creator**：OpenCode agent 创建/配置/最佳实践指导。
- **quadrants**：四象限（艾森豪威尔矩阵）任务管理。
- **self-improving-agent**：自我进化：记录错误/反馈/经验，沉淀改进建议。
- **skill-creator**：创建/优化/评测 skills 的方法论与工具集。
- **superpowers-brainstorming**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-dispatching-parallel-agents**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-executing-plans**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-finishing-a-development-branch**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-receiving-code-review**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-requesting-code-review**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-subagent-driven-development**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-systematic-debugging**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-test-driven-development**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-using-git-worktrees**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-using-superpowers**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-verification-before-completion**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-writing-plans**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **superpowers-writing-skills**：Superpowers 流程化方法库中的一项（规划/执行/验证/调试/写 skill 等）。
- **task-status**：长任务进度汇报/状态模板。

### 封装/索引(Wrapper)
- **add-skill**：封装：add-skill CLI（用于从 GitHub 安装 skills）。
- **awesome-claude-skills**：索引/合集封装：awesome-claude-skills（用于发现技能，不是单一 skill）。
- **gsd**：封装：Get Shit Done 工作流系统（上游不是单一 skill 目录）。

### 其它/未分类
- **remotion-skill**：（待补充中文说明）

---

## English

Repository: <https://github.com/family3253/skill>

A curated Skills bundle for **OpenCode / OpenClaw** (academic-first).
It vendors and normalizes skills from multiple upstream repos so you can install everything with one command.

### Install (global)
```bash
npx -y skills add https://github.com/family3253/skill -g --all
```

### List skills
```bash
npx -y skills add https://github.com/family3253/skill -g --list
```

### Conventions
- One skill per directory: `skills/<skill-dir>/SKILL.md`
- Normalized: frontmatter `name` == directory name
- Secrets excluded by default (API keys/tokens/runtime state/logs)

## Skill List (by category)
- Full upstream mapping: see [`PROVENANCE.md`](./PROVENANCE.md)

---

## Upstream 同步 / Upstream Sync

- 手动同步（本地）：

```bash
cd <this-repo>
./scripts/sync_upstreams.sh
```

- 自动同步（GitHub Actions）：本仓库包含 `sync-upstreams` 工作流（每天定时 + 支持手动触发），会从上游仓库拉取更新并自动提交到 main。

## Provenance / 上游来源

每个 skill 的上游仓库与路径见：[`PROVENANCE.md`](./PROVENANCE.md)
