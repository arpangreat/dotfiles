
starship init fish | source

zoxide init fish --cmd cd | source


fish_vi_key_bindings

function fish_greeting
    shellfetch
end

set -gx EDITOR hx

set -gx MANPAGER "sh -c 'col -bx | bat -l man'"

set -g DENO_INSTALL "/home/arpangreat/.deno"
set -g PATH $DENO_INSTALL/bin:$PATH

set -g JAVA_HOME /usr/lib/jvm/default
# Go
set -g GOPATH $HOME/go

set -g LLVM_ROOT $HOME/llvm-project
set -g TERM xterm-kitty-256color
set -g CHROME_EXECUTABLE /usr/bin/brave
set -g ANDROID_HOME /home/arpangreat/Android/Sdk

set -g BUN_INSTALL "/home/arpangreat/.bun"

set -g SFML_INCLUDE_DIR "/usr/include/SFML/"
set -g SFML_LIBS_DIR "/usr/lib/SFML/"
set -g LD_LIBRARY_PATH "/usr/lib/SFML/"

set -g BROWSER /usr/bin/firefox
