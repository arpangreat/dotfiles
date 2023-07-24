# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = {|| "> " }
let-env PROMPT_INDICATOR_VI_INSERT = {|| ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
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
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

let-env TERM = xterm-kitty-256color
let-env EDITOR = hx
let-env MANPAGER = "sh -c 'col -bx | bat -l man'"
let-env DENO_INSTALL = /home/arpangreat/.deno
let-env JAVA_HOME = /usr/lib/jvm/default
let-env GOPATH = /home/arpangreat/go
let-env LLVM_ROOT = /home/arpangreat/llvm-project
let-env BROWSER = firefox
let-env ANDROID_HOME = /home/arpangreat/Android/Sdk


# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

$env.PATH = (
    $env.PATH
        | split row (char esep)
        | append "/usr/bin"
        | append "/usr/sbin"
        | append "/usr/local/bin"
        | append "/usr/local/sbin"
        | append "/usr/arpangreat/flutter/bin"
        | append $"($env.HOME)/.cargo/bin"
        | append $"($env.HOME)/.cargo/env"
        | append $"($env.DENO_INSTALL)/bin"
        | append $"($env.HOME)/go/bin"
        | append $"($env.HOME)/.dotnet/tools"
        | append $"($env.HOME)/.nimble/bin"
        | append $"($env.ANDROID_HOME)/tools"
        | append $"($env.ANDROID_HOME)/cmdline-tools/latest/bin"
        | uniq
)

# .env - Starship prompt (starship.rs)
$env.STARSHIP_CONFIG = $env.HOME + '/.config/starship.toml'
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# .env - Zoxide (https://github.com/ajeetdsouza/zoxide)
zoxide init nushell --cmd cd | save -f ~/.zoxide.nu