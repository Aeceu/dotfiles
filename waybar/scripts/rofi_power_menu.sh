#!/bin/bash

# Define options
options=(
  "⏻  Shutdown"
  "  Restart"
  "  Lock"
  "󰍃  Logout"
  "❌ Cancel"
)

# Show menu
choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "Power Menu" -theme ~/.config/rofi/power-menu-config.rasi)

# Handle selection
case "$choice" in
"⏻  Shutdown") systemctl poweroff ;;
"  Restart") systemctl reboot ;;
"  Lock") loginctl lock-session ;;
"󰍃  Logout") hyprctl dispatch exit || pkill Hyprland ;;
*) exit 0 ;;
esac
