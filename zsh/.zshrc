# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export HISTFILE="/home/arpangreat/.zsh_history"
export ZSH_CACHE_DIR=~/.cache/zsh:$ZSH_CACHE_DIR
export ZSH="$HOME/.oh-my-zsh"
# ZVM_INIT_MODE=sourcing
# export ZSH_THEME="spaceship"
# export ZSH_THEME="powerlevel10k/powerlevel10k"

autoload -U compinit && compinit

# plugins
# source ~/dotfiles/zsh/plugins/git.plugin.zsh
# source ~/dotfiles/zsh/plugins/zsh-interactive-cd.plugin.zsh
# source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/dotfiles/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
# source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/dotfiles/zsh/functions/_zig
plugins=(
  gh
  zsh-interactive-cd
  zsh-autosuggestions
  zsh-completions
  fast-syntax-highlighting
  rust
  zsh-vi-mode
  zsh-abbr
)

source $ZSH/oh-my-zsh.sh

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source ~/forgit/forgit.plugin.zsh
# export fpath=(~/dotfiles/zsh/plugins/zsh-completions/src $fpath)
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export EDITOR='/usr/local/bin/nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nv="nvim"
alias e='emacs'
alias en='emacs -nw'
alias brc='nvim ~/dotfiles/bspwm/'
alias hrc='nvim ~/dotfiles/herbstluftwm/'
alias vrc='nvim ~/.vimrc'
alias ec='emacsclient'
alias nrc='nvim ~/dotfiles/nvim/init.lua'
alias s='sudo'
alias sv='sudo vim'
alias snv='sudo nvim'
alias se='sudo emacs'
alias sec='sudo emacsclient'
alias ch='sudo chmod +x'
alias chu='sudo chmod u+x'
alias rd='sudo rmdir'
alias rf='sudo rm -rf'
alias g++-'g++ -std=c++2a'
alias g='git'
alias gP='git pull'
alias gp='git push -u origin master'
alias gap='git add -p'
alias gal='git lg -p'
alias gso='git show'
alias gco='git checkout'
alias gf='$GOPATH/bin/gf'
alias arc='nvim ~/dotfiles/alacritty/alacritty.yml'
alias zrc='nvim ~/.zshrc'
alias trc='nvim ~/.tmux.conf'
alias krc='nvim ~/dotfiles/kitty/kitty.conf'
alias irc='nvim ~/dotfiles/i3/config'
alias sld='sway-launcher-desktop'
alias tm='tmux -u'
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"
alias ide='bash ~/dotfiles/custom-scripts/ide.sh'
alias rusttm='~/dotfiles/custom-scripts/./rusttm'
alias gotm='~/dotfiles/custom-scripts/./gotm'
alias javatm='~/dotfiles/custom-scripts/./javatm'
alias tstm='~/dotfiles/custom-scripts/./tstm'
alias nvtm='~/dotfiles/custom-scripts/./nvtm'
alias pytm='~/dotfiles/custom-scripts/./pytm'
alias cpptm='~/dotfiles/custom-scripts/./cpptm'
alias blogtm='~/dotfiles/custom-scripts/./blogtm'
alias cdtm='~/dotfiles/custom-scripts/./cdtm'
alias cht='~/dotfiles/custom-scripts/tmux-cht.sh'
alias notes='nvim ~/wiki/index.md'
alias projectCreate='bash ~/dotfiles/custom-scripts/projectCreate.sh'
alias na='~/My-First-Plugin/./nvim.appimage'
alias ll='exa -l -g --icons'
alias ls='exa -l -g --icons'
alias la='exa -l -g --icons -a'
alias lt='exa -l -g --icons --tree'
alias lta='exa -l -g --icons --tree -a'
alias l='ls'
alias lg='lazygit'
alias obs="QT_QPA_PLATFORM=xcb obs"
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias open='xdg-open'
alias keysoup="sudo systemctl restart keyd && sudo systemctl enable keyd && sudo systemctl start keyd && setxkbmap -option compose:menu"
alias zs="zellij action new-tab --layout /home/arpangreat/dotfiles/zellij/layouts/strider.kdl"
alias zm="zellij action new-tab --layout /home/arpangreat/dotfiles/zellij/layouts/my-default.kdl"

bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# My custom zsh files
source $HOME/dotfiles/zsh/functions/functions
[ -f ~/dotfiles/zsh/functions/fzf-git.zsh ] && source $HOME/dotfiles/zsh/functions/fzf-git.zsh
# source $HOME/dotfiles/zsh/always-tmux.sh
source $HOME/dotfiles/zsh/always-zellij.sh


# ensure_tmux_is_running
ensure_zellij_is_running

eval "$(zoxide init zsh --cmd cd)"

eval "$(starship init zsh)"

# base16
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
# neofetch
shellfetch
# Install it
# fortune | cowsay | lolcat

# Kitty
# kitty +complete setup zsh | source /dev/stdin

#Zellij
# zellij setup --generate-completion zsh | source /dev/stdin

# Alacritty
# source /home/arpangreat/alacritty/extra/completions/_alacritty

export DOTBARE_DIR="$HOME/dotfiles.git"

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man'"

# CDPATH
setopt auto_cd
cdpath=($HOME/dotfiles $HOME/.config)

# NVIM
# export NVIM_TUI_ENABLE_TRUE_COLOR=1 
# export NVIM_TUI_ENABLE_CURSOR_SHAPE=1 
# export NVIM_PYTHON_LOG_FILE="/tmp/.log"
# export NVIM_PYTHON_LOG_LEVEL=DEBUG
# export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
# source /home/arpangreat/tokyonight.nvim/extras/zsh_tokyonight_storm.zsh-theme
# bash ~/.config/base16-shell/scripts/base16-rebecca.sh
# wal -i ~/dotfiles/wallpaper/wallpaper.jpg

# eval "$(starship init zsh)"
#[ -f "/home/arpangreat/.ghcup/env" ] && source "/home/arpangreat/.ghcup/env" # ghcup-env

# export JAR=/home/arpangreat/dotfiles/nvim/jdt-language-server/plugins/org.eclipse.equinox.common_3.16.0.v20220211-2322.jar
# export GRADLE_HOME=$HOME/gradle
export JAVA_HOME=/usr/lib/jvm/default
# export JDTLS_HOME=/home/arpangreat/dotfiles/nvim/jdt-language-server/
# export JDTLS_CONFIG=/home/arpangreat/dotfiles/nvim/jdt-language-server/config_linux
# export WORKSPACE=$HOME/javaexsnew

function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}

compctl -K _pip_completion pip3

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--preview "bat --color 'always' {}"
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview --hidden 'bat --color "always" {}'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_CTRL_R_OPTS="--preview 'bat --color "always" {}'"

# fpath=(~/.zsh.d/ $fpath)

# zsh-vi-mode
# ZVM_CURSOR_STYLE_ENABLED=true

# function zle-keymap-select
# {
#   # precmd
#   case $KEYMAP in
#       vicmd)      print -n '\033[1 q';; # block cursor
#       viins|main) print -n '\033[5 q';; # line cursor
#   esac
#   zle reset-prompt
# }

# zle -N zle-keymap-select

export GOPATH=$HOME/go
export LLVM_ROOT=$HOME/llvm-project
# source $HOME/tomnomnom/gf/gf-completion.zsh
export PATH=$PATH:$GOPATH/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.cargo/env
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/flutter/bin
export PATH=$PATH:$HOME/local/ActiveTCL/bin


# Spaceship configs
# SPACESHIP_DIR_TRUNC=0
# SPACESHIP_BATTERY_THRESHOLD=30
# SPACESHIP_VI_MODE=true
# SPACESHIP_VI_MODE_COLOR=#ff87d7
# SPACESHIP_CHAR_SYMBOL='➜ '
# SPACESHIP_CHAR_SUFFIX=' '
# ORDER
# SPACESHIP_PROMPT_ORDER=(
#   time     #
#   vi_mode  # these sections will be
#   user     # before prompt char
#   host     #
#   char
#   dir
#   git
#   node
#   ruby
#   xcode
#   swift
#   golang
#   docker
#   venv
#   pyenv
# )

