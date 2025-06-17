#!/bin/bash

# Unicode bars
bars="▁▂▃▄▅▆▇█"

# Build sed dict for bar conversion
dict="s/;//g"
for i in {0..7}; do
  dict+=";s/$i/${bars:$i:1}/g"
done

# Path to config file
config_file="$HOME/.config/waybar/scripts/cava_config"

# Kill existing cava instance
pkill -f "cava -p $config_file"

# Run cava with transformation
cava -p "$config_file" | sed -u "$dict"
