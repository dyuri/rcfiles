# variables

# browser
set BROWSER google-chrome

# editors

set EDITOR nvim
set WINEDITOR nvim
set VISUAL nvim
set PAGER bat
set TERMINAL termite

# lang
set LANG 'en_US.UTF-8'

# go
set GOPATH $HOME/egyeb/prog/go

# python
# set PYTHONPATH $PYTHONPATH
set PYTHONSTARTUP $HOME/.pythonrc
set WORKON_HOME '/mnt/nagy/django/venv'

# path
# set CDPATH $CDPATH
set PATH $HOME/bin $HOME/.local/bin $PATH /usr/sbin /usr/local/bin /usr/local/sbin $HOME/.tmuxifier/bin $GOPATH/bin

# less
set LESS '-F -g -i -M -R -S -w -X -z-4'

# ls
set LS_COLORS 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:'
set LS_OPTIONS '  --color=auto -F -b -T 0'

#
# TODO sshagent
#

# audio
set SDL_AUDIODRIVER pulse
set AUDIODEV default

# terminal
set TERM xterm-256color
set FZF_DEFAULT_COMMAND 'rg --files --no-ignore --no-ignore-vcs --hidden --follow --glob "!.git/*" --glob "!.hg/*"'
set FZF_DEFAULT_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :100 {}'"

# nvm
set NVM_DIR $HOME/.nvm
# TODO nvm

# aliases
alias ls="ls $LS_OPTIONS"
alias ll="exa -la --git --classify --group-directories-first"
alias jsonpp="python -mjson.tool"
alias bible='shuf -n 1 ~/txt/bible.txt'
alias grep='grep --color'
alias vim=nvim
alias gtop=glances
alias lg=lazygit
alias cat=bat
alias ping='prettyping --nolegend'
alias fzvim='vim `fzf`'

#
# TODO tmuxifier
#

#
# TODO tmux check
#

# theme settings
set -g theme_nerd_fonts yes
set -g theme_display_hg yes

