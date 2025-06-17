#!/bin/bash

ICON=""
GUI_RUNNING=false
DAEMON_RUNNING=false
CONTAINERS_RUNNING=false

# Check GUI
if pgrep -f "Docker Desktop" >/dev/null; then
  GUI_RUNNING=true
fi

# Check daemon (suppress error spam)
if docker desktop status 2>/dev/null | grep -q "running"; then
  DAEMON_RUNNING=true
fi

# Check running containers
if docker ps -q 2>/dev/null | grep -q .; then
  CONTAINERS_RUNNING=true
fi

# Icon color logic
if $GUI_RUNNING; then
  if $CONTAINERS_RUNNING; then
    COLOR="#f38ba8" # red: containers running
    TOOLTIP="Docker Desktop + Containers running"
  else
    COLOR="#a6e3a1" # green: only Docker GUI
    TOOLTIP="Docker Desktop running (no containers)"
  fi
elif $DAEMON_RUNNING; then
  COLOR="#89dceb" # blue: daemon running, GUI not
  TOOLTIP="Docker daemon running without GUI"
else
  COLOR="#6c7086" # gray
  TOOLTIP="Docker is stopped"
fi

echo "{\"text\": \"<span color='${COLOR}'>${ICON}</span>\", \"tooltip\": \"${TOOLTIP}\"}"
