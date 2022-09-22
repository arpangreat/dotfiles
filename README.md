# dotfiles





Hey this is my dotfiles repository ,From which you can download my config
files 😄🚀

[#](#) I'm a n00b

# \* My default desktop Environment `i3` and `kitty` with `zsh` and `neofetch` , The prompt is [Spaceship](https://github.com/denysdovhan/spaceship-prompt) and the color is [tokyonight](https://github.com/folke/tokyonight.nvim.git)

![Screenshot-kitty-edit](https://user-images.githubusercontent.com/46556080/130490647-0488bd1d-7cc3-49ce-a6c3-c4a09809b622.png)

# \* My Love ❤️ and default Editor is [neovim](https://github.com/neovim/neovim), the Starting screen is [Dashboard.nvim](https://github.com/glepnir/dashboard-nvim) and the statusline is [Galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) made by [glepnir](https://github.com/glepnir)

![Screenshot-nvim-edit](https://user-images.githubusercontent.com/46556080/130490700-b227a906-8d26-4642-98df-81df3eda0e7e.png)

# \* One of my Nvim-essential and all time ❤️ is [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) file picker

![Screenshot-telescope-edit](https://user-images.githubusercontent.com/46556080/130490742-b6494ed2-4324-49da-8673-9c42d68ecf35.png)

# \* My Favourite Colorscheme for now and maybe for years is made [tokyonight.nvim](https://github.com/folke/tokyonight.nvim.git) looks so sick ❤️❤️🔥

![Screenshot-colorscheme-edit](https://user-images.githubusercontent.com/46556080/130490777-1116a609-d805-4b0e-a37b-5a132665269b.png)

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
sudo npm install -g pyright
sudo npm install -g typescript typescript-language-server
sudo npm i -g bash-language-server
sudo npm i -g vscode-langservers-extracted
sudo npm install -g dockerfile-language-server-nodejs
sudo npm install -g ocaml-language-server
sudo npm install -g vls
sudo yarn global add yaml-language-server
```

# to setup lua lsp [follow this link](<https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)>) , and don't forget to make a directory under ~/.config/nvim named as language-server and do everything under it

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

# after doing everything don't forget to run `:TSInstall all` in nvim to install Treesitter

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

# IF TOUCHPAD DOESN'T WORK Then

[visit](https://askubuntu.com/questions/1280240/lenovo-touchpad-v15-iil-not-working-10th-gen-intel)

# Fonts ( Also see Fonts/ )

Download from [Operator Mono](https://fontsfree.net/operator-mono-medium-font-download.html)
Download from [Operator Book](https://fontsfree.net/operator-mono-book-font-download.html)
Download from [Operator Itaic](https://fontsfree.net/operator-mono-book-italic-2-font-download.html)
Download from [Operator Bold](https://fontsfree.net/operator-mono-bold-font-download.html)

## And follow this link to use [ligatures Support](https://github.com/kiliman/operator-mono-lig)
