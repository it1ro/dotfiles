#!/bin/bash
sensors coretemp-isa-0000 2>/dev/null | grep -m 1 -oP '\d°C' | head -c -2 || echo "N/A"
