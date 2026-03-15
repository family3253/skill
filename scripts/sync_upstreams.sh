#!/usr/bin/env bash
set -euo pipefail

# Sync upstream skill repos into this monorepo.
# - Only pulls the required subdirectories (no whole-repo dumping).
# - Keeps wrappers (awesome-claude-skills, add-skill, gsd) as-is.
# - Normalizes SKILL.md frontmatter so Skills/OpenCode can discover everything.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
TMP_DIR="${TMP_DIR:-/tmp/skill-upstreams}"

mkdir -p "$TMP_DIR" "$SKILLS_DIR"

echo "[sync] repo=$(basename \"$ROOT_DIR\") skills_dir=$SKILLS_DIR tmp_dir=$TMP_DIR"

# Robust default-branch handling:
# Many upstream repos use `main`, some use `master` (or others). We always sync from origin/HEAD.
clone_or_update() {
  local url="$1"; local dir="$2"

  echo "[sync] upstream=$url => $TMP_DIR/$dir"

  if [[ -d "$TMP_DIR/$dir/.git" ]]; then
    git -C "$TMP_DIR/$dir" remote set-url origin "$url" || true
    git -C "$TMP_DIR/$dir" fetch --depth 1 origin || true

    # Try to resolve default branch (origin/HEAD)
    local head_ref
    head_ref=$(git -C "$TMP_DIR/$dir" symbolic-ref -q --short refs/remotes/origin/HEAD 2>/dev/null || true)
    if [[ -z "$head_ref" ]]; then
      # Fallback: parse "HEAD branch" from remote show
      local head_branch
      head_branch=$(git -C "$TMP_DIR/$dir" remote show origin 2>/dev/null | awk '/HEAD branch/ {print $NF}' || true)
      if [[ -n "$head_branch" ]]; then
        head_ref="origin/$head_branch"
      fi
    fi
    # Last resort
    [[ -z "$head_ref" ]] && head_ref="origin/main"

    git -C "$TMP_DIR/$dir" reset --hard "$head_ref" || true
  else
    rm -rf "$TMP_DIR/$dir"
    # Clone default branch only (no hardcoded branch name)
    git clone --depth 1 "$url" "$TMP_DIR/$dir"
  fi
}

sync_dir() {
  local src="$1"; local dst="$2"
  rm -rf "$dst"
  mkdir -p "$dst"
  rsync -a --delete --exclude '.git' "$src/" "$dst/"
}

# 1) tavily-ai/skills (multi skill)
clone_or_update https://github.com/tavily-ai/skills tavily-ai-skills
for d in search extract research crawl tavily-best-practices; do
  src="$TMP_DIR/tavily-ai-skills/skills/tavily/$d"
  dst="$SKILLS_DIR/tavily-$d"
  [[ -d "$src" ]] && sync_dir "$src" "$dst"
done
# rename to tavily-best-practices dir name
if [[ -d "$SKILLS_DIR/tavily-tavily-best-practices" ]]; then
  rm -rf "$SKILLS_DIR/tavily-best-practices"
  mv "$SKILLS_DIR/tavily-tavily-best-practices" "$SKILLS_DIR/tavily-best-practices"
fi

# 2) vercel-labs/skills find-skills
clone_or_update https://github.com/vercel-labs/skills vercel-skills
sync_dir "$TMP_DIR/vercel-skills/skills/find-skills" "$SKILLS_DIR/find-skills"

# 3) openclaw/skills feishu-common + feishu-doc
clone_or_update https://github.com/openclaw/skills openclaw-skills
BASE="$TMP_DIR/openclaw-skills/skills/autogame-17"
sync_dir "$BASE/feishu-common" "$SKILLS_DIR/feishu-common"
sync_dir "$BASE/feishu-doc" "$SKILLS_DIR/feishu-doc"

# 4) self-improving-agent
clone_or_update https://github.com/peterskoett/self-improving-agent self-improving-agent-up
sync_dir "$TMP_DIR/self-improving-agent-up" "$SKILLS_DIR/self-improving-agent"

