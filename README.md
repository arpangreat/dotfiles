 # dotfiles


 Hey this is my dotfiles repository ,From which you can download my config files
 
 [#](#) I'm a n00b
 
# The Anime Wallpapers are provided by a git repo by 

-- [ThePrimeagen](https://hub.com/ThePrimeagen/anime)

# Changing Neovim in lua-config :smiley:

# A note for me ...
## To Setup Rust-analyzer for nvim Then
 -- [Follow This Link](https://sharksforarms.dev/posts/neovim-rust/)
 
## To Setup Clangd for nvim Then do this
 -- `sudo pacman -S clangd`
 -- `sudo pacman -S llvm`
 -- " Don't forget to make a project using projectCreate script else you are not going to have lsp-server"
 
 And then you are all good to Go
 
## The Nvim review is done by [ThePrimeagen](github.com/ThePrimeagen) in this video 
 -- https://www.twitch.tv/videos/968826658 from 2:04:11

## The commands to setup nvim-lsp
```shell
sudo npm install -g vim-language-server
sudo npm install -g yaml-language-server
sudo npm install -g vscode-html-languageserver-bin
sudo npm install -g vscode-json-languageserver
sudo npm install -g pyright
sudo npm install -g typescript typescript-language-server
sudo npm i -g bash-language-server
sudo npm install -g vscode-css-languageserver-bin
sudo npm install -g dockerfile-language-server-nodejs
```
# to setup lua lsp [follow this link](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)) , and don't forget to make a directory under ~/.config/nvim named as language-server and do everything under it 

# to setup gopls run 
```shell
cd dotfiles/
GO111MODULE=on go get -u golang.org/x/tools/gopls@latest
sudo ln -s /home/arpangreat/go/bin/* /usr/bin
```
# To use z with Zsh [Download from this link](https://github.com/agkozak/zsh-z)

# To Download [cht.sh](https://github.com/chubin/cheat.sh)
```shell
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh
```
