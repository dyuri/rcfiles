# Nushell Environment Config File
#
# version = "0.92.2"

def create_left_prompt [] {
    let dir = match (do --ignore-shell-errors { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    let path_segment = $"($path_color)($dir)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
# An alternate way to add entries to $env.PATH is to use the custom command `path add`
# which is built into the nushell stdlib:
# use std "path add"
# $env.PATH = ($env.PATH | split row (char esep))
# path add /some/path
# path add ($env.CARGO_HOME | path join "bin")
# path add ($env.HOME | path join ".local" "bin")
# $env.PATH = ($env.PATH | uniq)

# To load from a custom file you can use:
# source ($nu.default-config-dir | path join 'custom.nu')

## copied from a xonsh session
$env.AUDIODEV = 'default'
$env.BAT_PAGER = 'ov -F -H3'
$env.BROWSER = '/home/dyuri/bin/google-chrome'
$env.COLORTERM = 'truecolor'
$env.EDITOR = 'nvim'
$env.FZF_DEFAULT_COMMAND = 'fd --type file --color=always --follow --hidden --exclude .git --exclude .hg'
$env.FZF_DEFAULT_OPTS = '--color 'bg:0,bg+:2,fg:8,fg+:15,hl:10,hl+:11,prompt:11,info:3,marker:11,pointer:11,spinner:1' --ansi --height 10'
$env.GIT_SSH = '/home/dyuri/.local/bin/repassh'
$env.GOPATH = '/home/dyuri/egyeb/prog/go'
$env.JAVA_HOME = '/usr/lib/jvm/default'
# $env.LD_LIBRARY_PATH = ':/lib:/usr/lib/jvm/default/lib/:/usr/lib/jvm/default/lib/server/'
$env.LS_OPTIONS = ' --color=auto -F -b -T 0'
$env.NODENV_ROOT = '/home/dyuri/.nodenv'
$env.NPM_PACKAGES = '/home/dyuri/.npm'
$env.PAGER = 'ov -F'
$env.PYENV_ROOT = '/home/dyuri/.pyenv'
$env.PYENV_VIRTUALENV_INIT = '1'
$env.SDL_AUDIODRIVER = 'pulse'
$env.SKIM_DEFAULT_COMMAND = 'fd --type file --color=always --follow --hidden --exclude .git'
$env.VK_ICD_FILENAMES = '/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json'
$env.WINEDITOR = 'nvim'
$env.XCURSOR_SIZE = '24'

# update path
use std *
path add ($env.HOME | path join "bin") ($env.HOME | path join ".local" "bin") ($env.HOME | path join ".cargo" "bin") ($env.GOPATH | path join "bin") ($env.NPM_PACKAGES | path join "bin") ($env.PYENV_ROOT | path join "bin") ($env.PYENV_ROOT | path join "shims") ($env.NODENV_ROOT | path join "bin") ($env.NODENV_ROOT | path join "shims") ($env.JAVA_HOME | path join "bin")

# aliases
alias bible = shuf -n1 ~/txt/bible.txt
alias vim = nvim
alias vimdiff = nvim -d
alias cat = bat --wrap=never
alias ping = prettyping --nolegend
alias py = ipython
alias mosh = mosh --ssh=repassh
alias lg = lazygit
alias watch = viddy
alias hx = helix
alias sk = sk --color 'bg:0,bg+:2,fg:8,fg+:15,hl:10,hl+:11,prompt:11,info:3,marker:11,pointer:11,spinner:1' --ansi --height 10
alias ssh = repassh

# alias jjdiff = jj diff --git | diffnav
def jjdiff [] { jj diff --git | diffnav }

# completions - carapace
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'

# TODO pyenv, nodenv (fnm)
# TODO atuin, thefuck
# TODO motd
