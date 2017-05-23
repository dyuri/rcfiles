# .bashrc

# User specific aliases and functions

PATH=/mnt/nagy/jdk/bin:$PATH:$HOME/bin:/usr/sbin:/sbin:/mnt/nagy/eclipse:/usr/games:.
CDPATH=$CDPATH:/mnt:/mnt/nagy
LD_LIBRARY_PATH=$DBROOT/lib:$LD_LIBRARY_PATH
USERNAME="dyuri"
JDK_HOME=/mnt/nagy/jdk
DICTIONARY=/usr/lib/ispell/magyar
BASH_ENV=$HOME/.bashrc
PYTHONPATH=/opt/python:$PYTHONPATH
export PATH CDPATH LD_LIBRARY_PATH USERNAME BASH_ENV JDK_HOME DICTIONARY PYTHONPATH

# alias whois='whois -h whois.ripe.net'
alias ls='ls --color'
alias ll='ls -la'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:'
export LS_OPTIONS=' --color=auto -F -b -T 0'
# export PS1="\[\033[1;32m\][\u@\h \W]$\[\033[0m\] "
export PS1='\[\033[22;34m\][\[\033[1;33m\]\u\[\033[22;34m\]@\[\033[1;24;32m\]\h \[\033[1;36m\]\w\[\033[22;34m\] ]==--\n\[\033[32m\][\t]\$\[\033[0m\] '
case $TERM in
  xterm*|Eterm|rxvt*)
    export PROMPT_COMMAND='echo -ne "\033]0;RePa[${PWD/#$HOME/-}]\007"'
    ;;
  dtterm)
    export TERM=xterm-color
    export PROMPT_COMMAND='echo -ne "\033]0;RePa[${PWD/#$HOME/-}]\007"'
    ;;
esac

export SDL_AUDIODRIVER="alsa"
export AUDIODEV="default"
export EDITOR=/usr/bin/vim
export WINEDITOR=/usr/bin/gvim

alias vi='/usr/bin/gvim'
alias gvim='/usr/bin/gvim'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
