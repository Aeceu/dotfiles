#!/bin/bash

state=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
connected=$(bluetoothctl info | grep "Connected" | awk '{print $2}')

if [[ "$state" == "yes" ]]; then
  icon=""
  tooltip="Bluetooth is On"
  if [[ "$connected" == "yes" ]]; then
    device=$(bluetoothctl info | grep "Name" | awk -F ': ' '{print $2}')
    tooltip+="\nConnected to: $device"
  else
    tooltip+="\nNo device connected"
  fi
else
  icon=""
  tooltip="Bluetooth is Off"
fi

echo "{\"icon\": \"$icon\", \"tooltip\": \"$tooltip\"}"
