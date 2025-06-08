#!/bin/bash
output=$(cat /tmp/updates_info.txt 2>/dev/null)

# Only print if not empty
if [[ -n "$output" ]]; then
  echo "$output"
fi
