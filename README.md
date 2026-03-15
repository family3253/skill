# skill

## 中文说明

仓库地址：<https://github.com/family3253/skill>

这是一个面向 **OpenCode / OpenClaw** 的 Skills 聚合仓库（学术场景优先）。
目标：把分散在不同上游仓库的 skills 统一收敛，做到「一条命令安装整套」。

### 一条命令安装（全局）

```bash
npx -y skills add https://github.com/family3253/skill -g --all
```

### 只查看可用 skills（不安装）

```bash
npx -y skills add https://github.com/family3253/skill -g --list
```

### 目录约定
- 每个 skill 独立目录：`skills/<skill-dir>/SKILL.md`（必须存在）
- 规范化：`SKILL.md` frontmatter 的 `name` 与目录名一致（避免重名与触发污染）
- 默认不提交 secrets（API Key/Token/运行时配置与日志都排除）

### Skill 清单（按类别）

#### 学术/研究
- **daily-digest**：Generate a daily digest from memory and interactions.
- **mdrgnb-daily-push**：固化 MDRGNB 文献日/周报流程（当天新发表检索、去重、Top3、10问总结、评分、推送）。
- **pubmed-database**：PubMed E-utilities/REST 高级检索、批处理与引文管理。
- **summarize**：对 URL/PDF/图片/音频/YouTube 等做摘要。
- **weekly-report-generator**：结构化周报生成（KPI/进展/风险/下周计划）。
- **wenxian**：文献检索 + 结构化总结 + 多渠道定时推送工作流。

#### 搜索/浏览器/爬取
- **agent-browser**：无头浏览器自动化（导航/点击/输入/快照）。
- **brave-search**：Brave Search API 搜索与内容提取。
- **multi-search-engine**：多搜索引擎聚合检索。
- **playwright-scraper-skill**：Playwright 爬取（含反爬能力）。
- **tavily-search**：Tavily 搜索。
- **tavily-extract**：Tavily 单页内容抽取。
- **tavily-research**：Tavily 多源研究与综合（含引用）。
- **tavily-crawl**：Tavily 站点爬取并保存为本地 markdown。
- **tavily-best-practices**：Tavily 集成最佳实践参考。

#### 文档/办公
- **anthropics-docx**：Word（.docx）读写/生成/编辑。
- **anthropics-pdf**：PDF 读取/提取/合并/拆分/OCR 等。
- **anthropics-pptx**：PPTX 生成/编辑/解析。
- **anthropics-xlsx**：表格（xlsx/csv/tsv）处理。
- **anthropics-skill-creator**：创建/优化/评测 skills 的方法论。
- **feishu-common**：Feishu 鉴权与 API helper（供 feishu-* skills 复用）。
- **feishu-doc**：读取/写入飞书 Wiki/Doc/Sheet/Bitable。
- **gog**：Google Workspace（Gmail/Calendar/Drive/Docs/Sheets）。
- **notion**：Notion 页面/数据库/Blocks 管理。

#### Obsidian/可视化
- **excalidraw-diagram**：生成 Excalidraw 图。
- **mermaid-visualizer**：将文本转 Mermaid 图。
- **obsidian-canvas-creator**：生成 Obsidian Canvas。
- **kepano-defuddle**：网页转干净 markdown（省 token）。
- **kepano-json-canvas**：JSON Canvas 文件生成/编辑。
- **kepano-obsidian-bases**：Obsidian Bases 文件生成/编辑。
- **kepano-obsidian-cli**：通过 Obsidian CLI 操作 vault。
- **kepano-obsidian-markdown**：Obsidian 风格 Markdown 写作。
- **obsidian-plugin-excalidraw**：生成 Obsidian Excalidraw 插件 JSON。
- **obsidian-plugin-tasks**：Tasks 插件任务查询/管理。
- **obsidian-plugin-templater**：Templater 模板生成/编辑。

#### 元技能/流程/自我进化
- **context-master**：复杂任务的规划/拆解/上下文管理。
- **find-skills**：在生态中搜索/安装更多 skills。
- **gsd-oc-select-model**：GSD(OpenCode) 交互式模型选择流程。
- **opencode-agent-creator**：OpenCode agent 创建/配置指导。
- **powerpoint-automation**：从文章/材料生成 PPT。
- **elite-powerpoint-designer**：高质量 PPT 设计与排版。
- **quadrants**：四象限任务管理。
- **task-status**：长任务进度汇报模板。
- **self-improving-agent**：记录错误/反馈/经验，持续改进。
- **superpowers-*（一组）**：规划/执行/验证/调试/写 skill 的流程化方法库。

