#!/bin/bash
# Second-line status block (checkmark/cross diamond) for flyline, recreating
# the "status" segment of ~/config/zsh/repa.omp.json.
#
# Reads $FLYLINE_LAST_EXIT, which must be exported by a PROMPT_COMMAND hook
# *before* flyline starts (see .bashrc setup). Wired up via:
#   flyline create-prompt-widget custom --name FLYLINE_STATUS_BLOCK \
#       --command '$HOME/.config/flyline/prompt_status.sh' --block 100 --placeholder prev

fg() { printf '\e[38;2;%s;%s;%sm' "$1" "$2" "$3"; }
bg() { printf '\e[48;2;%s;%s;%sm' "$1" "$2" "$3"; }
RESET=$'\e[0m'

GREEN='184 187 38'
RED='251 73 52'
GRAY2='80 73 69'

# Nerd Font glyphs, given as raw UTF-8 byte escapes (safer than pasting the
# glyph itself): check = U+F00C, times = U+F00D, diamond ends = U+E0B6 / U+E0B4.
CHECK=$'\xef\x80\x8c'
CROSS=$'\xef\x80\x8d'
LEAD=''

code="${FLYLINE_LAST_EXIT:-0}"
if [[ "$code" == 0 ]]; then
    icon="$CHECK"
    color="$GREEN"
else
    icon="$CROSS"
    color="$RED"
fi

out=''
out+="$(fg $GRAY2)${LEAD}${RESET}"
out+="$(bg $GRAY2)$(fg $color) ${icon} ${RESET}"

printf '%s' "$out"
