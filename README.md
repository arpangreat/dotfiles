# dotfiles

Hey this is my dotfiles repository ,From which you can download my config files

[#](#) I'm a n00b

# The Anime Wallpapers are provided by a git repo by

-- [ThePrimeagen](https://github.com/ThePrimeagen/anime)

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
sudo npm install -g ocaml-language-server
```
# to setup lua lsp [follow this link](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)) , and don't forget to make a directory under ~/.config/nvim named as language-server and do everything under it 

# to setup gopls run 
```shell
cd dotfiles/
GO111MODULE=on go get -u golang.org/x/tools/gopls@latest
sudo ln -s /home/arpangreat/go/bin/* /usr/bin
```
# To setup jdtls
- first delete ~/dotfiles/nvim/jdtl-language-server-latest by `rm -rf jdt-language-latest-server`
- then , extract ~/dotfiles/nvim/jdt-language-server-latest.tar.gz inside `~/dotfiles/nvim/`
- tweak `.zshrc` respective java file paths if needed
- **make project with `projectCreate` script inside ~/dotfiles/custom-scripts and lang name should be `gradle` not `java`**
- And you are all done 

# after doing everything don't forget to run ```:TSInstall all``` in nvim to install Treesitter

# to use screenshot.sh run
```shell
sudo pacman -S grim
sudo pacman -S slurp
```
# try to make a install script for installing everything