#### 封装/索引(Wrapper)
- **add-skill**：add-skill CLI 的 wrapper（用于从 GitHub 安装 skills）。
- **gsd**：Get Shit Done 工作流系统的 wrapper。
- **find-skills-upstream**：find-skills 的上游镜像版本（用于比对/追溯）。

---

## English

Repository: <https://github.com/family3253/skill>

A curated **Skills bundle** for **OpenCode / OpenClaw** (academic-first).
It vendors and normalizes skills from multiple upstream repos so you can install everything with one command.

### Install (global)

```bash
npx -y skills add https://github.com/family3253/skill -g --all
```

### List available skills (no install)

```bash
npx -y skills add https://github.com/family3253/skill -g --list
```

### Conventions
- One skill per directory: `skills/<skill-dir>/SKILL.md` (required)
- Normalized: frontmatter `name` equals directory name (avoid collisions & generic triggers)
- Secrets are excluded by default (API keys/tokens/runtime state/logs are not committed)

### Skill List (by category)

#### Academic / Research
- **daily-digest**: Generate a daily digest from memory and interactions.
- **mdrgnb-daily-push**: MDRGNB literature daily/weekly workflow (Top3 + deep summary + scoring + push).
- **pubmed-database**: PubMed E-utilities/REST advanced search and batching.
- **summarize**: Summarize URLs/files (web/PDF/images/audio/YouTube).
- **weekly-report-generator**: Structured weekly report generator.
- **wenxian**: Literature search + structured summary + scheduled multi-channel push.

#### Search / Browser / Scrape
- **agent-browser**: Headless browser automation.
- **brave-search**: Brave Search API.
- **multi-search-engine**: Multi-engine search aggregator.
- **playwright-scraper-skill**: Playwright scraper with anti-bot support.
- **tavily-search**: Tavily search.
- **tavily-extract**: Tavily page extraction.
- **tavily-research**: Tavily multi-source research.
- **tavily-crawl**: Tavily crawling to local markdown.
- **tavily-best-practices**: Tavily integration best practices.

#### Docs / Office
- **anthropics-docx**: Work with .docx.
- **anthropics-pdf**: Work with PDFs.
- **anthropics-pptx**: Work with .pptx.
- **anthropics-xlsx**: Work with spreadsheets.
- **anthropics-skill-creator**: Create/optimize/evaluate skills.
- **feishu-common**: Shared Feishu auth + API helper.
- **feishu-doc**: Read/write Feishu Wiki/Docs/Sheets/Bitable.
- **gog**: Google Workspace.
- **notion**: Notion API.

#### Obsidian / Visualization
- **excalidraw-diagram**: Generate Excalidraw diagrams.
- **mermaid-visualizer**: Generate Mermaid diagrams.
- **obsidian-canvas-creator**: Generate Obsidian Canvas.
- **kepano-defuddle**: Clean web page → markdown.
- **kepano-json-canvas**: Create/edit JSON Canvas files.
- **kepano-obsidian-bases**: Create/edit Obsidian Bases.
- **kepano-obsidian-cli**: Obsidian CLI operations.
- **kepano-obsidian-markdown**: Obsidian-flavored markdown.
- **obsidian-plugin-excalidraw**: Generate Excalidraw plugin JSON.
- **obsidian-plugin-tasks**: Tasks plugin queries/management.
- **obsidian-plugin-templater**: Templater templates.

#### Meta / Workflow / Self-improve
- **context-master**: Planning / decomposition / context management.
- **find-skills**: Discover more skills.
- **gsd-oc-select-model**: Interactive model selection workflow.
- **opencode-agent-creator**: Create/configure OpenCode agents.
- **powerpoint-automation**: Generate PPT from sources.
- **elite-powerpoint-designer**: High-quality PPT design.
- **quadrants**: Eisenhower matrix task management.
- **task-status**: Long-task status updates.
- **self-improving-agent**: Capture learnings for continuous improvement.
- **superpowers-***: A set of process skills for planning/executing/debugging/verifying.

#### Wrappers / Index
- **add-skill**: Wrapper for the add-skill CLI.
- **gsd**: Wrapper for Get Shit Done.
- **find-skills-upstream**: Upstream mirror for provenance.
