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

function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function fzf-complete -d 'fzf completion and print selection back to commandline'
	# As of 2.6, fish's "complete" function does not understand
	# subcommands. Instead, we use the same hack as __fish_complete_subcommand and
	# extract the subcommand manually.
	set -l cmd (commandline -co) (commandline -ct)
	switch $cmd[1]
		case env sudo
			for i in (seq 2 (count $cmd))
				switch $cmd[$i]
					case '-*'
					case '*=*'
					case '*'
						set cmd $cmd[$i..-1]
						break
				end
			end
	end
	set cmd (string join -- ' ' $cmd)

	set -l complist (complete -C$cmd)
	set -l result
	string join -- \n $complist | sort | eval (__fzfcmd) -m --select-1 --exit-0 --header '(commandline)' | cut -f1 | while read -l r; set result $result $r; end

	set prefix (string sub -s 1 -l 1 -- (commandline -t))
	for i in (seq (count $result))
		set -l r $result[$i]
		switch $prefix
			case "'"
				commandline -t -- (string escape -- $r)
			case '"'
				if string match '*"*' -- $r >/dev/null
					commandline -t --  (string escape -- $r)
				else
					commandline -t -- '"'$r'"'
				end
			case '~'
				commandline -t -- (string sub -s 2 (string escape -n -- $r))
			case '*'
				commandline -t -- (string escape -n -- $r)
		end
		[ $i -lt (count $result) ]; and commandline -i ' '
	end

	commandline -f repaint
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

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

set -g SFML_INCLUDE_DIR "/usr/include/SFML/"
set -g SFML_LIBS_DIR "/usr/lib/SFML/"
set -g LD_LIBRARY_PATH "/usr/lib/SFML/"

set -g BROWSER /usr/bin/firefox
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

eval (batpipe)

# The following snippet is meant to be used like this in your fish config:
#
# if status is-interactive
# #     # Configure auto-attach/exit to your likings (default is off).
#       set ZELLIJ_AUTO_ATTACH true
#       set ZELLIJ_AUTO_EXIT true
#      eval (zellij setup --generate-auto-start fish | string collect)
#  end
if not set -q ZELLIJ
    if test "$ZELLIJ_AUTO_ATTACH" = "true"
        zellij attach -c
    else
        zellij
    end

    if test "$ZELLIJ_AUTO_EXIT" = "true"
        kill $fish_pid
    end
end

# opam configuration
source /home/arpangreat/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