# 5) superpowers (multi)
clone_or_update https://github.com/obra/superpowers superpowers
# clear existing superpowers-* first
find "$SKILLS_DIR" -maxdepth 1 -type d -name 'superpowers-*' -exec rm -rf {} +
for p in "$TMP_DIR/superpowers/skills"/*; do
  [[ -d "$p" ]] || continue
  bn="$(basename "$p")"
  sync_dir "$p" "$SKILLS_DIR/superpowers-$bn"
done

# 6) anthropics skill-creator
clone_or_update https://github.com/anthropics/skills anthropics-skills
sync_dir "$TMP_DIR/anthropics-skills/skills/skill-creator" "$SKILLS_DIR/skill-creator"

# 7) axtonliu obsidian visual skills
clone_or_update https://github.com/axtonliu/axton-obsidian-visual-skills axton
for s in excalidraw-diagram mermaid-visualizer obsidian-canvas-creator; do
  sync_dir "$TMP_DIR/axton/$s" "$SKILLS_DIR/$s"
done

# 8) kepano obsidian-skills (multi)
clone_or_update https://github.com/kepano/obsidian-skills kepano
# clear existing kepano-* first
find "$SKILLS_DIR" -maxdepth 1 -type d -name 'kepano-*' -exec rm -rf {} +
for p in "$TMP_DIR/kepano/skills"/*; do
  [[ -d "$p" ]] || continue
  bn="$(basename "$p")"
  sync_dir "$p" "$SKILLS_DIR/kepano-$bn"
done

# 9) wanguliux obsidian common plugins skills (excalidraw only)
clone_or_update https://github.com/wanguliux/obsidian-common-plugins-skills wanguliux
sync_dir "$TMP_DIR/wanguliux/skills/excalidraw" "$SKILLS_DIR/obsidian-plugin-excalidraw"

# 10) remotion
clone_or_update https://github.com/Ceeon/remotion-skill remotion
sync_dir "$TMP_DIR/remotion" "$SKILLS_DIR/remotion-skill"

# 11) opencode agent creator
clone_or_update https://github.com/rodrigolagodev/opencode-agent-creator-skill opencode-agent-creator
sync_dir "$TMP_DIR/opencode-agent-creator" "$SKILLS_DIR/opencode-agent-creator"

# NOTE: wrappers kept as-is:
# - skills/awesome-claude-skills
# - skills/add-skill
# - skills/gsd

# Normalize SKILL.md frontmatter across all skills so discovery works
python3 - <<'PY'
from pathlib import Path
import re

skills_root=Path('skills')

for d in skills_root.iterdir():
    if not d.is_dir():
        continue
    p=d/'SKILL.md'
    if not p.exists():
        # some repos might not ship SKILL.md; leave it to wrapper policy
        continue
    s=p.read_text('utf-8',errors='ignore').replace('\r\n','\n')

    # If no frontmatter, add minimal
    if not s.startswith('---'):
        s=f"---\nname: {d.name}\ndescription: (synced)\n---\n\n"+s

    # Ensure starts with ---\n
    if s.startswith('---name:'):
        s='---\n'+s[len('---'):]
    elif s.startswith('---') and not s.startswith('---\n'):
        s=re.sub(r'^---\s*', '---\n', s, count=1)

    m=re.match(r'^---\n(.*?)\n---\n?(.*)$', s, flags=re.S)
    if not m:
        # If malformed, wrap everything as body and create minimal fm
        body=s
        s=f"---\nname: {d.name}\ndescription: (synced)\n---\n\n{body}"
        m=re.match(r'^---\n(.*?)\n---\n?(.*)$', s, flags=re.S)

    fm=m.group(1)
    body=m.group(2)

    # remove all existing name lines then inject one at top
    fm_lines=fm.split('\n')
    kept=[ln for ln in fm_lines if not re.match(r'^name:\s*', ln.strip())]
    while kept and kept[0].strip()=='' :
        kept.pop(0)
    while kept and kept[-1].strip()=='' :
        kept.pop()

    new_fm='\n'.join([f'name: {d.name}']+kept)
    body=body.lstrip('\n')
    out=f"---\n{new_fm}\n---\n\n{body}"

    if out!=s:
        p.write_text(out,'utf-8')
PY

# Show summary
count=$(find "$SKILLS_DIR" -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')
echo "Synced. SKILL.md count: $count"
