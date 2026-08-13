#!/bin/bash
# Left-prompt block 1 for flyline, recreating the session/path/jj/root
# segments of ~/config/zsh/repa.omp.json as a flyline custom prompt widget.
#
# Wired up via:
#   flyline create-prompt-widget custom --name FLYLINE_LEFT_BLOCK1 \
#       --command '$HOME/.config/flyline/prompt_block1.sh' --block 200 --placeholder prev
# and used in PS1 as: PS1='FLYLINE_LEFT_BLOCK1\n...'
#
# Runs as a plain child process spawned directly by flyline (no shell/bash
# job-control involved), so it can't race with other subprocesses flyline
# manages -- unlike a literal $(...) embedded straight in PS1.

SEP=$''

fg() { printf '\e[38;2;%s;%s;%sm' "$1" "$2" "$3"; }
bg() { printf '\e[48;2;%s;%s;%sm' "$1" "$2" "$3"; }
RESET=$'\e[0m'

# Palette (from repa.omp.json)
BLACK='29 31 33'
GREEN='184 187 38'
GRAY2='80 73 69'
YELLOW='250 189 47'
WHITE='235 219 178'
JJ_BG='255 235 59'
JJ_FG='25 53 73'
GIT_BG='131 165 152'
GIT_FG='29 31 33'

out=''
prev_bg=''      # RGB triple of the previously emitted segment's background

emit_sep() {
    # $1 = fg (prev bg), $2 = bg (this segment's bg), $3 = whether previous
    # segment requested a separator glyph before it (1/0)
    if [[ -n "$1" ]]; then
        out+="$(fg $1)$(bg $2)${SEP}${RESET}"
    fi
}

# --- session segment: [ssh icon] hostname ---
ssh_icon=''
[[ -n "$SSH_CONNECTION$SSH_TTY" ]] && ssh_icon=$' '
out+="$(bg $GREEN)$(fg $BLACK) ${ssh_icon}$(hostname) ${RESET}"
prev_bg=$GREEN

# --- path segment: agnoster_short, max_depth 2, hide root/home ---
path="$PWD"
if [[ "$path" == "$HOME" ]]; then
    path='~'
elif [[ "$path" == "$HOME"/* ]]; then
    path="~${path#"$HOME"}"
fi
IFS='/' read -ra parts <<< "$path"
clean=()
for p in "${parts[@]}"; do [[ -n "$p" ]] && clean+=("$p"); done
n=${#clean[@]}
if (( n > 2 )); then
    short="…/${clean[n-2]}/${clean[n-1]}"
else
    short="$path"
fi
emit_sep "$prev_bg" "$GRAY2"
out+="$(bg $GRAY2)$(fg $GREEN) ${short} ${RESET}"
prev_bg=$GRAY2

# --- jujutsu segment (only inside a jj repo) ---
if command -v jj >/dev/null 2>&1 && jj root >/dev/null 2>&1; then
    IFS='|' read -r change_id is_dirty is_conflict < <(
        jj log -r @ --no-graph --ignore-working-copy -T \
            'change_id.shortest(8) ++ "|" ++ if(empty, "0", "1") ++ "|" ++ if(conflict, "1", "0")' \
            2>/dev/null
    )
    if [[ -n "$change_id" ]]; then
        # Nearest ancestor (or @ itself) that carries a bookmark, preferred
        # over the raw change id since bookmarks are used like git branches.
        IFS='|' read -r bm_change_id bookmarks < <(
            jj log -r 'heads(::@ & bookmarks())' --no-graph --ignore-working-copy -T \
                'change_id.shortest(8) ++ "|" ++ bookmarks.join(",") ++ "\n"' \
                2>/dev/null | head -1
        )
        if [[ -n "$bookmarks" ]]; then
            label="$bookmarks"
            if [[ "$bm_change_id" != "$change_id" ]]; then
                ahead=$(jj log -r "${bm_change_id}..@" --no-graph --ignore-working-copy -T '"x"' 2>/dev/null | wc -c)
                label+="+${ahead}"
            fi
        else
            label="$change_id"
        fi
        [[ "$is_dirty" == 1 ]] && label+=' *'
        [[ "$is_conflict" == 1 ]] && label+=' !'
        emit_sep "$prev_bg" "$JJ_BG"
        out+="$(bg $JJ_BG)$(fg $JJ_FG) 󰀱 ${label} ${RESET}"
        prev_bg=$JJ_BG
    fi

# --- git segment (only inside a git repo that isn't also a jj repo) ---
elif command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null)
    [[ -z "$branch" ]] && branch=$(git rev-parse --short HEAD 2>/dev/null)
    if [[ -n "$branch" ]]; then
        label="$branch"
        [[ -n "$(git status --porcelain 2>/dev/null)" ]] && label+=' *'
        [[ -n "$(git ls-files -u 2>/dev/null)" ]] && label+=' !'
        emit_sep "$prev_bg" "$GIT_BG"
        out+="$(bg $GIT_BG)$(fg $GIT_FG) ${label} ${RESET}"
        prev_bg=$GIT_BG
    fi
fi

# --- root segment (only when running as root) ---
if [[ "$EUID" == 0 ]]; then
    emit_sep "$prev_bg" "$YELLOW"
    out+="$(bg $YELLOW)$(fg $WHITE)  ${RESET}"
    prev_bg=$YELLOW
fi

# --- closing separator into the terminal's default background ---
if [[ -n "$prev_bg" ]]; then
    out+="$(fg $prev_bg)${SEP}${RESET}"
fi

printf '%s' "$out"
