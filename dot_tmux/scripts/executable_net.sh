#!/bin/bash
INTERFACE=wlan0
if [ -z "$INTERFACE" ] || [ ! -d "/sys/class/net/$INTERFACE" ]; then
  echo "N/A"
  exit 0
fi
RX_FILE="/sys/class/net/$INTERFACE/statistics/rx_bytes"
TX_FILE="/sys/class/net/$INTERFACE/statistics/tx_bytes"
read rx1 <"$RX_FILE"
read tx1 <"$TX_FILE"
sleep 1
read rx2 <"$RX_FILE"
read tx2 <"$TX_FILE"
rx_diff=$((rx2 - rx1))
tx_diff=$((tx2 - tx1))
rx_kbps=$(echo "$rx_diff / 1024" | bc -l)
tx_kbps=$(echo "$tx_diff / 1024" | bc -l)
rx_kbps=$(printf "%.0f" "$rx_kbps")
tx_kbps=$(printf "%.0f" "$tx_kbps")
echo "↓${rx_kbps}k ↑${tx_kbps}k"
