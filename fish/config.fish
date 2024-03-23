starship init fish | source

zoxide init fish --cmd cd | source

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

set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

if status --is-interactive
    and not set -q TMUX
    exec tmux -u
end

set -gx EDITOR nvim

set -gx MANPAGER "sh -c 'col -bx | bat -l man'"

set -g DENO_INSTALL "/home/arpangreat/.deno"
fish_add_path $DENO_INSTALL/bin:$PATH

set -g JAVA_HOME /usr/lib/jvm/default
# Go
set -g GOPATH $HOME/go

set -g LLVM_ROOT $HOME/llvm-project
set -g CHROME_EXECUTABLE /usr/bin/brave
set -g ANDROID_HOME /home/arpangreat/Android/Sdk

set -g BUN_INSTALL "/home/arpangreat/.bun"

set -g SFML_INCLUDE_DIR /usr/include/SFML/
set -g SFML_LIBS_DIR /usr/lib/SFML/
set -g LD_LIBRARY_PATH /usr/lib/SFML/

set -Ua fish_user_paths /home/arpangreat/.rye/env

set -g BROWSER /usr/bin/firefox
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
fish_add_path $PATH:$GOPATH/go/bin
fish_add_path $PATH:/usr/local/go/bin
fish_add_path $PATH:$HOME/.config/composer/vendor/bin
fish_add_path $PATH:$HOME/.cargo/env
fish_add_path $PATH:$HOME/.cargo/bin
fish_add_path $PATH:$HOME/.opam/default/bin
fish_add_path $PATH:/home/arpangreat/.local/bin
fish_add_path $PATH:/home/arpangreat/.local/share/nvim/mason/bin
fish_add_path $PATH:/home/arpangreat/.ghcup/bin
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
fish_add_path "$BUN_INSTALL/bin:$PATH"
fish_add_path $HOME/.local/share/nvim/mason/bin

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

v complete setup fish | source
jj util completion fish | source
fx --comp fish | source
s --completion fish | source

cod init $fish_pid fish | source

# opam configuration
source /home/arpangreat/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
