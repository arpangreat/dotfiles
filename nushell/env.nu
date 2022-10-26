# Nushell Environment Config File
let-env STARSHIP_SHELL = "nu"

def create_left_prompt [] {
  starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str collect)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
zoxide init nushell --hook prompt | save ~/.zoxide.nu

# starship init nu | save ~/.cache/starship/init.nu

# PATH
let-env PATH = ($env.PATH | prepend '$GOPATH/go/bin')
let-env PATH = ($env.PATH | prepend '/usr/local/go/bin')
let-env PATH = ($env.PATH | prepend '$HOME/.config/composer/vendor/bin')
let-env PATH = ($env.PATH | prepend '$HOME/.cargo/env')
let-env PATH = ($env.PATH | prepend '$HOME/.cargo/bin')
let-env PATH = ($env.PATH | prepend '$HOME/flutter/bin')
let-env PATH = ($env.PATH | prepend '/home/arpangreat/.local/share/gem/ruby/3.0.0/bin')
let-env PATH = ($env.PATH | prepend '/home/arpangreat/Downloads/go/bin')
let-env PATH = ($env.PATH | prepend '/home/arpangreat/.local/bin')
let-env PATH = ($env.PATH | prepend '/home/arpangreat/.dotnet/tools')
