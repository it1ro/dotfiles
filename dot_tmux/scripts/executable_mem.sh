#!/bin/bash

# Получаем общую и использованную память в байтах
total_bytes=$(free -b | awk 'NR==2{print $2}')
used_bytes=$(free -b | awk 'NR==2{print $3}')

# Конвертируем в гигабайты с точностью до 1 знака после запятой
total_gb=$(awk "BEGIN {printf \"%.1f\", ${total_bytes}/1073741824}")
used_gb=$(awk "BEGIN {printf \"%.1f\", ${used_bytes}/1073741824}")

echo "${used_gb}/${total_gb}G"
