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
-- vim.cmd("source /home/arpangreat/dotfiles/nvim/my-vim/plugins.vim")
-- Lua file
require("plugins")
require("arpangreat")
require("settings")
-- require('nv-compe')
require("lua-ls")
-- require('nvcoder')
-- require("nv-galaxyline")
require("snippets-nvim")
require("nv-treesitter")
-- require("nv-telescope")
require("nv-nerdcommenter")
-- require('nv-todo-comment')
-- require('nv-autopairs')
require("nv-windwp-autopairs")
require("nv-autotag")
-- require("nv-ale")
-- require('nv-embark')
-- require("nv-tokyodark")
-- require('nv-onebuddy')
-- require('nv-spacebuddy')
-- require("nv-material")
-- require('nv-nebulous')
-- require('nv-onedark')
-- require("nv-tokyonight")
-- require("nv-starry")
-- require('nv-nightfly')
require("nv-nightfox")
-- require("nv-catppuccin")
-- require("nv-kanagawa")
-- require('nv-oceanic-material')
-- require('nv-gruvbox-flat')
-- require('nv-gruvbox-material')
require("nv-fzf")
-- require('nv-indentline')
require("nv-indent-blankline")
-- require('nv-indent-guides')
require("nv-nvim-devicons")
-- require("nv-bufferlines")
require("nv-barbar")
require("mappings")
-- require("nv-kommentary")
require("nv-comment-nvim")
-- require('nv-defx')
-- require('nv-startify')
require("nv-dashboard")
-- require('nv-airline')
require("nv-nvim-cmp")
require("nv-rust-tools")
require("nv-lspkind")
-- require("nv-rainbow")
require("nv-gitsigns")
require("nv-neogit")
require("nv-diffview")
-- require('nv-nvim-tree')
require("nv-lsp-configs")
require("nv-lspsaga")
require("nv-symbols-outline")
require("nv-todo-comment")
-- require("nv-lsp-signatures")
-- require('nv-formatter')
require("nv-which-key")
-- require('nv-vsnip')
-- LuaSnip
require("utils")
require("nv-LuaSnip")
require("luasnip/loaders/from_vscode").lazy_load()
require("nv-focus")
require("nv-dap")
require("nv-dap-virtual-text")
require("nv-lualine")
require("nv-fidget")
require("nv-clangd-extension")
require("nv-notify")
require("nv-gps")
require("nv-telekasten")
-- require("nv-expressline")
-- require("cmp-npm-tutorial")

--[[ vim.cmd("highlight TelescopeBorder guifg=#d16d9e")
vim.cmd("highlight TelescopePromptPrefix guifg=red") ]]
vim.cmd("hi FloatermBorder guifg=cyan")
vim.cmd("let g:airline_disable_statusline = 1")
vim.cmd("let g:lsc_auto_map = v:true")
vim.cmd("let g:go_gopls_enabled = 0")
vim.cmd("let g:zig_fmt_autosave = 1")
vim.cmd("let test#python#pytest#options = '--color=yes'")
vim.cmd("let test#javascript#jest#options = '--color=always'")
vim.cmd("let test#strategy = 'neovim'")
vim.cmd("let test#neovim#term_position = 'vertical'")
vim.cmd("highlight NormalFloat guifg=cyan")
vim.g.neoterm_default_mod = "vertical"
vim.g.neoterm_size = 60
vim.g.neoterm_autoinsert = 1
vim.g.which_key_centered = 1
-- vim.g.snippets = "luasnip"
vim.g.committia_use_singlecolumn = "false"
vim.g.committia_min_window_width = 80
vim.cmd("let g:prettier#autoformat_config_present = 1")

vim.g.CommandTCancelMap = "<C-x>"
-- Disabling Gitgutter
vim.cmd("let g:gitgutter_enabled = 1")
vim.cmd("let g:gitgutter_signs = 0")
-- let g:airline_theme = 'deus'
-- vim.api.nvim_exec("set statusline+=%{get(b:,'gitsigns_status','')}", true)
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

require("nvim_utils")
require("colorizer").setup()

vim.api.nvim_exec(
	[[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]],
	true
)

--[[ vim.api.nvim_exec(
	[[
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
-- ]]
--	true
--) ]]

vim.api.nvim_exec(
	[[
  autocmd BufWritePre *.lua :lua require("stylua-nvim").format_file()
]],
	true
)

vim.api.nvim_exec(
	[[
if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
 else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
 endif
]],
	true
)

-- vim.api.nvim_exec([[
--   augroup Format
--   autocmd! * <buffer>
--   autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
--   augroup END
-- ]], true)

-- vim.api.nvim_exec([[
-- augroup fmt
--     autocmd!
--     autocmd BufWritePre * undojoin | Prettier
-- augroup END
-- ]], true)

-- TODO: fix it
-- Format by Nvim Lsp
-- vim.api.nvim_exec([[
--         augroup Format
--         autocmd! * <buffer>
--         autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
--         augroup END
-- ]], true)

-- vim.api.nvim_exec([[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]], true)

-- vim.cmd([[let g:completion_confirm_key = ""]])
-- vim.cmd([[
-- imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
-- ]])

--HACK:
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
