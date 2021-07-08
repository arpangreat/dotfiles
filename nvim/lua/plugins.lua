local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}


  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  use {
    'glepnir/galaxyline.nvim', branch = 'main', 
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim'}

  use 'edkolev/promptline.vim'
  use 'VundleVim/Vundle.vim'
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  use 'p00f/nvim-ts-rainbow'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'vuciv/vim-bujo'
  use 'airblade/vim-gitgutter'
  use 'majutsushi/tagbar'
  use 'preservim/nerdcommenter'
  -- use 'folke/todo-comments.nvim'
  use '/home/arpangreat/todo-comments.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'sainnhe/tmuxline.vim'
  -- use 'glepnir/indent-guides.nvim'
  
  -- Colorscheme
  use 'rigellute/shades-of-purple.vim'
  use 'chriskempson/base16-vim'
  use 'bluz71/vim-nightfly-guicolors'
  use {'embark-theme/vim', as = 'embark' }
  use 'tjdevries/gruvbuddy.nvim'
  use 'DilanGMB/nebulous.nvim'
  use 'marko-cerovac/material.nvim'
  use 'Th3Whit3Wolf/onebuddy'
  use 'Th3Whit3Wolf/spacebuddy'
  use 'connorholyday/vim-snazzy'
  use 'arzg/vim-colors-xcode'
  -- use 'ghifarit53/tokyonight-vim'
  use {'ghifarit53/daycula-vim' , branch = 'main'}
  use 'dylanaraps/wal.vim'
  use 'gruvbox-community/gruvbox'
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/zephyr-nvim'
  use 'glepnir/oceanic-material'
  -- use 'glepnir/prodoc.nvim'
  use 'tiagovla/tokyodark.nvim'
  use 'folke/tokyonight.nvim'
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'ful1e5/onedark.nvim'
  use 'sainnhe/gruvbox-material'
  
  -- Language specific
  use 'tpope/vim-surround'
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/popup.nvim'
  use 'norcalli/nvim_utils'
  use 'windwp/nvim-ts-autotag'
  -- use 'windwp/nvim-autopairs'
  
  use 'anott03/nvim-lspinstall'
  use 'dart-lang/dart-vim-plugin'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'
  use 'svermeulen/vimpeccable'
  -- use 'hrsh7th/nvim-compe'
  -- use 'hrsh7th/vim-vsnip'
  -- use 'rafamadriz/friendly-snippets'
  -- use 'hrsh7th/vim-vsnip-integ'
  use 'kyazdani42/nvim-tree.lua'
  
  -- Vim Only
  use 'roxma/nvim-yarp'
  use 'roxma/vim-hug-neovim-rpc'
  use 'simrat39/symbols-outline.nvim'
  
  use 'janko/vim-test'
  use {'rcarriga/vim-ultest', run = ':UpdateRemotePlugins'}
  
  
  use 'nvim-treesitter/playground'
  
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'nvim-telescope/telescope-github.nvim'
  use 'nvim-telescope/telescope-frecency.nvim' 
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-z.nvim'
  use 'tami5/sql.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  
  use 'tjdevries/nlua.nvim'
  use 'tjdevries/lsp_extensions.nvim'
  use 'tjdevries/cyclist.vim'
  use 'norcalli/snippets.nvim'
  use 'ryanoasis/vim-devicons'
  use 'rstacruz/sparkup'
  use 'vimwiki/vimwiki'
  use 'rust-lang/rust.vim'
  use 'ziglang/zig.vim'
  use 'Pocco81/DAPInstall.nvim'
  
  -- use 'mhinz/vim-startify'
  use 'glepnir/dashboard-nvim'
  -- use 'Yggdroot/indentLine'
  use 'akinsho/nvim-bufferline.lua'
  use 'kshenoy/vim-signature'
  use 'tpope/vim-git'
  use 'liuchengxu/vim-which-key'
  -- use 'prettier/vim-prettier', { 'do': 'npm install' }
  use 'sbdchd/neoformat'
  use 'mattn/emmet-vim'
  
  use 'SirVer/ultisnips'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use 'honza/vim-snippets'
  use 'mbbill/undotree'
  use 'ThePrimeagen/vim-be-good'
  -- use 'fatih/vim-go'
  use {'nsf/gocode', rtp = 'nvim', run = '~/.config/nvim/plugged/gocode/nvim/symlink.sh'}
  use 'OmniSharp/omnisharp-vim'
  use 'christoomey/vim-tmux-navigator'
  use 'ThePrimeagen/git-worktree.nvim'
  use 'voldikss/vim-floaterm'
  use 'rhysd/git-messenger.vim'
  use 'kristijanhusak/orgmode.nvim'

-- use 'govim/govim'
end)

