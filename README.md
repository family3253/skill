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
- **daily-digest** — (autofixed)
- **mdrgnb-daily-push** — 固化 MDRGNB 文献日/周报流程（当天新发表检索、去重、Top3 筛选、10问深度总结、四维评分、落盘与推送）。当用户提到 MDRGNB 日报、文献推送、深度总结、Top3、周报、PubMed 当日新文献时使用。
- **pubmed-database** — Direct REST API access to PubMed. Advanced Boolean/MeSH queries, E-utilities API, batch processing, citation management. For Python workflows, prefer biopython (Bio.Entrez). Use this for direct HTTP/REST work or custom API implementations.
- **summarize** — Summarize URLs or files with the summarize CLI (web, PDFs, images, audio, YouTube).
- **weekly-report-generator** — Auto-generate structured weekly business reports covering KPIs, accomplishments, blockers, and plans. Save hours of reporting time every week.
- **wenxian** — 固化“检索文献并定时推送”的工作流技能。用于把 MDRGNB/HCC 等主题做成每天/每周/每月自动检索 + 结构化总结 + 多渠道推送（飞书/企业微信/QQ/Telegram）的 cron 任务；支持字段标准化（期刊名、中科院分区、SCI 分区）、多端内容一致、长文分段防丢。触发示例："帮我几点几分往xx里推送xx文献"、"每天/每周/每月xx:xx推送xx主题文献到xx渠道"。

### 搜索/浏览器/爬取
- **agent-browser** — A fast Rust-based headless browser automation CLI with Node.js fallback that enables AI agents to navigate, click, type, and snapshot pages via structured commands.
- **brave-search** — Web search and content extraction via Brave Search API. Use for searching documentation, facts, or any web content. Lightweight, no browser required.
- **multi-search-engine** — Multi search engine integration with 17 engines (8 CN + 9 Global). Supports advanced search operators, time filters, site search, privacy engines, and WolframAlpha knowledge queries. No API keys required.
- **playwright-scraper-skill** — Playwright-based web scraping OpenClaw Skill with anti-bot protection. Successfully tested on complex sites like Discuss.com.hk.
- **tavily-best-practices** — Build production-ready Tavily integrations with best practices baked in. Reference documentation for developers using coding assistants (Claude Code, Cursor, etc.) to implement web search, content extraction, crawling, and research in agentic workflows, RAG systems, or autonomous agents.
- **tavily-crawl** — Crawl any website and save pages as local markdown files. Use when you need to download documentation, knowledge bases, or web content for offline access or analysis. No code required - just provide a URL.
- **tavily-extract** — Extract content from specific URLs using Tavily's extraction API. Returns clean markdown/text from web pages. Use when you have specific URLs and need their content without writing code.
- **tavily-research** — Comprehensive research grounded in web data with explicit citations. Use when you need multi-source synthesis—comparisons, current events, market analysis, detailed reports.
- **tavily-search** — Search the web using Tavily's LLM-optimized search API. Returns relevant results with content snippets, scores, and metadata. Use when you need to find web content on any topic without writing code.

