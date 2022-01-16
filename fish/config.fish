set -gx EDITOR nvim

# Go
set -g GOPATH $HOME/go


# abbrs
abbr -a e emacs
abbr -a v vim
abbr -a nv nvim
abbr -a brc vim ~/.bashrc
abbr -a vrc vim ~/.vimrc
abbr -a src nvim ~/.config/sway/config
abbr -a ec emacsclient
abbr -a nrc nvim ~/.config/nvim/init.lua
abbr -a s sudo
abbr -a sv sudo vim
abbr -a snv sudo nvim
abbr -a se sudo emacs
abbr -a sec sudo emacsclient
abbr -a ch sudo chmod +x
abbr -a chu sudo chmod u+x
abbr -a rd sudo rmdir
abbr -a rf sudo rm -rf
abbr -a g git
abbr -a gc git clone
abbr -a gP git pull
abbr -a gp git push -u origin master
abbr -a gf $GOPATH/bin/gf
abbr -a arc vim ~/.config/alacritty/alacritty.yml
abbr -a zrc nvim ~/.zshrc
abbr -a trc nvim ~/.tmux.conf
abbr -a frc nvim ~/dotfiles/fish/config.fish
abbr -a sld sway-launcher-desktop
abbr -a tm tmux -u
abbr -a cht cht.sh
abbr -a ide bash ~/dotfiles/custom-scripts/ide.sh
abbr -a rusttm ~/dotfiles/custom-scripts/./rusttm
abbr -a gotm ~/dotfiles/custom-scripts/./gotm
abbr -a javatm ~/dotfiles/custom-scripts/./javatm
abbr -a tstm ~/dotfiles/custom-scripts/./tstm
abbr -a nvtm ~/dotfiles/custom-scripts/./nvtm
abbr -a pytm ~/dotfiles/custom-scripts/./pytm
abbr -a notes nvim ~/wiki/index.md
abbr -a projectCreate bash ~/dotfiles/custom-scripts/projectCreate.sh
abbr -a na ~/My-First-Plugin/./nvim.appimage
abbr -a ll exa -l -g --icons
abbr -a ls exa -l -g --icons
abbr -a la exa -l -g --icons -a
abbr -a lt exa -l -g --icons --tree
abbr -a lta exa -l -g --icons --tree -a
abbr -a l ls
abbr -a lg lazygit
abbr -a obs QT_QPA_PLATFORM xcb obs

fish_vi_key_bindings

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

function fish_greeting
	neofetch

	set_color normal


function cgit
	git add .
	git init
	git commit -m "'$1'"
	git push -u origin master
end

end
