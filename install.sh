#!/usr/bin/env bash
# Council of Advisors — installer
# Usage: curl -fsSL https://raw.githubusercontent.com/Enzo0673/council-of-advisors/main/install.sh | bash

set -e

REPO="https://github.com/Enzo0673/council-of-advisors"
SKILL_FILE="https://raw.githubusercontent.com/Enzo0673/council-of-advisors/main/skills/council-of-advisors/SKILL.md"
PLUGIN_JSON="https://raw.githubusercontent.com/Enzo0673/council-of-advisors/main/.claude-plugin/plugin.json"
GEMINI_MD="https://raw.githubusercontent.com/Enzo0673/council-of-advisors/main/GEMINI.md"
AGENTS_MD="https://raw.githubusercontent.com/Enzo0673/council-of-advisors/main/AGENTS.md"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "  Council of Advisors — Installer"
echo "  ================================"
echo ""

install_claude_code() {
  DEST="$HOME/.claude/plugins/marketplaces/council-of-advisors"
  echo "  Detected: Claude Code"
  mkdir -p "$DEST/skills/council-of-advisors" "$DEST/.claude-plugin"
  curl -fsSL "$SKILL_FILE" -o "$DEST/skills/council-of-advisors/SKILL.md"
  curl -fsSL "$PLUGIN_JSON" -o "$DEST/.claude-plugin/plugin.json"
  echo -e "  ${GREEN}Installed to $DEST${NC}"
  echo "  Restart Claude Code to activate."
}

install_gemini() {
  DEST="$HOME/.gemini/plugins/council-of-advisors"
  echo "  Detected: Gemini CLI"
  mkdir -p "$DEST/skills/council-of-advisors"
  curl -fsSL "$SKILL_FILE" -o "$DEST/skills/council-of-advisors/SKILL.md"
  curl -fsSL "$GEMINI_MD" -o "$DEST/GEMINI.md"
  echo -e "  ${GREEN}Installed to $DEST${NC}"
  echo "  Restart Gemini CLI to activate."
}

install_copilot() {
  DEST="$HOME/.copilot/plugins/council-of-advisors"
  echo "  Detected: Copilot CLI"
  mkdir -p "$DEST/skills/council-of-advisors"
  curl -fsSL "$SKILL_FILE" -o "$DEST/skills/council-of-advisors/SKILL.md"
  echo -e "  ${GREEN}Installed to $DEST${NC}"
  echo "  Restart Copilot CLI to activate."
}

install_codex() {
  DEST="$HOME/.codex/plugins/council-of-advisors"
  echo "  Detected: Codex"
  mkdir -p "$DEST/skills/council-of-advisors"
  curl -fsSL "$SKILL_FILE" -o "$DEST/skills/council-of-advisors/SKILL.md"
  curl -fsSL "$AGENTS_MD" -o "$DEST/AGENTS.md"
  echo -e "  ${GREEN}Installed to $DEST${NC}"
  echo "  Restart Codex to activate."
}

# Auto-detect installed tools
INSTALLED=()
command -v claude &>/dev/null && INSTALLED+=("claude")
command -v gemini &>/dev/null && INSTALLED+=("gemini")
command -v gh-copilot &>/dev/null && INSTALLED+=("copilot")
command -v codex &>/dev/null && INSTALLED+=("codex")

if [ ${#INSTALLED[@]} -eq 0 ]; then
  echo -e "  ${YELLOW}No supported AI CLI tool detected.${NC}"
  echo "  Supported: Claude Code, Gemini CLI, Copilot CLI, Codex"
  echo "  Install manually by cloning:"
  echo "    git clone $REPO ~/.claude/plugins/marketplaces/council-of-advisors"
  exit 1
fi

for TOOL in "${INSTALLED[@]}"; do
  case $TOOL in
    claude)  install_claude_code ;;
    gemini)  install_gemini ;;
    copilot) install_copilot ;;
    codex)   install_codex ;;
  esac
  echo ""
done

echo -e "  ${GREEN}Done!${NC} Invoke the skill with: /council-of-advisors"
echo ""
