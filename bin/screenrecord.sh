#!/bin/bash
# for second monitor: -i $DISPLAY+0,0

slop=$(slop -f "%x %y %w %h %g %i") || exit 1
read -r X Y W H G ID < <(echo $slop)

ffmpeg -f x11grab -s "$W"x"$H" -i $DISPLAY+$X,$Y -c:v libx264 -preset ultrafast -qp 0 $1
