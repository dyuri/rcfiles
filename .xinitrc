# billkiosztas
# setxkbmap hu; setxkbmap -option ctrl:nocaps; sleep 1;xmodmap ~/.xmodmaprc 2> /dev/null
# xmodmap ~/config/.xmodmap.capsoff 2> /dev/null
xkbcomp ~/config/repa.xkb $DISPLAY
xsetroot -cursor_name left_ptr
xset +dpms

# X resources
xrdb ~/.Xdefaults

# parcellite &

# blueshift --configurations config/blueshift.conf &
redshift-gtk &

# logitech egerekhez
# solaar &

wmname LG3D

# fitbit sync
#/usr/bin/galileo --config ~/config/fitbit.conf daemon &

# screenshot
flameshot &

# compositor
compton -b

# dunst - desktop notifications
dunst &

# background
feh --bg-scale ~/backgrounds/hatter.png

/usr/bin/pulseaudio --start &

# exec /usr/bin/i3
exec /usr/bin/qtile > ~/.qtile.log
# exec /usr/bin/enlightenment_start
