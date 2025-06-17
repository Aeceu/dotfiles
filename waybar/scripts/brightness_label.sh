#!/bin/bash

CACHE=~/.cache/waybar-brightness
[[ -f "$CACHE" ]] && BRIGHT=$(<"$CACHE") || BRIGHT=100

# Choose icon and color
if [[ "$BRIGHT" -le 40 ]]; then
  ICON='<span size="11000" >󰖔</span>' # night
else
  ICON='<span size="11000" >󰖙</span>' # day
fi

# Escape double quotes inside the JSON value
ICON_ESCAPED=$(printf '%s' "$ICON" | sed 's/"/\\"/g')

# Output valid JSON
echo "{\"text\": \"${ICON_ESCAPED}\", \"tooltip\": \"Brightness: ${BRIGHT}%\"}"
