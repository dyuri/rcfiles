# .bash_profile

CDPATH=$CDPATH:/mnt:/mnt/nagy
LD_LIBRARY_PATH=$DBROOT/lib:$LD_LIBRARY_PATH
USERNAME="dyuri"
JDK_HOME=/mnt/nagy/jdk
DICTIONARY=/usr/lib/ispell/magyar
BASH_ENV=$HOME/.bashrc
PYTHONPATH=/opt/python:$PYTHONPATH
export PATH CDPATH LD_LIBRARY_PATH USERNAME BASH_ENV JDK_HOME DICTIONARY PYTHONPATH

# export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:'
export LS_OPTIONS=' --color=auto -F -b -T 0'
# export PS1="\[\033[1;32m\][\u@\h \W]$\[\033[0m\] "

# export SDL_AUDIODRIVER="alsa"
# export AUDIODEV="default"
export EDITOR=nvim
export WINEDITOR=nvim

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

/usr/bin/naptar

# . /home/dyuri/.profabevjava

export PATH="$HOME/.poetry/bin:$PATH"

source /home/dyuri/.config/broot/launcher/bash/br
