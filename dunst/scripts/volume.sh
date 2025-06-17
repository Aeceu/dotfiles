#!/bin/bash

# Control volume
if [[ "$1" == "up" ]]; then
  wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
elif [[ "$1" == "down" ]]; then
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
elif [[ "$1" == "mute" ]]; then
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi

VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
IS_MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo true || echo false)

BAR_WIDTH=34
FILLED_COUNT=$((VOLUME * BAR_WIDTH / 100))
EMPTY_COUNT=$((BAR_WIDTH - FILLED_COUNT))
FILLED=$([ "$FILLED_COUNT" -gt 0 ] && printf '█%.0s' $(seq 1 $FILLED_COUNT))
EMPTY=$([ "$EMPTY_COUNT" -gt 0 ] && printf '░%.0s' $(seq 1 $EMPTY_COUNT))
ASCII_BAR="${FILLED}${EMPTY}"

if [[ $IS_MUTED == true ]]; then
  ICON=""
  MSG="Muted"
else
  if [ "$VOLUME" -eq 0 ]; then
    ICON=""
  elif [ "$VOLUME" -lt 33 ]; then
    ICON=""
  elif [ "$VOLUME" -lt 66 ]; then
    ICON=""
  else
    ICON=" "
  fi
  MSG="${ASCII_BAR}\n"
fi

dunstify -a "Volume" -u low -r 9993 "$ICON Volume ${VOLUME}%" "$MSG"
