#!/bin/env bash

SCREENS="DisplayPort-0"

rofi_command="rofi -theme ~/config/repamenu/themes/menu/screen.rasi"

## Icons
ICON_NORMAL=""
ICON_NIGHT=""
ICON_GAMER=""
ICON_OFF="ﴹ"
ICON_PICK=""
ICON_SSHOT=""
ICON_SSHOT3=""
ICON_1=""
ICON_2=""

options="$ICON_OFF\n$ICON_NIGHT\n$ICON_GAMER\n$ICON_NORMAL\n$ICON_SSHOT\n$ICON_SSHOT3\n$ICON_PICK\n$ICON_2\n$ICON_1"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "Screen tools" -dmenu -selected-row 4)"
case $chosen in
  $ICON_NORMAL)
    for screen in $SCREENS; do
      xrandr --output $screen --gamma 1.0
    done
    ;;
  $ICON_NIGHT)
    redshift -O 4600
    ;;
  $ICON_GAMER)
    for screen in $SCREENS; do
      xrandr --output $screen --gamma 1.4
    done
    ;;
  $ICON_OFF)
    xset dpms force off
    ;;
  $ICON_PICK)
    xcolor | xsel -p
    ;;
  $ICON_SSHOT)
    flameshot gui
    ;;
  $ICON_SSHOT3)
    sleep 3; flameshot gui
    ;;
  $ICON_2)
    xrandr --output VGA-0 --off --output DVI-D-0 --mode 1920x1200 --pos 0x0 --rotate left --output DisplayPort-0 --primary --mode 1920x1200 --pos 1200x515 --rotate normal
    ;;
  $ICON_1)
    xrandr --output VGA-0 --off --output DVI-D-0 --off --output DisplayPort-0 --primary --mode 1920x1200 --pos 1200x515 --rotate normal
    ;;
esac

