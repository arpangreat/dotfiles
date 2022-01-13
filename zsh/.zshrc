# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/arpangreat/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    gh
    zsh-completions
    zsh-autosuggestions  
    zsh-syntax-highlighting  
    zsh-vi-mode
    zsh-interactive-cd
)


autoload -U compinit && compinit -i

source $ZSH/oh-my-zsh.sh

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
alias brc='nvim ~/.bashrc'
alias vrc='nvim ~/.vimrc'
alias ec='emacsclient'
alias nrc='nvim ~/.config/nvim/init.lua'
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
alias gc='git clone'
alias gP='git pull'
alias gp='git push -u origin master'
alias gap='git add -p'
alias gal='git lg -p'
alias gso='git show'
alias gf='$GOPATH/bin/gf'
alias arc='nvim ~/.config/alacritty/alacritty.yml'
alias zrc='nvim ~/.zshrc'
alias trc='nvim ~/.tmux.conf'
alias krc='nvim ~/.config/kitty/kitty.conf'
alias irc='nvim ~/dotfiles/i3/config'
alias sld='sway-launcher-desktop'
alias tm='tmux -u'
alias cht='cht.sh'
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

bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# My custom zsh files
source $HOME/dotfiles/zsh/functions/functions
source $HOME/dotfiles/zsh/always-tmux.sh

ensure_tmux_is_running

eval "$(zoxide init zsh --cmd cd)"

# eval "$(starship init zsh)"

# base16
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"
neofetch
# Install it
# fortune | cowsay | lolcat

kitty + complete setup zsh | source /dev/stdin

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man'"

# CDPATH
setopt auto_cd
cdpath=($HOME/dotfiles $HOME/.config)

# NVIM
export NVIM_TUI_ENABLE_TRUE_COLOR=1 
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1 
export NVIM_PYTHON_LOG_FILE="/tmp/.log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# source /home/arpangreat/tokyonight.nvim/extras/zsh_tokyonight_storm.zsh-theme
# bash ~/.config/base16-shell/scripts/base16-rebecca.sh
# wal -i ~/dotfiles/wallpaper/wallpaper.jpg

# eval "$(starship init zsh)"
[ -f "/home/arpangreat/.ghcup/env" ] && source "/home/arpangreat/.ghcup/env" # ghcup-env

export JAR=/home/arpangreat/dotfiles/nvim/jdt-language-server-latest/config_linux/org.eclipse.equinox.launcher
export GRADLE_HOME=$HOME/gradle
export JAVA_HOME=/usr/lib/jvm/java-15-openjdk/
export JDTLS_CONFIG=/home/arpangreat/dotfiles/nvim/jdt-language-server-latest/config_linux
export WORKSPACE=$HOME/javaexsnew

function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}

compctl -K _pip_completion pip3

# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--preview "bat --color 'always' {}"
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview 'bat --color "always" {}'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_CTRL_R_OPTS='--sort --exact'
export FZF_CTRL_R_OPTS="--preview 'bat --color "always" {}'"
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

fpath=(~/.zsh.d/ $fpath)

# zsh-vi-mode
ZVM_CURSOR_STYLE_ENABLED=false

function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

export GOPATH=$HOME/go
export LLVM_ROOT=$HOME/llvm-project
# source $HOME/tomnomnom/gf/gf-completion.zsh
export PATH=$PATH:$GOPATH/go/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin

# set a valid path to your vault
export VAULT_PATH=/home/arpangreat/wiki/

# set a valid path to your editor
export VAULT_EDITOR=/usr/bin/nvim

# Spaceship configs
SPACESHIP_BATTERY_THRESHOLD=30
SPACESHIP_VI_MODE_COLOR=#ff87d7
SPACESHIP_CHAR_SYMBOL='➜ '
SPACESHIP_CHAR_SUFFIX=' '
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

# Some things for peco
bindkey -s '^o' 'cdtm\n'
bindkey -s '^x' 'clear\n'

alias luamake=/home/arpangreat/.config/nvim/lua-language-server/3rd/luamake/luamake

# added by travis gem
[ ! -s /home/arpangreat/.travis/travis.sh ] || source /home/arpangreat/.travis/travis.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions
# export TERM=xterm-256color-italic
fpath+=/home/arpangreat/dotfiles/bottom/completion/_btm
export TERM=xterm-256color-italic
export PATH=/home/arpangreat/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$PATH:/home/arpangreat/Downloads/go/bin
export PATH=$PATH:/home/arpangreat/.local/bin

source /home/arpangreat/.zprofile
fpath=(~/.zsh.d/ $fpath)
fpath=(~/.zsh.d/ $fpath)
fpath=(~/.zsh.d/ $fpath)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

