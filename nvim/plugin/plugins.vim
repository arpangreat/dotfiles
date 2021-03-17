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
" Plug 'scrooloose/syntastic'
" Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
"Plug "ThePrimeagen/vim-apm"
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
"Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
" Plug 'raimondi/delimitmate'
Plug 'stsewd/fzf-checkout.vim'
" Colorscheme
" Plug 'morhetz/gruvbox'
Plug 'rigellute/shades-of-purple.vim'
" Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'ayu-theme/ayu-vim' " or other package manager
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'crusoexia/vim-monokai'
" Plug 'rakr/vim-one'
" Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'connorholyday/vim-snazzy'
Plug 'arzg/vim-colors-xcode'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}
Plug 'dylanaraps/wal.vim'
"0 Language specific
"Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'anott03/nvim-lspinstall'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'svermeulen/vimpeccable'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Plug 'svermeulen/vimpeccable-lua-vimrc-example'
" Plug 'tjdevries/express_line.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
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
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'kshenoy/vim-signature'
Plug 'gruvbox-community/gruvbox'
Plug 'kdheepak/lazygit.nvim'
Plug 'powerline/powerline'
Plug 'tpope/vim-git'
Plug 'liuchengxu/vim-which-key'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mattn/emmet-vim'

if has('nvim')
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/denite.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good'
Plug 'fatih/vim-go'	
Plug 'OmniSharp/omnisharp-vim'
" Plug 'nvim-treesitter/nvim-treesitter'
call s:local_plug('my_cyclist.vim')
" Plug 'govim/govim'
" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required
