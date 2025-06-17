#!/bin/bash

choice=$(echo -e "⏻ Power Off\n Reboot\n Lock\n󰍃 Logout\n❌ Cancel" | wofi --dmenu --width 250 --height 200 --hide-scroll --prompt "Power Menu")

case "$choice" in
"⏻ Power Off") systemctl poweroff ;;
" Reboot") systemctl reboot ;;
" Lock") loginctl lock-session ;;
"󰍃 Logout") hyprctl dispatch exit ;;
*) exit 0 ;;
esac
