#!/bin/bash
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//' | xargs printf "%.0f")
echo "${cpu_usage}%"
