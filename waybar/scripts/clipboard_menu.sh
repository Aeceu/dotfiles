#!/bin/bash

cliphist list | while read -r item; do
  display_item="$item"
  [[ ${#display_item} -gt 80 ]] && display_item="${display_item:0:77}…"

  if echo "$item" | grep -qE '\.(png|jpe?g|gif|webp|svg)$'; then
    echo " $(basename "$item")"
  elif echo "$item" | grep -qE '\.(mp4|mkv|avi)$'; then
    echo " $(basename "$item")"
  elif echo "$item" | grep -qE '\.(pdf|zip|tar\.gz)$'; then
    echo " $(basename "$item")"
  elif echo "$item" | grep -qE '\.(txt|md|log)$'; then
    echo " $(basename "$item")"
  elif echo "$item" | grep -qE '^/.*'; then
    echo " $(basename "$item")"
  else
    echo " $display_item"
  fi
done | rofi -dmenu -theme ~/.config/rofi/clipboard-config.rasi | while read -r selected; do
  # Match the original content from cliphist
  original_item=$(cliphist list | grep -F "$selected" | head -n 1)
  [[ -z "$original_item" ]] && original_item=$(cliphist list | grep -F "${selected:2}" | head -n 1)

  if [[ -n "$original_item" ]]; then
    echo "$original_item" | wl-copy

    # Truncate for notification display
    truncated="$(echo "$original_item" | head -c 120)"
    dunstify -u low -r 91190 "  Copied to clipboard" "$truncated"
  fi
done
