#!/usr/bin/env bash

OUT="nvim_audit.txt"

echo "=== NVIM CONFIG AUDIT ===" >"$OUT"
echo "Generated: $(date)" >>"$OUT"
echo "" >>"$OUT"

echo "=== SYSTEM INFO ===" >>"$OUT"
echo "Node: $(node -v 2>/dev/null)" >>"$OUT"
echo "npm: $(npm -v 2>/dev/null)" >>"$OUT"
echo "Ruby: $(ruby -v 2>/dev/null)" >>"$OUT"
echo "Gem: $(gem -v 2>/dev/null)" >>"$OUT"
echo "" >>"$OUT"

echo "=== ENVIRONMENT ===" >>"$OUT"
echo "PATH=$PATH" >>"$OUT"
echo "" >>"$OUT"

echo "=== NEOVIM PATHS ===" >>"$OUT"
echo "nvim --version:" >>"$OUT"
nvim --version >>"$OUT" 2>/dev/null
echo "" >>"$OUT"

echo "=== DIRECTORY TREE ===" >>"$OUT"
tree -a . >>"$OUT" 2>/dev/null
echo "" >>"$OUT"

echo "=== FILE CONTENTS ===" >>"$OUT"
find . -type f \( -name "*.lua" -o -name "*.vim" -o -name "*.json" -o -name "*.toml" \) | while read -r file; do
  echo "--- FILE: $file ---" >>"$OUT"
  sed 's/^/    /' "$file" >>"$OUT"
  echo "" >>"$OUT"
done

echo "=== MASON LOGS ===" >>"$OUT"
MASON_LOG="$HOME/.local/share/nvim/mason.log"
if [ -f "$MASON_LOG" ]; then
  sed 's/^/    /' "$MASON_LOG" >>"$OUT"
else
  echo "No mason.log found" >>"$OUT"
fi

echo "" >>"$OUT"
echo "=== DONE ===" >>"$OUT"

echo "Аудит сохранён в $OUT"