### 文档/办公
- **anthropics-docx** — Use this skill whenever the user wants to create, read, edit, or manipulate Word documents (.docx files). Triggers include: any mention of 'Word doc', 'word document', '.docx', or requests to produce professional documents with formatting like tables of contents, headings, page numbers, or letterheads. Also use when extracting or reorganizing content from .docx files, inserting or replacing images in documents, performing find-and-replace in Word files, working with tracked changes or comments, or converting content into a polished Word document. If the user asks for a 'report', 'memo', 'letter', 'template', or similar deliverable as a Word or .docx file, use this skill. Do NOT use for PDFs, spreadsheets, Google Docs, or general coding tasks unrelated to document generation.
- **anthropics-pdf** — Use this skill whenever the user wants to do anything with PDF files. This includes reading or extracting text/tables from PDFs, combining or merging multiple PDFs into one, splitting PDFs apart, rotating pages, adding watermarks, creating new PDFs, filling PDF forms, encrypting/decrypting PDFs, extracting images, and OCR on scanned PDFs to make them searchable. If the user mentions a .pdf file or asks to produce one, use this skill.
- **anthropics-pptx** — Use this skill any time a .pptx file is involved in any way — as input, output, or both. This includes: creating slide decks, pitch decks, or presentations; reading, parsing, or extracting text from any .pptx file (even if the extracted content will be used elsewhere, like in an email or summary); editing, modifying, or updating existing presentations; combining or splitting slide files; working with templates, layouts, speaker notes, or comments. Trigger whenever the user mentions "deck," "slides," "presentation," or references a .pptx filename, regardless of what they plan to do with the content afterward. If a .pptx file needs to be opened, created, or touched, use this skill.
- **anthropics-xlsx** — Use this skill any time a spreadsheet file is the primary input or output. This means any task where the user wants to: open, read, edit, or fix an existing .xlsx, .xlsm, .csv, or .tsv file (e.g., adding columns, computing formulas, formatting, charting, cleaning messy data); create a new spreadsheet from scratch or from other data sources; or convert between tabular file formats. Trigger especially when the user references a spreadsheet file by name or path — even casually (like "the xlsx in my downloads") — and wants something done to it or produced from it. Also trigger for cleaning or restructuring messy tabular data files (malformed rows, misplaced headers, junk data) into proper spreadsheets. The deliverable must be a spreadsheet file. Do NOT trigger when the primary deliverable is a Word document, HTML report, standalone Python script, database pipeline, or Google Sheets API integration, even if tabular data is involved.
- **elite-powerpoint-designer** — Create world-class PowerPoint presentations with professional design, consistent branding, sophisticated animations, and polished visual hierarchy. Use when users request presentations, slide decks, pitches, reports, or want to convert markdown to professionally designed PowerPoint with Apple/Microsoft/Google-level quality.
- **feishu-common** — (autofixed)
- **feishu-doc** — Fetch content from Feishu (Lark) Wiki, Docs, Sheets, and Bitable. Automatically resolves Wiki URLs to real entities and converts content to Markdown.
- **gog** — Google Workspace CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs.
- **notion** — Notion API for creating and managing pages, databases, and blocks.
- **powerpoint-automation** — Create professional PowerPoint presentations from various sources including web articles, blog posts, and existing PPTX files. Use when creating PPTX, converting articles to slides, or translating presentations.

### Obsidian/可视化
- **excalidraw-diagram** — Generate Excalidraw diagrams from text content. Supports three output modes - Obsidian (.md), Standard (.excalidraw), and Animated (.excalidraw with animation order). Triggers on "Excalidraw", "画图", "流程图", "思维导图", "可视化", "diagram", "标准Excalidraw", "standard excalidraw", "Excalidraw动画", "动画图", "animate".
- **kepano-defuddle** — Extract clean markdown content from web pages using Defuddle CLI, removing clutter and navigation to save tokens. Use instead of WebFetch when the user provides a URL to read or analyze, for online documentation, articles, blog posts, or any standard web page.
- **kepano-json-canvas** — Create and edit JSON Canvas files (.canvas) with nodes, edges, groups, and connections. Use when working with .canvas files, creating visual canvases, mind maps, flowcharts, or when the user mentions Canvas files in Obsidian.
- **kepano-obsidian-bases** — Create and edit Obsidian Bases (.base files) with views, filters, formulas, and summaries. Use when working with .base files, creating database-like views of notes, or when the user mentions Bases, table views, card views, filters, or formulas in Obsidian.
- **kepano-obsidian-cli** — Interact with Obsidian vaults using the Obsidian CLI to read, create, search, and manage notes, tasks, properties, and more. Also supports plugin and theme development with commands to reload plugins, run JavaScript, capture errors, take screenshots, and inspect the DOM. Use when the user asks to interact with their Obsidian vault, manage notes, search vault content, perform vault operations from the command line, or develop and debug Obsidian plugins and themes.
- **kepano-obsidian-markdown** — Create and edit Obsidian Flavored Markdown with wikilinks, embeds, callouts, properties, and other Obsidian-specific syntax. Use when working with .md files in Obsidian, or when the user mentions wikilinks, callouts, frontmatter, tags, embeds, or Obsidian notes.
- **mermaid-visualizer** — Transform text content into professional Mermaid diagrams for presentations and documentation. Use when users ask to visualize concepts, create flowcharts, or make diagrams from text. Supports process flows, system architectures, comparisons, mindmaps, and more with built-in syntax error prevention.
- **obsidian-canvas-creator** — Create Obsidian Canvas files from text content, supporting both MindMap and freeform layouts. Use this skill when users want to visualize content as an interactive canvas, create mind maps, or organize information spatially in Obsidian format.
- **obsidian-plugin-excalidraw** — 生成符合当前 Excalidraw JSON Schema 的白板文件（.excalidraw），支持形状、智能连线、文本绑定、Obsidian 内部链接。兼容 Obsidian Excalidraw 插件 2.0+，用于绘制架构图、流程图、思维导图。
- **obsidian-plugin-tasks** — 使用Tasks插件在Obsidian中管理和查询任务，支持任务状态跟踪、截止日期、计划日期、创建日期、重复规则、任务依赖等功能。提供强大的查询语法（Tasks Query Language）创建动态任务列表，支持过滤、排序、分组。适用于个人任务管理、项目跟踪、GTD实践、每日计划、习惯追踪等场景。当用户提到Tasks插件、任务管理、TODO列表、任务查询语法、重复任务、任务状态等概念时使用。
- **obsidian-plugin-templater** — 创建和编辑带有变量、函数、控制流和Obsidian特定语法的Templater模板。当处理包含Templater模板的.md文件、创建动态内容，或用户提及Templater、模板变量或模板函数时使用。

