starship init fish | source

function fish_greeting
    fastfetch --config examples/10.jsonc
end

function copy_commandline
    echo -n (commandline) | wl-copy
end

function fish_hybrid_key_bindings --description \
    "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase

    # Add system clipboard bindings
    # Paste from system clipboard with 'p' in normal mode
    bind -M default p 'commandline -i (wl-paste)'

    # System clipboard paste with Ctrl+V in insert mode (in addition to emacs Ctrl+Y)
    bind -M insert \cv 'commandline -i (wl-paste)'

    # Optional: Make 'Y' copy entire line to system clipboard in normal mode
    bind -M default y copy_commandline

    bind -M visual y 'set sel (commandline -s); commandline -f end-selection repaint-mode; echo -n $sel | wl-copy'

    bind -M default \ce edit_command_buffer
end

set -g fish_key_bindings fish_hybrid_key_bindings

function ya
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# fzf_key_bindings
fzf --fish | source
source /home/arpangreat/fzf-git.sh/fzf-git.fish

set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

if status --is-interactive
    and not set -q TMUX
    tmux
end

set -gx EDITOR /usr/local/bin/nvim

set -gx PAGER 'bat -l man'
set -gx LESS '-R'
set -gx LESS_TERMCAP_so (printf '\033[7m')
set -gx LESS_TERMCAP_se (printf '\033[27m')

set -g DENO_INSTALL "/home/arpangreat/.deno"
fish_add_path $DENO_INSTALL/bin:$PATH

set -g JAVA_HOME /usr/lib/jvm/default
# Go
set -g GOPATH $HOME/go

set -g CHROME_EXECUTABLE /usr/bin/zen-browser

set -gx MAKEFLAGS -j7
set -gx GNUMAKEFLAGS -j7

set -g BUN_INSTALL "/home/arpangreat/.bun"

set -g RUSTC_WRAPPER sccache
set -g RUSTFLAGS "-C link-arg=-fuse-ld=/usr/bin/mold"

set -g BROWSER /usr/bin/zen-browser
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"

set -gx LD ld.lld
set -gx LDFLAGS "-fuse-ld=lld"
set -gx GEMINI_API_KEY $(cat ~/.gemini_api_key)

fish_add_path $GOPATH/go/bin
fish_add_path /usr/local/go/bin/
fish_add_path $HOME/.cargo/env
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.opam/default/bin
fish_add_path /home/arpangreat/.local/bin
fish_add_path /home/arpangreat/.local/share/nvim/mason/bin
fish_add_path /home/arpangreat/.ghcup/bin
fish_add_path $HOME/.config/composer/vendor/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path $HOME/.ruby/bin
fish_add_path $JAVA_HOME/bin

zoxide init fish --cmd cd | source

cod init $fish_pid fish | source

# opam configuration
source /home/arpangreat/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

# pnpm
set -gx PNPM_HOME "/home/arpangreat/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# argc-completions
set -gx ARGC_COMPLETIONS_ROOT /home/arpangreat/argc-completions
set -gx ARGC_COMPLETIONS_PATH "$ARGC_COMPLETIONS_ROOT/completions/linux:$ARGC_COMPLETIONS_ROOT/completions"
fish_add_path "$ARGC_COMPLETIONS_ROOT/bin"
# To add completions for only the specified command, modify next line e.g. set argc_scripts cargo git
set argc_scripts (ls -1 "$ARGC_COMPLETIONS_ROOT/completions/linux" "$ARGC_COMPLETIONS_ROOT/completions" | sed -n 's/\.sh$//p')
argc --argc-completions fish $argc_scripts | source

source ~/.safe-chain/scripts/init-fish.fish # Safe-chain Fish initialization script
