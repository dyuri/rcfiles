# .bashrc

# User specific aliases and functions

# PATH=/mnt/nagy/jdk/bin:$PATH:$HOME/bin:$HOME/.local/bin/:/usr/sbin:/sbin:/mnt/nagy/eclipse:/usr/games:.

# alias whois='whois -h whois.ripe.net'
alias ls='ls --color'
alias ll='ls -la'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source /home/dyuri/.config/broot/launcher/bash/br
