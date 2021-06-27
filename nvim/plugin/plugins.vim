if has('unix')
    let g:plugin_path = expand('~/.vim/plugged')
else
    let g:plugin_path = expand('$HOME') . '\nvim_plug'
endif

function! s:local_plug(package_name) abort
    if isdirectory(expand("~/plugins/" . a:package_name))
        execute "Plug '~/plugins/".a:package_name."'"
    else
        execute "Plug '~/arpangreat/".a:package_name."'"
    endif
endfunction


call plug#begin(g:plugin_path)

Plug 'edkolev/promptline.vim'
Plug 'VundleVim/Vundle.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'lewis6991/gitsigns.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'folke/todo-comments.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'glepnir/indent-guides.nvim'

" Colorscheme
Plug 'rigellute/shades-of-purple.vim'
Plug 'chriskempson/base16-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'DilanGMB/nebulous.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'Th3Whit3Wolf/spacebuddy'
Plug 'connorholyday/vim-snazzy'
Plug 'arzg/vim-colors-xcode'
" Plug 'ghifarit53/tokyonight-vim'
Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}
Plug 'dylanaraps/wal.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'glepnir/zephyr-nvim'
Plug 'glepnir/oceanic-material'
Plug 'glepnir/prodoc.nvim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'ful1e5/onedark.nvim'

" Language specific
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'norcalli/nvim_utils'
Plug 'windwp/nvim-ts-autotag'
" Plug 'windwp/nvim-autopairs'

Plug 'anott03/nvim-lspinstall'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'svermeulen/vimpeccable'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kyazdani42/nvim-tree.lua'

" Vim Only
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'janko/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim' 
Plug 'tami5/sql.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'anott03/nvim-lspinstall'
Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tjdevries/cyclist.vim'
Plug 'norcalli/snippets.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'rstacruz/sparkup'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
Plug 'ziglang/zig.vim'
Plug 'Pocco81/DAPInstall.nvim'

" Plug 'mhinz/vim-startify'
Plug 'glepnir/dashboard-nvim'
Plug 'Yggdroot/indentLine'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-git'
Plug 'liuchengxu/vim-which-key'
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'

Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good'
" Plug 'fatih/vim-go'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'OmniSharp/omnisharp-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'rhysd/git-messenger.vim'
call s:local_plug('my_cyclist.vim')

" Vim for notes

Plug 'pbrisbin/vim-mkdir'
Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 


" Plug 'govim/govim'
" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required
