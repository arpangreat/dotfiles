
" ======================================================================================
"   _____                  _   _ _                   _
"  / ____|                | | (_) |        /\       | |
" | (_____      ____ _ ___| |_ _| | __    /  \   ___| |__   __ _ _ __ _   _ _   _  __ _
"  \___ \ \ /\ / / _` / __| __| | |/ /   / /\ \ / __| '_ \ / _` | '__| | | | | | |/ _` |
"  ____) \ V  V / (_| \__ \ |_| |   <   / ____ \ (__| | | | (_| | |  | |_| | |_| | (_| |
" |_____/ \_/\_/ \__,_|___/\__|_|_|\_\ /_/    \_\___|_| |_|\__,_|_|   \__, |\__, |\__,_|
"                                                                      __/ | __/ |
"                                                                     |___/ |___/
"
"========================================================================================

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
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" lua require('init')

" Configs for Plugs
source $HOME/dotfiles/nvim/plug_config/ale.vim
" source $HOME/dotfiles/nvim/plug_config/lightline.vim
source $HOME/dotfiles/nvim/plug_config/auto_pairs.vim
source $HOME/dotfiles/nvim/plug_config/cyclist.vim
source $HOME/dotfiles/nvim/plug_config/fzf.vim
source $HOME/dotfiles/nvim/plug_config/fzf_better.vim
source $HOME/dotfiles/nvim/plug_config/nerdtree.vim
source $HOME/dotfiles/nvim/plug_config/nerdtree_git.vim
source $HOME/dotfiles/nvim/plug_config/nerdcommenter.vim
source $HOME/dotfiles/nvim/plug_config/norcalli_snippets.vim
source $HOME/dotfiles/nvim/plug_config/rainbow_parenthesis.vim
source $HOME/dotfiles/nvim/plug_config/startify.vim
source $HOME/dotfiles/nvim/plug_config/syntastic.vim
source $HOME/dotfiles/nvim/plug_config/treesitter.vim
source $HOME/dotfiles/nvim/plug_config/vim-airline.vim
source $HOME/dotfiles/nvim/plug_config/ycm.vim
source $HOME/dotfiles/nvim/plug_config/nvim-devicons.vim
source $HOME/dotfiles/nvim/plug_config/indentline.vim
source $HOME/dotfiles/nvim/plug_config/powerline.vim
source $HOME/dotfiles/nvim/plug_config/vim_git.vim
source $HOME/dotfiles/nvim/plug_config/lazygit.vim
source $HOME/dotfiles/nvim/plug_config/denite.vim
source $HOME/dotfiles/nvim/plug_config/ranger.vim
source $HOME/dotfiles/nvim/lua/nv-compe/compe.vim

" Configs for themes
source $HOME/dotfiles/nvim/themes/ayu.vim
source $HOME/dotfiles/nvim/themes/base16.vim
source $HOME/dotfiles/nvim/themes/embark.vim
source $HOME/dotfiles/nvim/themes/nightfly.vim
source $HOME/dotfiles/nvim/themes/palenight.vim
source $HOME/dotfiles/nvim/themes/purify.vim
source $HOME/dotfiles/nvim/themes/vim_one.vim
" source $HOME/dotfiles/nvim/themes/gruvbuddy.vim
source $HOME/dotfiles/nvim/themes/gruvbox.vim
source $HOME/dotfiles/nvim/themes/xcode.vim
source $HOME/dotfiles/nvim/themes/tokyo.vim


" Configs for mappings

source $HOME/dotfiles/nvim/mappings/mappings.vim

" Lua file
" lua require('arpangreat')
lua require('init')
lua require('settings')
lua require('nv-compe')


let g:lsc_auto_map = v:true
" let g:airline_theme = 'deus'

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif


augroup LuaHighLight
    au!
    au TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>


let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.rls.setup{ on_attach=require'completion'.on_attach }
let g:LanguageClient_serverCommands = { 
            \ 'typescript': ['typescript-language-server', '--stdio', '--tsserver-path', 'node_modules/.bin/tsserver'], 
            \ }
lua require'lspconfig'.vimls.setup{ on_attach=require'completion'.on_attach }
" nvim_lsp#setup("bashls", {config})
"
"   Default Values:
"     cmd = { "bash-language-server", "start" }
"     filetypes = { "sh" }
"     log_level = 2
"     root_dir = vim's starting directory
"     settings = {}
" inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <buffer> <silent><expr> <C-space> coc#refresh()
"
" " GoTo code navigation.
" nmap <buffer> <leader>cd <Plug>(coc-definition)
" nmap <buffer> <leader>cy <Plug>(coc-type-definition)
" nmap <buffer> <leader>rg <Plug>(coc-implementation)
" nmap <buffer> <leader>cr <Plug>(coc-references)
" nmap <buffer> <leader>rr <Plug>(coc-rename)
" nnoremap <buffer> <leader>cr :CocRestart
"
