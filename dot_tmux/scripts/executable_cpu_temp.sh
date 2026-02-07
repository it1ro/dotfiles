#!/bin/bash

temp=$(sensors 2>/dev/null |
  grep -E 'Package id 0' |
  grep -oE '[0-9]+\.[0-9]+°C|[0-9]+°C' |
  head -n 1)

if [ -z "$temp" ]; then
  temp=$(sensors 2>/dev/null |
    grep -E 'CPU:' |
    grep -oE '[0-9]+\.[0-9]+°C|[0-9]+°C' |
    head -n 1)
fi

if [ -z "$temp" ]; then
  echo "N/A"
  exit 0
fi

value=${temp%C}
value_int=${value%.*}

if [ "$value_int" -lt 60 ]; then
  color="#[fg=green]"
elif [ "$value_int" -lt 80 ]; then
  color="#[fg=yellow]"
else
  color="#[fg=red]"
fi

echo "${color}${value}#[default]"
