" FEATURES TO COVER:
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File Browsing
" - Snippets
" - Build Integration (if we have time)



" GOALS OF THIS TALK:
" - Increase Vim understanding
" - Offer powerful options

" NOT GOALS OF THIS TALK:
" - Hate on plugins
" - Get people to stop using plugins





" {{{ BASIC SETUP
" BASIC SETUP:

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
set nowrap
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey                                                    

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set t_Co=256
set termguicolors
set encoding=utf-8
set ttimeoutlen=50







" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
command! Cpp !g++ -std=c++17 -Wshadow -Wall -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
command! Cargob !cargo build --release
command! Cargor !cargo run
nnoremap <C-c><C-b> :!cargo build --release<CR>
inoremap <C-c><C-b> <ESC> :!cargo build --release<CR>
nnoremap <C-c><C-r> :!cargo run<CR>
inoremap <C-c><C-r> <ESC> :!cargo run<CR>
vnoremap <C-w> "+y
nnoremap <C-x> "+p
"Create a cpp file
"
"
" 
"
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags





" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list





" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,java :-1read $HOME/.vim/.skeleton.java<CR>3jwf>a
nnoremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>4jf>a
nnoremap ,syso :-1read $HOME/.vim/.sysoskeleton.java<CR>5wllf<a>



" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)









" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back





"                          THANK YOU!

"                    Download this file at:
"                github.com/mcantor/no_plugins

"                Follow me for kitten pictures:
"                     twitter.com/mcantor

"          Contact me at `max at maxcantor dot net` for:
"                  - Consulting (Dev and PM)
"                          - Tutoring
"                     - Classroom Teaching
"                     - Internal Training
"                       - Encouragement

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
" Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'
Plug 'vifm/vifm'
Plug 'vifm/vifm.vim'
Plug 'mcchrish/nnn.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'rigellute/shades-of-purple.vim'
Plug 'chriskempson/base16-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'drewtempelmeyer/palenight.vim'
Plug 'crusoexia/vim-monokai'
Plug 'rakr/vim-one'
Plug 'kyoz/purify', { 'rtp': 'vim' }
" Language specific
"Plug 'valloric/youcompleteme'
Plug 'rstacruz/sparkup'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'leafgarland/typescript-vim'
Plug 'wincent/terminus'
Plug 'ThePrimeagen/vim-be-good'
Plug 'fatih/vim-go'
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"gruvbox
" set background=dark
" Setting dark mode
"let g:gruvbox_hls_cursor
"colorscheme gruvbox

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

" Monokai Colorscheme
"colorscheme monokai
"let g:monokai_term_italic = 1
"let g:monokai_gui_italic = 1


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
let g:airline_theme='deus'

"auto pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

"Purple theme
"colorscheme shades_of_purple
 "if (has("termguicolors"))
  "set termguicolors
 "endif


"let g:shades_of_purple_airline = 1
"let g:airline_theme='shades_of_purple'

" Base16 colorscheme


"colorscheme base16-default-dark



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

colorscheme nightfly
let g:nightflyCursorColor = 1
set background=dark
let g:nightflyUnderlineMatchParen = 1

if exists('&cursorlineopt')
    set cursorlineopt=number
    set cursorline
endif

function! RelativeNumberActivity(active)
    if &diff
        " For diffs, do nothing since we want relativenumbers in all windows.
        return
    endif
    if &buftype == "nofile" || &buftype == "nowrite"
        setlocal nonumber
    elseif a:active == v:true
        setlocal relativenumber
        if exists('&cursorlineopt')
            setlocal cursorline
        endif
    else
        setlocal norelativenumber
        if exists('&cursorlineopt')
            setlocal nocursorline
        endif
    endif
endfunction

augroup CustomWindowActivity
    autocmd!
    autocmd WinEnter * call RelativeNumberActivity(v:true)
    autocmd WinLeave * call RelativeNumberActivity(v:false)
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
nnoremap <leader><leader> <C-^>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>pg :GFiles<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <leader>t :below vertical terminal<CR>
nnoremap \gr :GoRun<CR>
nnoremap \gb :GoBuild<CR>
nnoremap \gt :GoTest<CR>

nnoremap <leader>gs :G<CR>
nnoremap <leader>gv :GitFiles<CR>
nnoremap <leader>r :source %<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gf :Gpull<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :wq<CR>
nnoremap <leader>e :q!<CR>


    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <C-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nmap <buffer> <leader>rr <Plug>(coc-rename)
    nnoremap <buffer> <leader>cr :CocRestart

