# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/arpangreat/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
    zsh-completions
    zsh-autosuggestions  
    zsh-syntax-highlighting  
    zsh-z
)


autoload -U compinit && compinit

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
# Custom aliases
alias e='emacs'
alias v='vim'
alias nv='nvim'
alias brc='vim ~/.bashrc'
alias vrc='vim ~/.vimrc'
alias src='nvim ~/.config/sway/config'
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
alias g='git'
alias gc='git clone'
alias gP='git pull'
alias gp='git push -u origin master'
alias gf='$GOPATH/bin/gf'
alias arc='vim ~/.config/alacritty/alacritty.yml'
alias zrc='nvim ~/.zshrc'
alias trc='nvim ~/.tmux.conf'
alias sld='sway-launcher-desktop'
alias tm='tmux -u'
alias cht='cht.sh'
alias ide='bash ~/dotfiles/custom-scripts/ide.sh'
alias rusttm='~/dotfiles/custom-scripts/./rusttm'
alias gotm='~/dotfiles/custom-scripts/./gotm'
alias javatm='~/dotfiles/custom-scripts/./javatm'
alias tstm='~/dotfiles/custom-scripts/./tstm'
alias nvtm='~/dotfiles/custom-scripts/./nvtm'
alias pytm='~/dotfiles/custom-scripts/./pytm'
alias z='~/z/./z.sh'
alias notes='nvim ~/wiki/index.md'
alias projectCreate='bash ~/dotfiles/custom-scripts/projectCreate.sh'
alias na='~/My-First-Plugin/./nvim.appimage'
alias ll='exa -l -g --icons'
alias la='exa -l -g --icons -a'
alias lt='exa -l -g --icons --tree'
alias l='ls'
alias obs="QT_QPA_PLATFORM=xcb obs"

bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# base16
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
neofetch
# Install it
# fortune | cowsay | lolcat

bash ~/.config/base16-shell/scripts/base16-rebecca.sh
# wal -i ~/dotfiles/wallpaper/wallpaper.jpg

eval "$(starship init zsh)"
[ -f "/home/arpangreat/.ghcup/env" ] && source "/home/arpangreat/.ghcup/env" # ghcup-env

export JAR=/path/to/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar
export GRADLE_HOME=$HOME/gradle
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.9.11-9.fc33.x86_64/
export JDTLS_CONFIG=/path/to/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux
export WORKSPACE=$HOME/workspace

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
fpath=(~/.zsh.d/ $fpath)

export GOPATH=$HOME/go
source $HOME/tomnomnom/gf/gf-completion.zsh
export PATH=$PATH:$GOPATH/go/bin

# set a valid path to your vault
export VAULT_PATH=/home/arpangreat/wiki/

# set a valid path to your editor
export VAULT_EDITOR=/usr/bin/nvim

# export ANDROID_SDK=
#
# [ -d "$HOME/Library/Android/sdk" ] && ANDROID_SDK=$HOME/Library/Android/sdk || ANDROID_SDK=$HOME/Android/Sdk
# echo "export ANDROID_SDK=$ANDROID_SDK" >> ~/`[[ $SHELL == *"zsh" ]] && echo '.zshenv' || echo '.bash_profile'`
