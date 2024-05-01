# Env variables
set-env PAGER "ov -F"
set-env BAT_PAGER "ov -F -H3"
set-env LESS "-R -i"
set-env EDITOR "nvim"
set-env VISUAL "nvim"

set-env NPM_PACKAGES "$E:HOME/.npm"

# set-env SDL_AUDIODRIVER "pulse"
set-env AUDIODEV "default"
set-env PYTHONSTARTUP "$E:HOME/.pythonrc"
set-env BROWSER "$E:HOME/bin/google-chrome"
set-env JAVA_HOME "/usr/lib/jvm/default"
set-env LD_LIBRARY_PATH "$E:LD_LIBRARY_PATH:/usr/lib/jvm/default/lib/:/usr/lib/jvm/default/lib/server/"
set-env VK_ICD_FILENAMES "/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json"

set-env FZF_DEFAULT_COMMAND "fd --type file --color=always --follow --hidden --exclude .git"
set-env FZF_DEFAULT_OPTS "--color 'bg:0,bg+:2,fg:8,fg+:15,hl:10,hl+:11,prompt:11,info:3,marker:11,pointer:11,spinner:1' --ansi --height 10"
set-env SKIM_DEFAULT_COMMAND $E:FZF_DEFAULT_COMMAND

# Starship manual init
set-env STARSHIP_SHELL "elvish"
set-env STARSHIP_SESSION_KEY (to-string (randint 10000000000000 10000000000000000))

# Define Hooks
var cmd-status-code = 0
var terminal-width = 80

fn starship-after-command-hook {|m|
    set terminal-width = (- (tput cols) 1)
    var error = $m[error]
    if (is $error $nil) {
        set cmd-status-code = 0
    } else {
        try {
            set cmd-status-code = $error[reason][exit-status]
        } catch {
            # The error is from the built-in commands and they have no status code.
            set cmd-status-code = 1
        }
    }
}

# Install Hooks
set edit:after-command = [ $@edit:after-command $starship-after-command-hook~ ]

# Install starship
set edit:prompt = {
    var cmd-duration = (printf "%.0f" (* $edit:command-duration 1000))
    /usr/bin/starship prompt -w $terminal-width --jobs=$num-bg-jobs --cmd-duration=$cmd-duration --status=$cmd-status-code --logical-path=$pwd
}

set edit:rprompt = {
    var cmd-duration = (printf "%.0f" (* $edit:command-duration 1000))
    /usr/bin/starship prompt --right --jobs=$num-bg-jobs --cmd-duration=$cmd-duration --status=$cmd-status-code --logical-path=$pwd
}
