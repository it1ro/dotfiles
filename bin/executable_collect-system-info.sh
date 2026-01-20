#!/usr/bin/env bash

set -euo pipefail

echo "=== SYSTEM INFO ==="
uname -a
lsb_release -a 2>/dev/null || true
echo

echo "=== PACKAGE MANAGER ==="
command -v pacman && echo "pacman detected"
command -v apt && echo "apt detected"
command -v dnf && echo "dnf detected"
command -v brew && echo "brew detected"
echo

echo "=== INSTALLED SHELLS ==="
command -v zsh && echo "zsh installed"
command -v bash && echo "bash installed"
command -v fish && echo "fish installed"
echo

echo "=== TERMINAL EMULATORS ==="
command -v alacritty && echo "alacritty installed"
command -v kitty && echo "kitty installed"
command -v wezterm && echo "wezterm installed"
command -v ghostty && echo "ghostty installed"
echo

echo "=== EDITORS ==="
command -v nvim && echo "neovim installed"
command -v vim && echo "vim installed"
command -v code && echo "VS Code installed"
command -v cursor && echo "Cursor installed"
echo

echo "=== DEV TOOLS ==="
command -v git && echo "git installed"
command -v gh && echo "gh installed"
command -v delta && echo "delta installed"
command -v fd && echo "fd installed"
command -v rg && echo "ripgrep installed"
command -v bat && echo "bat installed"
command -v lazygit && echo "lazygit installed"
command -v tmux && echo "tmux installed"
command -v just && echo "just installed"
command -v direnv && echo "direnv installed"
command -v atuin && echo "atuin installed"
echo

echo "=== DOTFILES PRESENT ==="
[ -f ~/.zshrc ] && echo "~/.zshrc"
[ -f ~/.p10k.zsh ] && echo "~/.p10k.zsh"
[ -f ~/.tmux.conf ] && echo "~/.tmux.conf"
[ -f ~/.gitconfig ] && echo "~/.gitconfig"
[ -f ~/.gitignore_global ] && echo "~/.gitignore_global"
[ -d ~/.config/nvim ] && echo "~/.config/nvim"
[ -d ~/.config/alacritty ] && echo "~/.config/alacritty"
[ -d ~/bin ] && echo "~/bin"
[ -d ~/.local/bin ] && echo "~/.local/bin"
echo

echo "=== DIRECTORIES TO CREATE ==="
[ ! -d ~/bin ] && echo "~/bin missing"
[ ! -d ~/.local/bin ] && echo "~/.local/bin missing"
[ ! -d ~/.config ] && echo "~/.config missing"
echo

echo "=== SSH / GPG ==="
[ -f ~/.ssh/config ] && echo "~/.ssh/config exists"
[ -d ~/.gnupg ] && echo "~/.gnupg exists"
echo

echo "=== FINISHED ==="
