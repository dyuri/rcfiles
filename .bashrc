# .bashrc

# User specific aliases and functions

# PATH=/mnt/nagy/jdk/bin:$PATH:$HOME/bin:$HOME/.local/bin/:/usr/sbin:/sbin:/mnt/nagy/eclipse:/usr/games:.

# Agent model
PI_MODEL_FOR_BASH='ollama-barack/qwen2.5-coder:3b'

# alias whois='whois -h whois.ripe.net'
alias ls='ls --color=auto --group-directories-first -F -b -T 0'
alias ll='eza -la --icons --git'
alias tree='eza --tree'
alias vim='nvim'
alias cat='bat'
alias ping='prettyping --nolegend'
alias lg='lazygit'
alias watch='viddy'
alias whois='quien'
alias rm='trash'
alias ai="pi --model $PI_MODEL_FOR_BASH -p"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source $HOME/.bash.secrets

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Added by Antigravity CLI installer
export PATH="/home/dyuri/.local/bin:$PATH"

# completion
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

# Flyline - enhanced Bash experience
# enable -f /home/dyuri/.local/lib/libflyline.so flyline
enable -f /usr/lib/bash/libflyline.so flyline

flyline set-cursor --backend terminal
flyline mouse --mode disabled
flyline --set-frame-rate 24
flyline --send-shell-integration-codes full
# flyline create-prompt-widget last-command-duration --name FLYLINE_LAST_COMMAND_DUR

flyline set-agent-mode \
    --system-prompt "Be concise. Answer with a raw JSON array of at most 3 items with objects containing: command and description. Command will be a Bash command. " \
    --trigger-prefix ': ' \
    --command 'pi --model ollama-barack/qwen2.5-coder:3b -p'

# Atuin - history - replaced by flyline
# eval "$(atuin init bash)"
# flyline key bind Ctrl+r 'always=runBashCommand(__atuin_widget_run)+submitOrNewline' 
# flyline key bind Up 'editingBufferMode+cursorOnFirstLine=runBashCommand("__atuin_history --shell-up-key-binding --keymap-mode=emacs")+submitOrNewline'
# flyline key bind '?' 'editingBufferMode+bufferIsEmpty=runBashCommand(_atuin_ai_question_mark)'

# Zoxide
eval "$(zoxide init bash)"

# Direnv
eval "$(direnv hook bash)"

# broot
source /home/dyuri/.config/broot/launcher/bash/br

# prompt setup
# oh-my-posh
# eval "$(oh-my-posh init bash --config ~/config/zsh/repa.omp.json)"
export PS1_FINAL='\e[48;2;60;56;54m\e[92m \A \e[00m\e[38;2;60;56;54m\e[00m '
export RPS1='\e[38;2;60;56;54m\e[00m\e[48;2;60;56;54m\e[93m \A \e[00m'
export RPS1_FINAL=''
