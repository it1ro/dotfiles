#!/bin/bash

# Ensure we are inside a git repository
if [ ! -d ".git" ]; then
  echo "❌ This directory is not a git repository."
  exit 1
fi

HOOKS_DIR=".git/hooks"

echo "📌 Installing git hooks into $HOOKS_DIR"

# --- pre-commit hook ---
cat >"$HOOKS_DIR/pre-commit" <<'EOF'
#!/bin/sh
branch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$branch" = "main" ] || [ "$branch" = "develop" ]; then
  echo "❌ Direct commits to $branch are not allowed."
  echo "   Create a feature/* branch instead."
  exit 1
fi
EOF

# --- pre-push hook ---
cat >"$HOOKS_DIR/pre-push" <<'EOF'
#!/bin/sh
branch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$branch" = "main" ] || [ "$branch" = "develop" ]; then
  echo "❌ Direct push to $branch is not allowed."
  echo "   Push only feature/*, release/* or hotfix/* branches."
  exit 1
fi
EOF

# Make both hooks executable
chmod +x "$HOOKS_DIR/pre-commit"
chmod +x "$HOOKS_DIR/pre-push"

echo "✅ Hooks installed and activated."
echo "   Commits and pushes to main/develop are now blocked locally."
