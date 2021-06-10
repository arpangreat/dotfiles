# dotfiles

Hey this is my dotfiles repository ,From which you can download my config files

[#](#) I'm a n00b

# * My default desktop Environment `i3` and `konsole` with `zsh` and `neofetch` , The prompt is [Spaceship](https://github.com/denysdovhan/spaceship-prompt) and the color is `base16_rebecca`
![Screenshot from 2021-05-31 12-34-24](https://user-images.githubusercontent.com/46556080/120154305-5fa5d900-c20d-11eb-9611-65a6ebc57632.png)

# * My Love ❤️ and default Editor is [neovim](https://github.com/neovim/neovim), the Starting screen is [Dashboard.nvim](https://github.com/glepnir/dashboard-nvim) and the statusline is [Galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) made by [glepnir](https://github.com/glepnir)
![Screenshot from 2021-05-31 12-34-31](https://user-images.githubusercontent.com/46556080/120155264-418ca880-c20e-11eb-97c2-a265160ca5f0.png)

# * One of my Nvim-essential and all time ❤️ is [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) file picker
![Screenshot from 2021-05-31 12-34-40](https://user-images.githubusercontent.com/46556080/120155503-857fad80-c20e-11eb-87c8-4b879fe94e05.png)

# * My Favourite Colorscheme for now and maybe for years is [nebulous.nvim](https://github.com/DilanGMB/nebulous.nvim) made by [DilanGMB](https://github.com/DilanGMB) , looks so sick ❤️❤️🔥
![Screenshot from 2021-05-31 12-35-24](https://user-images.githubusercontent.com/46556080/120155776-d98a9200-c20e-11eb-8e8d-fd893956af65.png)

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

# A Life hack for shell , while typing any password show asterisks for every password
```shell
sudo visudo
# Then type in any area
Defaults env_reset,pwfeedback
```

# How to setup tmux for italics [from here](https://rsapkf.xyz/blog/enabling-italics-vim-tmux)

# try to make a install script for installing everything

# IF NVIM BUILD FROM SOURCE BREAKS , use ./nvim/nvim.txt commit tag to fallback to safe zone, also use it inside official neovim repo clone inside $HOME
`git checkout #the tag`

