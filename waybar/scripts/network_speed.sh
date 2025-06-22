#!/bin/bash

IFACE=$(for iface in /sys/class/net/*; do
  name=$(basename $iface)
  rx1=$(cat $iface/statistics/rx_bytes)
  sleep 1
  rx2=$(cat $iface/statistics/rx_bytes)
  diff=$((rx2 - rx1))
  echo "$diff $name"
done | sort -nr | head -n1 | awk '{print $2}')

# Exit if interface is not found
if [ ! -d "/sys/class/net/$IFACE" ]; then
  echo '{"text": "<span size=\"11000\" foreground=\"#f5e0dc\"></span>", "tooltip": "No network connection"}'
  exit
fi

RX_PREV=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_PREV=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

sleep 3

RX_NEXT=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX_NEXT=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

RX_RATE=$((RX_NEXT - RX_PREV))
TX_RATE=$((TX_NEXT - TX_PREV))

# Convert to KB/s with 1 decimal
RX_KB=$(awk "BEGIN { printf \"%.1f\", $RX_RATE / 1024 }")
TX_KB=$(awk "BEGIN { printf \"%.1f\", $TX_RATE / 1024 }")

# Auto-format: if over 1024 KB, switch to MB/s
if (($(echo "$RX_KB < 0.5" | bc -l))); then
  RX_SPEED="Idle"
fi
if (($(echo "$RX_KB > 1024" | bc -l))); then
  RX_SPEED=$(awk "BEGIN { printf \"%.1f MB/s\", $RX_KB / 1024 }")
else
  RX_SPEED="${RX_KB} KB/s"
fi

if (($(echo "$TX_KB > 1024" | bc -l))); then
  TX_SPEED=$(awk "BEGIN { printf \"%.1f MB/s\", $TX_KB / 1024 }")
else
  TX_SPEED="${TX_KB} KB/s"
fi

printf '{ "text": "<span size=\\"8500\\" ></span>", "tooltip": "Download: %s  |  Upload: %s" }\n' "$RX_SPEED" "$TX_SPEED"
