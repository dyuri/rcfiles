#!/bin/bash
# for second monitor: -i $DISPLAY+0,0

ffmpeg -f x11grab -video_size 1920x1200 -framerate 25 -i $DISPLAY -c:v libx264 -preset ultrafast $1
