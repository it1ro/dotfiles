#!/bin/bash
# Трафик интерфейса по умолчанию без sleep: храним предыдущие значения в /tmp
INTERFACE=$(ip route show default 2>/dev/null | awk '/default/ {print $5}' | head -1)
if [ -z "$INTERFACE" ] || [ ! -d "/sys/class/net/$INTERFACE" ]; then
  echo "N/A"
  exit 0
fi
RX_FILE="/sys/class/net/$INTERFACE/statistics/rx_bytes"
TX_FILE="/sys/class/net/$INTERFACE/statistics/tx_bytes"
CACHE="/tmp/tmux_net_${INTERFACE}"
read -r rx_cur <"$RX_FILE"
read -r tx_cur <"$TX_FILE"
if [ -f "$CACHE" ]; then
  read -r rx_prev tx_prev <"$CACHE"
  rx_diff=$((rx_cur - rx_prev))
  tx_diff=$((tx_cur - tx_prev))
  [ "$rx_diff" -lt 0 ] && rx_diff=0
  [ "$tx_diff" -lt 0 ] && tx_diff=0
  rx_kbps=$(printf "%.0f" "$(echo "$rx_diff / 1024 / 5" | bc -l 2>/dev/null || echo 0)")
  tx_kbps=$(printf "%.0f" "$(echo "$tx_diff / 1024 / 5" | bc -l 2>/dev/null || echo 0)")
  echo "↓${rx_kbps}k ↑${tx_kbps}k"
else
  echo "↓0k ↑0k"
fi
echo "$rx_cur $tx_cur" >"$CACHE"
