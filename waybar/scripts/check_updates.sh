#!/bin/bash

# Get number of official (pacman) and AUR (yay) updates
pacman_updates=$(checkupdates 2>/dev/null | wc -l)
aur_updates=$(yay -Qmu 2>/dev/null | wc -l)

# Total updates
total=$((pacman_updates + aur_updates))

# Pacman icon (requires Nerd Fonts)
icon="󰮯 "

# Output format: 6[] or empty if no updates
if [ "$total" -gt 0 ]; then
  echo "${icon}${total}"
else
  echo ""
fi
