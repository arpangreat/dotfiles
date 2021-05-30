-- ======================================================================================
--   _____                  _   _ _                   _
--  / ____|                | | (_) |        /\       | |
-- | (_____      ____ _ ___| |_ _| | __    /  \   ___| |__   __ _ _ __ _   _ _   _  __ _
--  \___ \ \ /\ / / _` / __| __| | |/ /   / /\ \ / __| '_ \ / _` | '__| | | | | | |/ _` |
--  ____) \ V  V / (_| \__ \ |_| |   <   / ____ \ (__| | | | (_| | |  | |_| | |_| | (_| |
-- |_____/ \_/\_/ \__,_|___/\__|_|_|\_\ /_/    \_\___|_| |_|\__,_|_|   \__, |\__, |\__,_|
--                                                                      __/ | __/ |
--                                                                     |___/ |___/
--
--========================================================================================
vim.cmd("source $HOME/dotfiles/nvim/plugin/plugins.vim")

-- Lua file
require('arpangreat')
require('settings')
require('nv-compe')
require('lua-ls')
-- require('nvcoder')
require('nv-galaxyline')
require('snippets-nvim')
require('nv-treesitter')
require('nv-telescope')
require('nv-nerdcommenter')
-- require('nv-autopairs')
require('nv-lua-autopairs')
require('nv-autotag')
require('nv-ale')
-- require('nv-embark')
-- require('nv-tokyodark')
-- require('nv-onebuddy')
-- require('nv-spacebuddy')
require('nv-material')
-- require('nv-nightbuddy')
-- require('nv-tokyonight')
-- require('nv-oceanic-material')
-- require('nv-gruvbox-flat')
require('nv-fzf')
require('nv-indentline')
require('nv-indent-blankline')
-- require('nv-indent-guides')
require('nv-nvim-devicons')
require('nv-bufferlines')
require('mappings')
-- require('nv-startify')
require('nv-dashboard')
-- require('nv-airline')
require('nv-rainbow')
require('nv-gitsigns')
-- require('nv-nvim-tree')
require('nv-lsp-configs')

vim.cmd("highlight TelescopeBorder guifg=#d16d9e")
vim.cmd("highlight TelescopePromptPrefix guifg=red")
vim.cmd("hi FloatermBorder guifg=cyan")
vim.cmd("let g:gitgutter_enabled = 1")
vim.cmd("let g:gitgutter_signs = 0")
vim.cmd("let g:airline_disable_statusline = 1")
vim.cmd("let g:lsc_auto_map = v:true")
vim.cmd("let g:go_gopls_enabled = 0")
vim.cmd("let g:zig_fmt_autosave = 1")
vim.cmd("let test#python#pytest#options = '--color=yes'")
vim.cmd("let test#javascript#jest#options = '--color=always'")
-- let g:airline_theme = 'deus'
vim.api.nvim_exec("set statusline+=%{get(b:,'gitsigns_status','')}", true)
--Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
--
--If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
--(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
vim.cmd([[
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
]])

require'nvim_utils'
require'colorizer'.setup()

vim.api.nvim_exec([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]], true)

vim.api.nvim_exec([[
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
]], true)

vim.api.nvim_exec([[
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Prettier
augroup END
]], true)

vim.api.nvim_exec([[
augroup UltestRunner
    au!
    au BufWritePost * UltestNearest
augroup END
]], true)

-- Try to prevent bad habits like using the arrow keys for movement. This is
-- not the only possible bad habit. For example, holding down the h/j/k/l keys
-- for movement, rather than using more efficient movement commands, is also a
-- bad habit. The former is enforceable through a .vimrc, while we don't know
-- how to prevent the latter.
-- Do this in normal mode...
vim.cmd('nnoremap <Left>  :echoe "Use h"<CR>')
vim.cmd('nnoremap <Right> :echoe "Use l"<CR>')
vim.cmd('nnoremap <Up>    :echoe "Use k"<CR>')
vim.cmd('nnoremap <Down>  :echoe "Use j"<CR>')
-- ...and in insert mode
vim.cmd('inoremap <Left>  <ESC>:echoe "Use h"<CR>')
vim.cmd('inoremap <Right> <ESC>:echoe "Use l"<CR>')
vim.cmd('inoremap <Up>    <ESC>:echoe "Use k"<CR>')
vim.cmd('inoremap <Down>  <ESC>:echoe "Use j"<CR>')
