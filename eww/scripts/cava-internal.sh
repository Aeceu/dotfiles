#!/bin/bash

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"

# Create dictionary for cava output
i=0
while [ $i -lt ${#bar} ]; do
  dict="${dict}s/$i/${bar:$i:1} /g;"
  i=$((i + 1))
done

# Clean up old pipe
pipe="/tmp/cava.fifo"
[ -p "$pipe" ] && unlink "$pipe"
mkfifo "$pipe"

# Cava config with stereo channel
printf "[general]\nframerate=60\nbars=10\nbar_height=200\nbar_width=1\nsleep_timer=3\n\
[output]\nmethod=raw\nraw_target=/dev/stdout\ndata_format=ascii\nascii_max_range=7\n\
channels=stereo\nreverse=0\n" |
  cava -p /dev/stdin | sed -u "$dict"
