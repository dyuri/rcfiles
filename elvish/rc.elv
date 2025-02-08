# Env variables
set-env PAGER "ov -F"
set-env BAT_PAGER "ov -F -H3"
set-env LESS "-R -i"
set-env EDITOR "nvim"
set-env VISUAL "nvim"

set-env GOPATH $E:HOME/egyeb/prog/go
set-env PYENV_ROOT $E:HOME/.pyenv
set-env PYENV_VIRTUALENV_INIT '1'
set-env NPM_PACKAGES $E:HOME/.npm
set-env NODENV_ROOT $E:HOME/.nodenv

# set-env SDL_AUDIODRIVER "pulse"
set-env AUDIODEV "default"
set-env PYTHONSTARTUP $E:HOME/.pythonrc
set-env BROWSER $E:HOME/bin/google-chrome
set-env JAVA_HOME "/usr/lib/jvm/default"
# set-env LD_LIBRARY_PATH "$E:LD_LIBRARY_PATH:/usr/lib/jvm/default/lib/:/usr/lib/jvm/default/lib/server/"
set-env VK_ICD_FILENAMES "/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json"

set-env FZF_DEFAULT_COMMAND "fd --type file --color=always --follow --hidden --exclude .git"
set-env FZF_DEFAULT_OPTS "--color 'bg:0,bg+:2,fg:8,fg+:15,hl:10,hl+:11,prompt:11,info:3,marker:11,pointer:11,spinner:1' --ansi --height 10"
set-env SKIM_DEFAULT_COMMAND $E:FZF_DEFAULT_COMMAND
set-env XCURSOR_SIZE 24

set-env LS_COLORS 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.bz2=01;31:*.rpm=01;31:*.deb=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.mpg=01;37:*.avi=01;37:*.mov=01;37:'

# path
set paths = [
  $E:HOME/bin
  $E:HOME/.local/bin
  $E:HOME/.cargo/bin
  $E:GOPATH/bin
  $E:PYENV_ROOT/bin
  $E:PYENV_ROOT/shims
  $E:NODENV_ROOT/bin
  $E:NODENV_ROOT/shims
  $E:JAVA_HOME/bin
  $E:HOME/.npm/bin
  $@paths
]

# shell - oh my posh
eval (oh-my-posh init elvish --config ~/.config/elvish/repa.omp.json | slurp)

# zoxide
eval (zoxide init elvish | slurp)

# atuin ? - not supported/needed

# direnv
use direnv

# asdf
use asdf _asdf
var asdf~ = $_asdf:asdf~
set edit:completion:arg-completer[asdf] = $_asdf:arg-completer~

# carapace - competitions
set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
eval (carapace _carapace|slurp)

# "aliases"
fn ls {|@args| e:ls --color=auto -F -b -T 0 $@args }
fn ll {|@args| e:exa -lasnew $@args }
fn bible { e:shuf -n1 $E:HOME/txt/bible.txt }
fn vim {|@args| e:nvim $@args }
fn vimdiff {|@args| e:nvim -d $@args }
fn cat {|@args| e:bat --wrap=never $@args }
fn ping {|@args| e:prettyping --nolegend $@args }
fn py {|@args| e:ipython $@args }
fn lg {|@args| e:lazygit $@args }
fn watch {|@args| e:viddy $@args }
fn hx {|@args| e:helix $@args }
fn ssh {|@args| e:repassh $@args }
fn jjdiff { e:jj diff --git | diffnav }
fn http {|@args| e:http $@args }

# !! - last command
# epm:install github.com/zzamboni/elvish-modules
use github.com/zzamboni/elvish-modules/bang-bang

# readline keybindings
use readline-binding

# theme?
# TODO

# motd
# TODO
