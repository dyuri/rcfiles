# billkiosztas
# setxkbmap hu; setxkbmap -option ctrl:nocaps; sleep 1;xmodmap ~/.xmodmaprc 2> /dev/null
# xmodmap ~/config/.xmodmap.capsoff 2> /dev/null
xkbcomp ~/config/repa.xkb $DISPLAY
xsetroot -cursor_name left_ptr

# parcellite &

blueshift --configurations config/blueshift.conf &

/usr/bin/pulseaudio --start &

wmname LG3D

# fitbit sync
/usr/bin/galileo --config ~/config/fitbit.conf daemon &

# background
# feh --bg-scale ~/backgrounds/hatter.jpg

# exec /usr/bin/qtile
exec /usr/bin/enlightenment_start
