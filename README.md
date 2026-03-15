# skill

一个面向 **OpenCode / OpenClaw** 的私有 Skills 聚合仓库（学术场景优先），目标是：

- **一条命令安装整套 skills**
- 将上游零散的 skill 仓库（含多-skill 仓库）统一收敛到一个 repo，便于迁移、同步、回滚
- 默认 **不提交任何 secrets**（tokens / API keys / runtime state）

## Quick Start（推荐）

### 1) 一条命令全装（全局）

```bash
npx -y skills add https://github.com/family3253/skill -g --all
```

### 2) 只查看有哪些 skills（不安装）

```bash
npx -y skills add https://github.com/family3253/skill -g --list
```

## Repo 结构

- `skills/<skill-dir>/SKILL.md`：每个 skill 一个目录（**必须有 SKILL.md**）
- `scripts/`：同步/推送脚本（不含 secrets）

## 安装到 OpenCode 的默认目录

- 全局：`~/.config/opencode/skills/`
- 项目级：`./.opencode/skills/`

> 经验：日常用全局；遇到“项目绑定的 skill 版本”再用项目级。

## 学术场景常用（建议从这里开始）

- 文献检索/抓取：`tavily-*` / `brave-search` / `playwright-scraper-skill` / `Agent Browser`
- 文献数据库：`pubmed-database`
- 文献推送工作流：`wenxian` / `mdrgnb-daily-push`
- 归档：`notion` / `gog`
- 汇报/PPT：`powerpoint-automation` / `elite-powerpoint-designer`
- 自我进化/复盘：`self-improving-agent`

## Upstream 来源说明（路线 A+B 同时走）

本仓库包含两类内容：

1) **自研/二次封装**：例如 `wenxian` / `mdrgnb-daily-push` / 以及若干 wrapper skills。
2) **上游镜像（按子目录精准导入）**：从多 skill 仓库中只导入目标子目录，避免整仓库粗暴复制到 skills 根目录。

典型上游：
- Tavily skills：<https://github.com/tavily-ai/skills>
- Vercel find-skills：<https://github.com/vercel-labs/skills/tree/main/skills/find-skills>
- OpenClaw skills（Feishu）：<https://github.com/openclaw/skills/tree/main/skills/autogame-17/feishu-doc>
- Anthropic skills（skill-creator 等）：<https://github.com/anthropics/skills>
- Obra superpowers：<https://github.com/obra/superpowers>

## Safety / Secrets

本仓库默认排除：
- `runtime/config.json`
- `runtime/logs/`、`scripts/logs/`
- `*.log`

如需配置 API Key / OAuth / App 凭证，请在本机环境变量或工具配置文件中完成，**不要提交到 GitHub**。

## 常见配置（速记）

- Tavily：设置 `TAVILY_API_KEY`
- Feishu：需要 Feishu App 凭证（`feishu-common` + `feishu-doc`）

## Troubleshooting

- `npx skills add ... --list` 能看到 skills，但 OpenCode 里没触发：重启 OpenCode 让其重新扫描 skills。
- 遇到 skill 名称过于通用/重名：优先以目录名为准，并统一 frontmatter `name`，避免冲突。