# SPACESHIP_CHAR_SYMBOL='-->'
# SPACESHIP_CHAR_SUFFIX=' '
# export ANDROID_SDK=
#
# [ -d "$HOME/Library/Android/sdk" ] && ANDROID_SDK=$HOME/Library/Android/sdk || ANDROID_SDK=$HOME/Android/Sdk
# echo "export ANDROID_SDK=$ANDROID_SDK" >> ~/`[[ $SHELL == *"zsh" ]] && echo '.zshenv' || echo '.bash_profile'`

FAST_HIGHLIGHT[use_brackets]=1
# Some things for peco
bindkey -s '^o' 'cdtm\n'


alias luamake=/home/arpangreat/.config/nvim/lua-language-server/3rd/luamake/luamake

# added by travis gem
[ ! -s /home/arpangreat/.travis/travis.sh ] || source /home/arpangreat/.travis/travis.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions
# export TERM=xterm-256color-italic
export TERM=xterm-kitty-256color
# export TERM= 
fpath+=/home/arpangreat/dotfiles/bottom/completion/_btm
fpath+=/home/arpangreat/dotfiles/zsh/functions/_cargo
fpath+=/home/arpangreat/dotfiles/zsh/functions/_rustup
fpath+=/home/arpangreat/dotfiles/zsh/functions/_starship
fpath+=/home/arpangreat/dotfiles/zsh/functions/_alacritty
fpath+=/home/arpangreat/dotfiles/zsh/functions/_kitty
fpath+=/home/arpangreat/dotfiles/zsh/functions/_zig
fpath+=/home/arpangreat/dotfiles/zsh/functions/_cht
fpath+=/home/arpangreat/dotfiles/zsh/functions/_wezterm
fpath+=/home/arpangreat/dotfiles/zsh/functions/_zellij
export PATH=/home/arpangreat/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$PATH:/home/arpangreat/Downloads/go/bin
export PATH=$PATH:/home/arpangreat/.local/bin
export PATH=$PATH:/home/arpangreat/.local/share/nvim/mason/bin
export PATH=$PATH:/home/arpangreat/.ghcup/bin
export CHROME_EXECUTABLE=/usr/bin/brave
export PATH="$PATH:/home/arpangreat/.dotnet/tools"
export PATH=/home/arpangreat/.nimble/bin:$PATH
export PATH=/home/arpangreat/apache-maven-3.8.6/bin:$PATH
export ANDROID_HOME=/home/arpangreat/Android/Sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export BROWSER=/usr/bin/firefox

# source /home/arpangreat/.zprofile
# fpath=(~/.zsh.d/ $fpath)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

function myinit(){
 [ -f ~/dotfiles/zsh/functions/fzf-git.zsh ] && source $HOME/dotfiles/zsh/functions/fzf-git.zsh
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(myinit)
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zvm_after_init() {
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }
source /usr/share/nvm/init-nvm.sh

# bun completions
[ -s "/home/arpangreat/.oh-my-zsh/completions/_bun" ] && source "/home/arpangreat/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="/home/arpangreat/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export SFML_INCLUDE_DIR="/usr/include/SFML/"
export SFML_LIBS_DIR="/usr/lib/SFML/"
export LD_LIBRARY_PATH="/usr/lib/SFML/"

# bun completions
[ -s "/home/arpangreat/.bun/_bun" ] && source "/home/arpangreat/.bun/_bun"

[ -f "/home/arpangreat/.ghcup/env" ] && source "/home/arpangreat/.ghcup/env" # ghcup-env

source <(cod init $$ zsh)

PATH="/home/arpangreat/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/arpangreat/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/arpangreat/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/arpangreat/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/arpangreat/perl5"; export PERL_MM_OPT;
