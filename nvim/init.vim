
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
filetype plugin indent on

source $HOME/dotfiles/nvim/plugin/plugins.vim

" Lua file
" lua require('arpangreat')
lua require('settings')
lua require('nv-compe')
lua require('lua-ls')
" lua require('nvcoder')
" lua require('nv-galaxyline')
lua require('snippets-nvim')
lua require('nv-treesitter')
lua require('nv-nerdtree')
lua require('nv-nerdcommenter')
lua require('nv-autopairs')
lua require('nv-ale')
lua require('nv-embark')
lua require('nv-fzf')
lua require('nv-indentline')
lua require('nv-nvim-devicons')
lua require('nv-bufferlines')
lua require('mappings')
lua require('nv-startify')
lua require('nv-airline')
lua require('nv-lsp-configs')

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
