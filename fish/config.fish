starship init fish | source

function fish_greeting
    fastfetch --load-config ~/dotfiles/fastfetch/10.jsonc
end

function fish_hybrid_key_bindings --description \
    "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
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

# atuin init fish | source

set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

if status --is-interactive
    and not set -q TMUX
    tmux -u -2
end

set -gx EDITOR /usr/local/bin/nvim

set -gx MANPAGER "sh -c 'col -bx | bat -l man'"

set -g DENO_INSTALL "/home/arpangreat/.deno"
fish_add_path $DENO_INSTALL/bin:$PATH

set -g JAVA_HOME /usr/lib/jvm/default
# Go
set -g GOPATH $HOME/go

set -g LLVM_ROOT $HOME/llvm-project
set -g CHROME_EXECUTABLE /usr/bin/brave
set -g ANDROID_HOME /home/arpangreat/Android/Sdk

set -Ux MAKEFLAGS -j4

set -g BUN_INSTALL "/home/arpangreat/.bun"

set -g SFML_INCLUDE_DIR /usr/include/SFML/
set -g SFML_LIBS_DIR /usr/lib/SFML/
set -g LD_LIBRARY_PATH /usr/lib/SFML/

set -Ua fish_user_paths /home/arpangreat/.rye/env

set -g BROWSER /usr/bin/zen-browser
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
fish_add_path $GOPATH/go/bin
fish_add_path /usr/local/go/bin/
fish_add_path $HOME/.cargo/env
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.opam/default/bin
fish_add_path /home/arpangreat/.local/bin
fish_add_path /home/arpangreat/.local/share/nvim/mason/bin
fish_add_path /home/arpangreat/.ghcup/bin
fish_add_path $HOME/.config/composer/vendor/bin
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
fish_add_path $BUN_INSTALL/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $HOME/.ruby/bin
# fish_add_path $HOME/.local/share/gem/ruby/3.0.0/bin
fish_add_path $JAVA_HOME/bin
fish_add_path /usr/bin/flutter/bin
fish_add_path $HOME/Downloads/RustRover-2024.1/bin
fish_add_path $KITTY_INSTALLATION_DIR:$HOME/kitty

zoxide init fish --cmd cd | source

eval (batpipe)

# The following snippet is meant to be used like this in your fish config:
#
# if status is-interactive
# #     # Configure auto-attach/exit to your likings (default is off).
#       set ZELLIJ_AUTO_ATTACH true
#       set ZELLIJ_AUTO_EXIT true
#      eval (zellij setup --generate-auto-start fish | string collect)
#  end
# if not set -q ZELLIJ
#     if test "$ZELLIJ_AUTO_ATTACH" = "true"
#         zellij attach -c
#     else
#         zellij
#     end

#     if test "$ZELLIJ_AUTO_EXIT" = "true"
#         kill $fish_pid
#     end
# end

# source $HOME/kitty/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish
source $HOME/ghostty/zig-out/share/ghostty/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
source $HOME/dotfiles/fish/tokyonight_moon.fish

v complete setup fish | source
symfony completion | source

cod init $fish_pid fish | source

# opam configuration
source /home/arpangreat/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

# pnpm
set -gx PNPM_HOME "/home/arpangreat/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# # Kitty
# if set -q KITTY_INSTALLATION_DIR
#     set --global KITTY_SHELL_INTEGRATION enabled
#     source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
#     set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
# end

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
