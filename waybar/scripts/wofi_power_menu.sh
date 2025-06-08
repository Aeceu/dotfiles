#!/bin/bash

CHOICE=$(
  wofi --show dmenu \
    --prompt "Power Menu" \
    --style ~/.config/wofi/power-style.css \
    --width 400 --height 260 <<EOF
⏻ Power Off
 Reboot
 Lock
󰍃 Logout
❌ Cancel
EOF
)

case "$CHOICE" in
"⏻ Power Off") systemctl poweroff ;;
" Reboot") systemctl reboot ;;
" Lock") loginctl lock-session ;;
"󰍃 Logout") hyprctl dispatch exit || pkill Hyprland ;;
*) exit 0 ;;
esac
