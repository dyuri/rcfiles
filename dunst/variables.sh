#!/usr/bin/env bash
# www.jrodal.dev

# Some variables you may want to change
# in particular, make sure that SCREENSHOT_DIR is set to the directory that you wish to store screenshots in.

SCREENSHOT_DIR=$HOME/alma/
ACTIONS_PATH=$HOME/.config/dunst/screenshot_actions.sh

ERROR_ICON=/usr/share/icons/Adwaita/32x32/legacy/emblem-important.png
CAMERA_ICON=/usr/share/icons/Adwaita/32x32/legacy/applets-screenshooter.png

############################ Some Functions #################################################

function send_error() {
	dunstify -u critical -i "$ERROR_ICON" "Screenshot Actions Error" "$1"
}
