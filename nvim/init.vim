
" enter the current millenium
set nocompatible
set cursorline
set mouse+=a
set autoindent
set hlsearch
set incsearch
set number
set showcmd
set clipboard=unnamedplus
set relativenumber
set shortmess+=I
set laststatus=2
set backspace=indent,eol,start
"set kscb
set hidden
set ignorecase
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set updatetime=100
set nowrap
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey                                                    

set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set t_Co=256
set termguicolors
set encoding=UTF-8
set ttimeoutlen=50


call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
" Plug 'scrooloose/syntastic'
" Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
"Plug "ThePrimeagen/vim-apm"
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
"Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'stsewd/fzf-checkout.vim'
" Colorscheme
Plug 'morhetz/gruvbox'
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
"0 Language specific
"Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'dense-analysis/ale'
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'tjdevries/cyclist.vim'
Plug 'norcalli/snippets.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'rstacruz/sparkup'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/vim-be-good'
Plug 'fatih/vim-go'	
Plug 'OmniSharp/omnisharp-vim'
Plug 'nvim-treesitter/nvim-treesitter'
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
" Put your non-Plug stuff after this line
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
"
" "vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"gruvbox
" set background=dark
" Setting dark mode
"let g:gruvbox_hls_cursor
"colorscheme gruvbox

" lightline

"let g:lightline = {
"      \ 'colorscheme': 'onedark',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'FugitiveHead'
"      \ },
"      \ }
"
"
"function! LightlineGitGutter()
"  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
"    return ''
"  endif
"  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
"  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
"endfunction
"

" Ale Configs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

let g:airline#extensions#ale#enabled = 1
set statusline=%{LinterStatus()}
nmap <silent> <C-l> <Plug>(ale_previous_wrap)
nmap <silent> <C-h> <Plug>(ale_next_wrap)
" NERDTree Configs

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',    
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

call cyclist#add_listchar_option_set('busy', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',    
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

" Add a new named configuration
" call cyclist#add_listchar_option_set('limited', {
"         \ 'eol': '↲',
"         \ 'tab': '» ',
"         \ 'trail': '·',
"         \ 'extends': '<',
"         \ 'precedes': '>',
"         \ 'conceal': '┊',
"         \ 'nbsp': '␣',
"         \ })
"
" " Cycle to the next configuration
" nmap <leader>cn <Plug>CyclistNext
" nmap <leader>cp <Plug>CyclistPrev
"
" " Set a specific configuration
" call cyclist#activate_listchars('limited')
"
" " Reset to default configuration
" call cyclist#activate_listchars('default')
"
" " Override just one value in a configuration
" "   Each of the `cyclist#set_*` is based on the names in `:help listchars`
"
" " TRAIL U+2591
" call cyclist#set_trail('default', '░')
"
" " PRECEDES & EXTENDS
" call cyclist#set_preceds('default', '☚')
" call cyclist#set_extends('default', '☛')

" lua require'nvim-web-devicons'.setup()
"
" lua require'nvim-web-devicons'.get_icon(filename, extension, options)

" Monokai Colorscheme
"colorscheme monokai
"let g:monokai_term_italic = 1
"let g:monokai_gui_italic = 1

" Norcalli snippets
lua require'snippets'.use_suggested_mappings()

" This variant will set up the mappings only for the *CURRENT* buffer.
lua require'snippets'.use_suggested_mappings(true)

" There are only two keybindings specified by the suggested keymappings, which is <C-k> and <C-j>
" They are exactly equivalent to:

" <c-k> will either expand the current snippet at the word or try to jump to
" the next position for the snippet.
inoremap <c-K> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>

" <c-j> will jump backwards to the previous field.
" If you jump before the first field, it will cancel the snippet.
inoremap <c-J> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>






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


" Vim One Dark Colorscheme

"colorscheme onedark

"let g:onedark_terminal_italics = 1

"let g:airline_theme='onedark'

" Challenger deep Colorscheme

"colorscheme challenger_deep


" Purify Colorscheme
"colorscheme purify
"let g:airline_theme='purify'


" Vim-One Colorscheme
"let g:airline_theme='one'
"colorscheme one
"set background=dark
"let g:one_allow_italics = 1

"if (empty($TMUX))
"  if (has("nvim"))
 "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
" endif


" Palenite Colorscheme
"set background=dark
"colorscheme palenight
"let g:airline_theme = "palenight"
"if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif

"let g:palenight_terminal_italics=1


" Ayu Colorscheme

"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

"rainbow parenthesis
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]


let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"airline theme
"let g:airline_theme='deus'

"auto pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

"Purple theme
"colorscheme shades_of_purple
 "if (has("termguicolors"))
  "set termguicolors
 "endif

