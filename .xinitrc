# screen layout
# xrandr --output DVI-D-0 --mode 1920x1200 --pos 0x0 --rotate left --output HDMI-0 --primary --mode 1920x1200 --pos 1200x515 --rotate normal
# xrandr --output DVI-D-0 --mode 1920x1200 --rotate normal --output DisplayPort-0 --primary --mode 1920x1200 --rotate normal --right-of DVI-D-0
xrandr --output DisplayPort-0 --primary --mode 1920x1200 --rotate normal --output DisplayPort-1 --mode 1920x1200 --rotate normal --left-of DisplayPort-0

# billkiosztas
# setxkbmap hu; setxkbmap -option ctrl:nocaps; sleep 1;xmodmap ~/.xmodmaprc 2> /dev/null
# xmodmap ~/config/.xmodmap.capsoff 2> /dev/null
# xkbcomp ~/config/keyboard/repa.xkb $DISPLAY
xsetroot -cursor_name left_ptr
xset +dpms

# X resources
xrdb ~/.Xdefaults

# trayer
# trayer --edge top --align center --tint "#000000" --transparent true --monitor primary --widthtype request &
# => tint2
# tint2 &

# clipboard sync
parcellite &

# blueshift --configurations config/blueshift.conf &
redshift-gtk &

# logitech egerekhez
# solaar &

# wmname LG3D

# fitbit sync
#/usr/bin/galileo --config ~/config/fitbit.conf daemon &

# screenshot
flameshot &

# compositor
#compton -b
picom -b

# dunst - desktop notifications
dunst &

# background
feh --bg-scale ~/backgrounds/hatter.jpg

# /usr/bin/pulseaudio --start

setxkbmap repa dox

# exec /usr/bin/i3
exec qtile start > ~/.qtile.log
