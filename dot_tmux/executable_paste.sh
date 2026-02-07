#!/usr/bin/env sh
# Вставка из системного буфера: Wayland (wl-paste) или X11 (paste_x11.sh)
if [ -n "${WAYLAND_DISPLAY-}" ] && command -v wl-paste >/dev/null 2>&1; then
  wl-paste --no-newline 2>/dev/null
elif [ -n "${DISPLAY-}" ] && [ -x "$HOME/.tmux/paste_x11.sh" ]; then
  "$HOME/.tmux/paste_x11.sh"
fi
