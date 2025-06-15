#!/bin/bash

CACHE=~/.cache/waybar-brightness
DAY=80
NIGHT=10

# Read from cache or assume DAY
if [[ -f "$CACHE" ]]; then
  CURRENT=$(<"$CACHE")
else
  CURRENT=$DAY
fi

# Toggle brightness
if [[ "$CURRENT" -gt 50 ]]; then
  NEW=$NIGHT
else
  NEW=$DAY
fi

# Apply new brightness and update cache
ddcutil --display 1 --sleep-multiplier=0 setvcp 10 "$NEW" >/dev/null 2>&1 && echo "$NEW" >"$CACHE"
