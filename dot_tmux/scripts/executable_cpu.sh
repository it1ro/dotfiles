#!/bin/bash
# Лёгкий расчёт загрузки CPU по /proc/stat (без top)
# Два замера с минимальным интервалом для расчёта процента
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat
total1=$((user + nice + system + idle + iowait + irq + softirq + steal))
work1=$((user + nice + system))
sleep 0.25
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat
total2=$((user + nice + system + idle + iowait + irq + softirq + steal))
work2=$((user + nice + system))
if [ "$total2" -gt "$total1" ] && [ "$((total2 - total1))" -gt 0 ]; then
  pct=$(( (work2 - work1) * 100 / (total2 - total1) ))
  echo "${pct}%"
else
  echo "0%"
fi
