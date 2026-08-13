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
    --command 'pi --model ollama-local/gemma4:e2b-it-qat -p'

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

# onefetch
_onefetch_on_cd() {
    if [ "$PWD" != "$_LAST_PWD" ]; then
        _LAST_PWD="$PWD"
        if [ -d .git ] || [ -f .git ]; then
            onefetch
        fi
    fi
}
PROMPT_COMMAND="_onefetch_on_cd${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# prompt setup
# oh-my-posh
# eval "$(oh-my-posh init bash --config ~/config/zsh/repa.omp.json)"
# oh-my-posh disabled: its bash integration races with flyline's agent-mode
# subprocess handling, causing "AI task failed: No child processes". The
# left-prompt widgets below are a native replacement for repa.omp.json.

# Capture $? before anything else (zoxide/direnv/etc.) touches it, so the
# status widget below can read it via $FLYLINE_LAST_EXIT.
flyline_capture_exit() { export FLYLINE_LAST_EXIT=$?; }
PROMPT_COMMAND="flyline_capture_exit${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

flyline create-prompt-widget custom --name FLYLINE_LEFT_BLOCK1 \
    --command "$HOME/.config/flyline/prompt_block1.sh" --block 200 --placeholder prev
flyline create-prompt-widget custom --name FLYLINE_STATUS_BLOCK \
    --command "$HOME/.config/flyline/prompt_status.sh" --block 100 --placeholder prev

export PS1='FLYLINE_LEFT_BLOCK1\n\e[48;2;60;56;54m\e[93m \A \e[00m\e[38;2;60;56;54m\e[00m '
export PS1_FINAL='\e[48;2;60;56;54m\e[92m \A \e[00m\e[38;2;60;56;54m\e[00m '
export RPS1='FLYLINE_STATUS_BLOCK'
export RPS1_FINAL=''
