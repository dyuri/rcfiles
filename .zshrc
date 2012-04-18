#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#set emacs (normal bash like) keybindings
bindkey -e

#set vi like keybindings
#bindkey -v

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
# setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS

## never ever beep ever
setopt NO_BEEP

## spelling correction
setopt correct

## automatically decide when to page a list of completions
#LISTMAX=0

### a zshwikibol
## These next 2 lines are from compinstall.
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

### Use cache
## Some functions, like _apt and _dpkg, are very slow. You can use a cache in
## order to proxy the list of results (like the list of available debian
## packages)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

## Prevent CVS files/directories from being completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# Allow zsh to complete on hostnames found in common config files.
local _myhosts;
_myhosts=( ${${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ }:#\!*}
           ${=${(f)"$(cat /etc/hosts(|)(N))"}%%\#*}
         );
zstyle ':completion:*' hosts $_myhosts;

## extended history
setopt extended_history

## konyvtarak elrakasa
setopt auto_pushd
DIRSTACKSIZE=50

## watch logins
watch=all
logcheck=30
WATCHFMT="%n from %M has %a %l at %T %W"

## From resolve's config (http://repose.cx/conf/.zshrc)
setopt extended_glob            # Weird & wacky pattern matching - yay zsh!
setopt always_to_end            # When complete from middle, move cursor
setopt interactive_comments     # Escape commands so I can use them later

### idaig

# autoload -U colors
#colors

# Sajat cuccok

alias ls="ls ${LS_OPTIONS}"
alias ll='ls -la'
alias vi='/usr/bin/gvim'
alias rvim='/usr/bin/gvim --remote-silent'
alias jsonpp='python -mjson.tool'
#alias search='find . -print0 | xargs -0 -- grep'
alias search=ack
alias vless='/usr/share/vim/vim??/macros/less.sh'

# prompt
. ~/.zshprompt

