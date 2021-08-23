# dotfiles

Hey this is my dotfiles repository ,From which you can download my config files

[#](#) I'm a n00b

# * My default desktop Environment `i3` and `kitty` with `zsh` and `neofetch` , The prompt is [Spaceship](https://github.com/denysdovhan/spaceship-prompt) and the color is [tokyonight](https://github.com/folke/tokyonight.nvim.git)
![Screenshot-kitty-edit](https://user-images.githubusercontent.com/46556080/130472647-06c94f11-6a27-4014-af91-8fc98093201f.png)


# * My Love ❤️ and default Editor is [neovim](https://github.com/neovim/neovim), the Starting screen is [Dashboard.nvim](https://github.com/glepnir/dashboard-nvim) and the statusline is [Galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) made by [glepnir](https://github.com/glepnir)
![Screenshot-nvim-edit](https://user-images.githubusercontent.com/46556080/130472702-c931eac2-cedc-427f-bc25-d8305d3982f1.png)


# * One of my Nvim-essential and all time ❤️ is [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) file picker
![Screenshot-telescope-edit](https://user-images.githubusercontent.com/46556080/130472758-f8f79bc0-6c9c-490b-87f9-fc70d8892240.png)


# * My Favourite Colorscheme for now is  [tokyonight.nvim](https://github.com/folke/tokyonight.nvim.git) looks so sick ❤️❤️🔥
![Screenshot-colorscheme-edit](https://user-images.githubusercontent.com/46556080/130472872-99cf98e0-b69f-4bd2-9dbf-e7880dd3820e.png)


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
[sudo](sudo) pacman -S slurp
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

# Fonts ( Also see Fonts/ )
Download from [Operator Mono](https://fontsfree.net/operator-mono-medium-font-download.html)
Download from [Operator Book](https://fontsfree.net/operator-mono-book-font-download.html)
Download from [Operator Itaic](https://fontsfree.net/operator-mono-book-italic-2-font-download.html)
Download from [Operator Bold](https://fontsfree.net/operator-mono-bold-font-download.html)

## And follow this link to use [ligatures Support](https://github.com/kiliman/operator-mono-lig)