### 元技能/流程/自我进化
- **context-master** — Universal context management and planning system. PROACTIVELY activate for: (1) ANY complex task requiring planning, (2) Multi-file projects/websites/apps, (3) Architecture decisions, (4) Research tasks, (5) Refactoring, (6) Long coding sessions, (7) Tasks with 3+ sequential steps. Provides: optimal file creation order, context-efficient workflows, extended thinking delegation (23x context efficiency), passive deep analysis architecture, progressive task decomposition, and prevents redundant work. Saves 62% context on average. Essential for maintaining session performance and analytical depth.
- **find-skills** — Helps users discover and install agent skills when they ask questions like "how do I do X", "find a skill for X", "is there a skill that can...", or express interest in extending capabilities. This skill should be used when the user is looking for functionality that might exist as an installable skill.
- **gsd-oc-select-model** — Interactive model selection workflow with paginated navigation. Use when users want to select a model interactively - guides them through provider selection then model selection using the question tool with pagination support for large lists.
- **opencode-agent-creator** — Expert guidance for creating, configuring, and refining OpenCode agents. Use when working with agent files, authoring new agents, improving existing agents, or understanding agent structure and best practices. Use PROACTIVELY when user mentions creating agents, configuring tools, setting permissions, or agent architecture.
- **quadrants** — Manage Quadrants tasks and projects via natural language. Use when the user wants to create, view, complete, or organize tasks on the Eisenhower Matrix. Supports listing projects, adding tasks (single or bulk), viewing priority tasks, completing tasks, and getting project overviews. Triggers on mentions of "quadrants", "tasks", "to-do", "eisenhower", "priority matrix", or task management requests.
- **remotion-skill** — 动画逻辑图工厂。用户描述想要的动画（ASCII 草图或文字），自动生成 Remotion 代码并渲染为 GIF。当用户提到动画、逻辑图、GIF、Remotion 时触发。
- **self-improving-agent** — Captures learnings, errors, and corrections to enable continuous improvement. Use when: (1) A command or operation fails unexpectedly, (2) User corrects Claude ('No, that's wrong...', 'Actually...'), (3) User requests a capability that doesn't exist, (4) An external API or tool fails, (5) Claude realizes its knowledge is outdated or incorrect, (6) A better approach is discovered for a recurring task. Also review learnings before major tasks.
- **skill-creator** — Create new skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, edit, or optimize an existing skill, run evals to test a skill, benchmark skill performance with variance analysis, or optimize a skill's description for better triggering accuracy.
- **superpowers-brainstorming** — You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation.
- **superpowers-dispatching-parallel-agents** — Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies
- **superpowers-executing-plans** — Use when you have a written implementation plan to execute in a separate session with review checkpoints
- **superpowers-finishing-a-development-branch** — Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup
- **superpowers-receiving-code-review** — Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation
- **superpowers-requesting-code-review** — Use when completing tasks, implementing major features, or before merging to verify work meets requirements
- **superpowers-subagent-driven-development** — Use when executing implementation plans with independent tasks in the current session
- **superpowers-systematic-debugging** — Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
- **superpowers-test-driven-development** — Use when implementing any feature or bugfix, before writing implementation code
- **superpowers-using-git-worktrees** — Use when starting feature work that needs isolation from current workspace or before executing implementation plans - creates isolated git worktrees with smart directory selection and safety verification
- **superpowers-using-superpowers** — Use when starting any conversation - establishes how to find and use skills, requiring Skill tool invocation before ANY response including clarifying questions
- **superpowers-verification-before-completion** — Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always
- **superpowers-writing-plans** — Use when you have a spec or requirements for a multi-step task, before touching code
- **superpowers-writing-skills** — Use when creating new skills, editing existing skills, or verifying skills work before deployment
- **task-status** — Send short status descriptions in chat for long-running tasks. Use when you need to provide periodic updates during multi-step operations, confirm task completion, or notify of failures. Includes automated periodic monitoring that sends updates every 5 seconds, status message templates, and a helper function for consistent status reporting.

### 封装/索引(Wrapper)
- **add-skill** — Wrapper skill for the add-skill CLI. Installs skills from arbitrary GitHub repos for OpenCode/Claude/Codex.
- **awesome-claude-skills** — Wrapper/index for the awesome-claude-skills collection repository.
- **gsd** — Wrapper skill for the Get Shit Done (GSD) multi-agent workflow system. Provides install + usage pointers for OpenCode/Codex/Claude.

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

### Academic / Research
- **daily-digest** — (autofixed)
- **mdrgnb-daily-push** — 固化 MDRGNB 文献日/周报流程（当天新发表检索、去重、Top3 筛选、10问深度总结、四维评分、落盘与推送）。当用户提到 MDRGNB 日报、文献推送、深度总结、Top3、周报、PubMed 当日新文献时使用。
- **pubmed-database** — Direct REST API access to PubMed. Advanced Boolean/MeSH queries, E-utilities API, batch processing, citation management. For Python workflows, prefer biopython (Bio.Entrez). Use this for direct HTTP/REST work or custom API implementations.
- **summarize** — Summarize URLs or files with the summarize CLI (web, PDFs, images, audio, YouTube).
- **weekly-report-generator** — Auto-generate structured weekly business reports covering KPIs, accomplishments, blockers, and plans. Save hours of reporting time every week.
- **wenxian** — 固化“检索文献并定时推送”的工作流技能。用于把 MDRGNB/HCC 等主题做成每天/每周/每月自动检索 + 结构化总结 + 多渠道推送（飞书/企业微信/QQ/Telegram）的 cron 任务；支持字段标准化（期刊名、中科院分区、SCI 分区）、多端内容一致、长文分段防丢。触发示例："帮我几点几分往xx里推送xx文献"、"每天/每周/每月xx:xx推送xx主题文献到xx渠道"。

### Search / Browser / Scrape
- **agent-browser** — A fast Rust-based headless browser automation CLI with Node.js fallback that enables AI agents to navigate, click, type, and snapshot pages via structured commands.
- **brave-search** — Web search and content extraction via Brave Search API. Use for searching documentation, facts, or any web content. Lightweight, no browser required.
- **multi-search-engine** — Multi search engine integration with 17 engines (8 CN + 9 Global). Supports advanced search operators, time filters, site search, privacy engines, and WolframAlpha knowledge queries. No API keys required.
- **playwright-scraper-skill** — Playwright-based web scraping OpenClaw Skill with anti-bot protection. Successfully tested on complex sites like Discuss.com.hk.
- **tavily-best-practices** — Build production-ready Tavily integrations with best practices baked in. Reference documentation for developers using coding assistants (Claude Code, Cursor, etc.) to implement web search, content extraction, crawling, and research in agentic workflows, RAG systems, or autonomous agents.
- **tavily-crawl** — Crawl any website and save pages as local markdown files. Use when you need to download documentation, knowledge bases, or web content for offline access or analysis. No code required - just provide a URL.
- **tavily-extract** — Extract content from specific URLs using Tavily's extraction API. Returns clean markdown/text from web pages. Use when you have specific URLs and need their content without writing code.
- **tavily-research** — Comprehensive research grounded in web data with explicit citations. Use when you need multi-source synthesis—comparisons, current events, market analysis, detailed reports.
- **tavily-search** — Search the web using Tavily's LLM-optimized search API. Returns relevant results with content snippets, scores, and metadata. Use when you need to find web content on any topic without writing code.

### Docs / Office
- **anthropics-docx** — Use this skill whenever the user wants to create, read, edit, or manipulate Word documents (.docx files). Triggers include: any mention of 'Word doc', 'word document', '.docx', or requests to produce professional documents with formatting like tables of contents, headings, page numbers, or letterheads. Also use when extracting or reorganizing content from .docx files, inserting or replacing images in documents, performing find-and-replace in Word files, working with tracked changes or comments, or converting content into a polished Word document. If the user asks for a 'report', 'memo', 'letter', 'template', or similar deliverable as a Word or .docx file, use this skill. Do NOT use for PDFs, spreadsheets, Google Docs, or general coding tasks unrelated to document generation.
- **anthropics-pdf** — Use this skill whenever the user wants to do anything with PDF files. This includes reading or extracting text/tables from PDFs, combining or merging multiple PDFs into one, splitting PDFs apart, rotating pages, adding watermarks, creating new PDFs, filling PDF forms, encrypting/decrypting PDFs, extracting images, and OCR on scanned PDFs to make them searchable. If the user mentions a .pdf file or asks to produce one, use this skill.
- **anthropics-pptx** — Use this skill any time a .pptx file is involved in any way — as input, output, or both. This includes: creating slide decks, pitch decks, or presentations; reading, parsing, or extracting text from any .pptx file (even if the extracted content will be used elsewhere, like in an email or summary); editing, modifying, or updating existing presentations; combining or splitting slide files; working with templates, layouts, speaker notes, or comments. Trigger whenever the user mentions "deck," "slides," "presentation," or references a .pptx filename, regardless of what they plan to do with the content afterward. If a .pptx file needs to be opened, created, or touched, use this skill.
- **anthropics-xlsx** — Use this skill any time a spreadsheet file is the primary input or output. This means any task where the user wants to: open, read, edit, or fix an existing .xlsx, .xlsm, .csv, or .tsv file (e.g., adding columns, computing formulas, formatting, charting, cleaning messy data); create a new spreadsheet from scratch or from other data sources; or convert between tabular file formats. Trigger especially when the user references a spreadsheet file by name or path — even casually (like "the xlsx in my downloads") — and wants something done to it or produced from it. Also trigger for cleaning or restructuring messy tabular data files (malformed rows, misplaced headers, junk data) into proper spreadsheets. The deliverable must be a spreadsheet file. Do NOT trigger when the primary deliverable is a Word document, HTML report, standalone Python script, database pipeline, or Google Sheets API integration, even if tabular data is involved.
- **elite-powerpoint-designer** — Create world-class PowerPoint presentations with professional design, consistent branding, sophisticated animations, and polished visual hierarchy. Use when users request presentations, slide decks, pitches, reports, or want to convert markdown to professionally designed PowerPoint with Apple/Microsoft/Google-level quality.
- **feishu-common** — (autofixed)
- **feishu-doc** — Fetch content from Feishu (Lark) Wiki, Docs, Sheets, and Bitable. Automatically resolves Wiki URLs to real entities and converts content to Markdown.
- **gog** — Google Workspace CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs.
- **notion** — Notion API for creating and managing pages, databases, and blocks.
- **powerpoint-automation** — Create professional PowerPoint presentations from various sources including web articles, blog posts, and existing PPTX files. Use when creating PPTX, converting articles to slides, or translating presentations.

### Obsidian / Visualization
- **excalidraw-diagram** — Generate Excalidraw diagrams from text content. Supports three output modes - Obsidian (.md), Standard (.excalidraw), and Animated (.excalidraw with animation order). Triggers on "Excalidraw", "画图", "流程图", "思维导图", "可视化", "diagram", "标准Excalidraw", "standard excalidraw", "Excalidraw动画", "动画图", "animate".
- **kepano-defuddle** — Extract clean markdown content from web pages using Defuddle CLI, removing clutter and navigation to save tokens. Use instead of WebFetch when the user provides a URL to read or analyze, for online documentation, articles, blog posts, or any standard web page.
- **kepano-json-canvas** — Create and edit JSON Canvas files (.canvas) with nodes, edges, groups, and connections. Use when working with .canvas files, creating visual canvases, mind maps, flowcharts, or when the user mentions Canvas files in Obsidian.
- **kepano-obsidian-bases** — Create and edit Obsidian Bases (.base files) with views, filters, formulas, and summaries. Use when working with .base files, creating database-like views of notes, or when the user mentions Bases, table views, card views, filters, or formulas in Obsidian.
- **kepano-obsidian-cli** — Interact with Obsidian vaults using the Obsidian CLI to read, create, search, and manage notes, tasks, properties, and more. Also supports plugin and theme development with commands to reload plugins, run JavaScript, capture errors, take screenshots, and inspect the DOM. Use when the user asks to interact with their Obsidian vault, manage notes, search vault content, perform vault operations from the command line, or develop and debug Obsidian plugins and themes.
- **kepano-obsidian-markdown** — Create and edit Obsidian Flavored Markdown with wikilinks, embeds, callouts, properties, and other Obsidian-specific syntax. Use when working with .md files in Obsidian, or when the user mentions wikilinks, callouts, frontmatter, tags, embeds, or Obsidian notes.
- **mermaid-visualizer** — Transform text content into professional Mermaid diagrams for presentations and documentation. Use when users ask to visualize concepts, create flowcharts, or make diagrams from text. Supports process flows, system architectures, comparisons, mindmaps, and more with built-in syntax error prevention.
- **obsidian-canvas-creator** — Create Obsidian Canvas files from text content, supporting both MindMap and freeform layouts. Use this skill when users want to visualize content as an interactive canvas, create mind maps, or organize information spatially in Obsidian format.
- **obsidian-plugin-excalidraw** — 生成符合当前 Excalidraw JSON Schema 的白板文件（.excalidraw），支持形状、智能连线、文本绑定、Obsidian 内部链接。兼容 Obsidian Excalidraw 插件 2.0+，用于绘制架构图、流程图、思维导图。
- **obsidian-plugin-tasks** — 使用Tasks插件在Obsidian中管理和查询任务，支持任务状态跟踪、截止日期、计划日期、创建日期、重复规则、任务依赖等功能。提供强大的查询语法（Tasks Query Language）创建动态任务列表，支持过滤、排序、分组。适用于个人任务管理、项目跟踪、GTD实践、每日计划、习惯追踪等场景。当用户提到Tasks插件、任务管理、TODO列表、任务查询语法、重复任务、任务状态等概念时使用。
- **obsidian-plugin-templater** — 创建和编辑带有变量、函数、控制流和Obsidian特定语法的Templater模板。当处理包含Templater模板的.md文件、创建动态内容，或用户提及Templater、模板变量或模板函数时使用。

### Meta / Workflow / Self-improve
- **context-master** — Universal context management and planning system. PROACTIVELY activate for: (1) ANY complex task requiring planning, (2) Multi-file projects/websites/apps, (3) Architecture decisions, (4) Research tasks, (5) Refactoring, (6) Long coding sessions, (7) Tasks with 3+ sequential steps. Provides: optimal file creation order, context-efficient workflows, extended thinking delegation (23x context efficiency), passive deep analysis architecture, progressive task decomposition, and prevents redundant work. Saves 62% context on average. Essential for maintaining session performance and analytical depth.
- **find-skills** — Helps users discover and install agent skills when they ask questions like "how do I do X", "find a skill for X", "is there a skill that can...", or express interest in extending capabilities. This skill should be used when the user is looking for functionality that might exist as an installable skill.
- **gsd-oc-select-model** — Interactive model selection workflow with paginated navigation. Use when users want to select a model interactively - guides them through provider selection then model selection using the question tool with pagination support for large lists.
- **opencode-agent-creator** — Expert guidance for creating, configuring, and refining OpenCode agents. Use when working with agent files, authoring new agents, improving existing agents, or understanding agent structure and best practices. Use PROACTIVELY when user mentions creating agents, configuring tools, setting permissions, or agent architecture.
- **quadrants** — Manage Quadrants tasks and projects via natural language. Use when the user wants to create, view, complete, or organize tasks on the Eisenhower Matrix. Supports listing projects, adding tasks (single or bulk), viewing priority tasks, completing tasks, and getting project overviews. Triggers on mentions of "quadrants", "tasks", "to-do", "eisenhower", "priority matrix", or task management requests.
- **remotion-skill** — 动画逻辑图工厂。用户描述想要的动画（ASCII 草图或文字），自动生成 Remotion 代码并渲染为 GIF。当用户提到动画、逻辑图、GIF、Remotion 时触发。
- **self-improving-agent** — Captures learnings, errors, and corrections to enable continuous improvement. Use when: (1) A command or operation fails unexpectedly, (2) User corrects Claude ('No, that's wrong...', 'Actually...'), (3) User requests a capability that doesn't exist, (4) An external API or tool fails, (5) Claude realizes its knowledge is outdated or incorrect, (6) A better approach is discovered for a recurring task. Also review learnings before major tasks.
- **skill-creator** — Create new skills, modify and improve existing skills, and measure skill performance. Use when users want to create a skill from scratch, edit, or optimize an existing skill, run evals to test a skill, benchmark skill performance with variance analysis, or optimize a skill's description for better triggering accuracy.
- **superpowers-brainstorming** — You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation.
- **superpowers-dispatching-parallel-agents** — Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies
- **superpowers-executing-plans** — Use when you have a written implementation plan to execute in a separate session with review checkpoints
- **superpowers-finishing-a-development-branch** — Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup
- **superpowers-receiving-code-review** — Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation
- **superpowers-requesting-code-review** — Use when completing tasks, implementing major features, or before merging to verify work meets requirements
- **superpowers-subagent-driven-development** — Use when executing implementation plans with independent tasks in the current session
- **superpowers-systematic-debugging** — Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
- **superpowers-test-driven-development** — Use when implementing any feature or bugfix, before writing implementation code
- **superpowers-using-git-worktrees** — Use when starting feature work that needs isolation from current workspace or before executing implementation plans - creates isolated git worktrees with smart directory selection and safety verification
- **superpowers-using-superpowers** — Use when starting any conversation - establishes how to find and use skills, requiring Skill tool invocation before ANY response including clarifying questions
- **superpowers-verification-before-completion** — Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always
- **superpowers-writing-plans** — Use when you have a spec or requirements for a multi-step task, before touching code
- **superpowers-writing-skills** — Use when creating new skills, editing existing skills, or verifying skills work before deployment
- **task-status** — Send short status descriptions in chat for long-running tasks. Use when you need to provide periodic updates during multi-step operations, confirm task completion, or notify of failures. Includes automated periodic monitoring that sends updates every 5 seconds, status message templates, and a helper function for consistent status reporting.

### Wrappers / Index
- **add-skill** — Wrapper skill for the add-skill CLI. Installs skills from arbitrary GitHub repos for OpenCode/Claude/Codex.
- **awesome-claude-skills** — Wrapper/index for the awesome-claude-skills collection repository.
- **gsd** — Wrapper skill for the Get Shit Done (GSD) multi-agent workflow system. Provides install + usage pointers for OpenCode/Codex/Claude.

---

## Upstream 同步 / Upstream Sync

- 手动同步（本地）：

```bash
cd <this-repo>
./scripts/sync_upstreams.sh
```

- 自动同步（GitHub Actions）：本仓库包含 `sync-upstreams` 工作流（每天定时 + 支持手动触发），会从上游仓库拉取更新并自动提交到 main。

