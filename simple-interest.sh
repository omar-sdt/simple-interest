#!/usr/bin/env bash
# Simple interest calculator; rate is entered as an annual percentage.
set -euo pipefail
read -r -p "Enter principal amount: " principal
read -r -p "Enter annual rate of interest (%): " rate
read -r -p "Enter time period in years: " years
for value in "$principal" "$rate" "$years"; do
  if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    printf 'Error: enter non-negative numeric values.\n' >&2
    exit 1
  fi
done
awk -v p="$principal" -v r="$rate" -v t="$years" 'BEGIN {printf "Simple interest = %.2f\n", p*r*t/100}'
