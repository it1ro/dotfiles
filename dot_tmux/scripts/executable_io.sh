#!/bin/bash
# ~/.tmux/scripts/io.sh

# Используем временные файлы в /tmp с уникальным именем
tmp1="/tmp/tmux_io_$$"
tmp2="/tmp/tmux_io_$$2"

# Первое чтение
awk '{r += $4; w += $8} END {print r+0, w+0}' /proc/diskstats 2>/dev/null >"$tmp1" || echo "0 0" >"$tmp1"
sleep 0.5
# Второе чтение
awk '{r += $4; w += $8} END {print r+0, w+0}' /proc/diskstats 2>/dev/null >"$tmp2" || echo "0 0" >"$tmp2"

read r1 w1 <"$tmp1"
read r2 w2 <"$tmp2"

# Защита от пустых значений
r1=${r1:-0}
w1=${w1:-0}
r2=${r2:-0}
w2=${w2:-0}

r_diff=$((r2 - r1))
w_diff=$((w2 - w1))

# Сектора → килобайты (1 сектор = 512 байт → /2 = kB)
r_kbs=$((r_diff / 2))
w_kbs=$((w_diff / 2))

# Защита от отрицательных значений (при перезагрузке счётчиков)
[ $r_kbs -lt 0 ] && r_kbs=0
[ $w_kbs -lt 0 ] && w_kbs=0

echo "R:${r_kbs}k W:${w_kbs}k"

# Уборка
rm -f "$tmp1" "$tmp2"