" Embark Theme 
colorscheme embark
let g:airline_theme = 'embark'
let g:embark_terminal_italics = 1



" let g:shades_of_purple_airline = 1
"let g:airline_theme='shades_of_purple'

" Base16 colorscheme


"colorscheme base16-default-dark

" Treesitter configs

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = { enable = true },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = { enable = true },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
EOF




" lua <<EOF
" totally optional to use setup
" require('telescope').setup{
"   defaults = {
"     shorten_path = false -- currently the default value is true
"   }
" }
" EOF
"
" nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
" nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>

"
" <C-n>  <C-p> next | previous
" <Down> <Up>  next | previous
" j      k     next | previous (in normal mode)
" <CR>         go to file selection
"
" <C-x>        go to file selection as a split
" <C-v>        go to file selection as a vertical split
" <C-t>        go to a file in a new tab
"
" <C-u>        scroll up in preview window
" <C-d>        scroll down in preview window
"
" <C-c>        close telescope
" <Esc>        close telescope (in normal mode)

" -- Fuzzy find over git files in your directory
" require('telescope.builtin').git_files()
"
" -- Grep files as you type (requires rg currently)
" require('telescope.builtin').live_grep()
"
" -- Use builtin LSP to request references under cursor. Fuzzy find over results.
" require('telescope.builtin').lsp_references()
"
" -- Convert currently quickfixlist to telescope
" require('telescope.builtin').quickfix()
"
" -- Convert currently loclist to telescope
" require('telescope.builtin').loclist()

" Intregating with Base16-theme as of the terminal

"if filereadable(expand("~/.vimrc_background"))
" let base16colorspace=256
" source ~/.vimrc_background
"endif
" colorscheme for pywal
"
" colorscheme wal
"
"
" colorscheme nord

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"colorscheme nightfly
"let g:nightflyCursorColor = 1
"set background=dark
"let g:nightflyUnderlineMatchParen = 1

"if exists('&cursorlineopt')
"    set cursorlineopt=number
"    set cursorline
"endif

"function! RelativeNumberActivity(active)
"    if &diff
"        " For diffs, do nothing since we want relativenumbers in all windows.
"        return
"    endif
"    if &buftype == "nofile" || &buftype == "nowrite"
"        setlocal nonumber
"    elseif a:active == v:true
"        setlocal relativenumber
"        if exists('&cursorlineopt')
"            setlocal cursorline
"        endif
"    else
"        setlocal norelativenumber
"        if exists('&cursorlineopt')
"            setlocal nocursorline
"        endif
"    endif
"endfunction

"augroup CustomWindowActivity
"    autocmd!
"    autocmd WinEnter * call RelativeNumberActivity(v:true)
"    autocmd WinLeave * call RelativeNumberActivity(v:false)
"augroup END

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


" nerdtree with git

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" FZF getting better

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}




" YCM for Rust-Completion
let g:ycm_rust_src_path="/home/arpangreat/Developer/rust-master/src/"
let g:rustfmt_autosave = 1
nnoremap <leader>rt :RustTest!<CR>

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']



" Custom KeyBindings To make life easier
" You can change this to your own
" Remember to map Your leader by writing
" let mapleader = " "
" I use space as leader you can anything by putting 
" that character inside of the the double Qoutes

let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :NERDTree <bar> :vertical resize 25<CR>
nnoremap <leader>pp :NERDTree<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader> <C-^>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>pg :GFiles<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <leader>ttv :below vertical terminal<CR>
nnoremap \gr :GoRun<CR>
nnoremap \gb :GoBuild<CR>
nnoremap \gt :GoTest<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pr :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
" Telescope

nnoremap <Leader>tg <cmd>lua require'telescope.builtin'.git_files{}<CR>
" Searches over files in a git folder. Note: This does not work outside a git repo folder.

nnoremap <Leader>tf <cmd>lua require'telescope.builtin'.find_files{}<CR>
" || Search over files in your cwd current working directory. ||

nnoremap <Leader>gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
" Search over variable references from your Language Server.

nnoremap <Leader>ts <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>


nnoremap <Leader>tn <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
nmap<F8> :TagbarToggle<CR>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gv :GitFiles<CR>
nnoremap <leader>r :source %<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gf :Gpull<CR>
nnoremap <leader>go :GCheckout<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :wq<CR>
nnoremap <leader>e :q!<CR>

" Nvim Lsp mappings
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>


let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
" lua require'nvim_lsp'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.rls.setup{ on_attach=require'completion'.on_attach }

lua require'nvim_lsp'.vimls.setup{ on_attach=require'completion'.on_attach }
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
