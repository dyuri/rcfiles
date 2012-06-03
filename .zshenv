# .zshenv - zsh enviroment variables

PATH=/opt/repa/bin:/opt/java/bin:/opt/node/bin:/usr/local/bin:$HOME/bin:$PATH:/usr/sbin:/sbin:/mnt/nagy/eclipse:/usr/games:.
CDPATH=$CDPATH:/mnt:/mnt/nagy
LD_LIBRARY_PATH=/opt/repa/lib:$DBROOT/lib:$LD_LIBRARY_PATH
USERNAME="dyuri"
JDK_HOME=/mnt/nagy/jdk
DICTIONARY=/usr/lib/ispell/magyar
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:'
LS_OPTIONS=' --color=auto -F -b -T 0'
SDL_AUDIODRIVER="pulse"
AUDIODEV="default"
EDITOR=/usr/bin/vim
WINEDITOR=/usr/bin/gvim
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
PYTHONPATH=/opt/django/lib/python/site-packages:/opt/python/lib/python:/opt/python/lib/python/site-packages:/opt/python:$PYTHONPATH
PYTHONSTARTUP=~/.pythonrc
GREP_OPTIONS='--color=auto'
BROWSER=google-chrome

WORKON_HOME=/mnt/nagy/django/venv
export WORKON_HOME
source /usr/bin/virtualenvwrapper.sh

export PATH CDPATH LD_LIBRARY_PATH USERNAME JDK_HOME DICTIONARY LS_COLORS LS_OPTIONS SDL_AUDIODRIVER AUDIODEV EDITOR WINEDITOR HISTSIZE HISTFILE SAVEHIST PYTHONPATH GREP_OPTIONS PYTHONSTARTUP BROWSER

# ssh agent
if [ -e ~/.sshagent ]; then
  . ~/.sshagent > /dev/null
fi

