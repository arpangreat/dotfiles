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
-- require("impatient")

require("settings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = true },
	change_detection = {
		notify = false,
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("mappings")
	end,
})

require("arpangreat")
-- require('nvcoder')
-- require("nv-galaxyline")
require("snippets-nvim")
require("nv-treesitter")
--require("nv-telescope")
require("nv-nerdcommenter")
-- require('nv-todo-comment')
-- require('nv-autopairs')
-- require("nv-windwp-autopairs")
-- require("nv-autotag")
-- require("nv-ale")
-- require('nv-embark')
-- require("nv-tokyodark")
-- require('nv-onebuddy')
-- require('nv-spacebuddy')
-- require("nv-material")
-- require('nv-nebulous')
-- require("nv-onedark")
-- require("nv-tokyonight")
-- require("nv-starry")
-- require('nv-nightfly')
-- require("nv-nightfox")
-- require("nv-nordfox")
-- require("nv-terafox")
-- require("nv-carbonfox")
-- require("nv-themer")
require("nv-catppuccin")
-- require("nv-neon")
-- require("nv-onedarkpro")
-- require("nv-kanagawa")
-- require('nv-oceanic-material')
-- require('nv-gruvbox-flat')
-- require("nv-gruvbox-material")
require("nv-fzf")
-- require('nv-indentline')
require("nv-dashboard")
require("nv-indent-blankline")
-- require("module")
-- require('nv-indent-guides')
require("nv-nvim-devicons")
-- require("nv-bufferlines")
-- require("nv-barbar")
-- require("nv-kommentary")
require("nv-comment-nvim")
-- require('nv-defx')
-- require('nv-startify')
-- require('nv-airline')
require("nv-nvim-cmp")
require("nv-lspkind")
-- require("nv-rainbow")
require("nv-gitsigns")
require("nv-neogit")
-- require("nv-diffview")
-- require('nv-nvim-tree')
require("nv-null-ls")
require("nv-mason")
-- require("nv-lsp-installer")
require("nv-lsp-configs")
-- require("nv-lspsaga")
require("nv-symbols-outline")
require("nv-todo-comment")
-- require("nv-lsp-signatures")
-- require('nv-formatter')
require("nv-which-key")
-- require('nv-vsnip')
-- LuaSnip
require("utils")
require("nv-LuaSnip")
-- require("nv-focus")
require("nv-dap")
require("nv-dap-virtual-text")
-- require("nv-feline")
require("lline")
-- require("nv-lualine")
-- require("lv-lualine")
-- require("nv-heirline")
require("nv-fidget")
require("nv-notify")
require("nv-telekasten")
-- require("nv-hydra")
require("nv-winshift")
-- require("nv-session-manager")
require("nv-cybu")
require("nv-navic")
require("nv-gps")
require("nv-surround")
-- require("nv-specs")
require("nv-winbar")
require("nv-aerial")
require("user.autocommands")
-- require("winbar")
require("nv-jaq")
-- require("nv-expressline")
-- require("cmp-npm-tutorial")
-- require("nv-lir")
require("nv-inlayhints")
require("nv-compiler-explorer")
require("telescope-tabs").setup()
-- require("nv-noice")
-- require("typescript").setup({})
require("nv-code-action")
require("nv-rvimnr")
require("nv-tabout")
require("nv-dressing")
require("nv-mini")
require("nv-hlchunk")

-- vim.cmd("let g:lsc_auto_map = v:true")
vim.cmd("let g:go_gopls_enabled = 0")
vim.cmd("let g:zig_fmt_autosave = 1")
vim.cmd("let test#python#pytest#options = '--color=yes'")
vim.cmd("let test#javascript#jest#options = '--color=always'")
vim.cmd("let test#strategy = 'neovim'")
vim.cmd("let test#neovim#term_position = 'vertical'")
-- vim.cmd([[
--     hi DiagnosticError guibg=NONE
--     hi DiagnosticInfo guibg=NONE
--     hi DiagnosticHint guibg=NONE
--     hi DiagnosticWarn guibg=NONE
-- ]])
vim.cmd([[
  hi TelescopeTitle guifg=#c678dd
  hi DashboardHeader guifg=#c678dd
  hi DashboardFooter guifg=#c678dd
  hi DashboardProjectIcon guifg=#c678dd
  hi DashboardFiles guifg=#c678dd 
  hi DashboardRecentTitle guifg=#c678dd
  hi DashboardRecentProject guifg=#c678dd
  hi DashboardDesc guifg=#c678dd
  hi DashboardKey guifg=#c678dd
  hi DashboardIcon guifg=#c678dd
  hi DashboardShotCut guifg=#c678dd
  hi TelescopeBorder guifg=#98c379
  hi CursorLine guibg=#181825
]])

-- V lang
vim.cmd([[au BufNewFile,BufRead *.v set filetype=vlang]])
-- vim.g.vfmt = 1
-- vim.g.vtools_use_vls = 1
vim.g.v_autofmt_bufwritepre = 1

vim.g.mix_format_on_save = 1
vim.g.mix_format_silet_errors = 1

vim.g.neoterm_default_mod = "vertical"
vim.g.neoterm_size = 60
vim.g.neoterm_autoinsert = 1
vim.g.which_key_centered = 0
vim.g.which_key_vertical = 0
vim.g.which_key_sort_horizontal = 0
vim.g.which_key_hspace = 100
vim.g.which_key_flatten = 0
vim.g.which_key_use_floating_win = 1
vim.g.committia_use_singlecolumn = "false"
vim.g.committia_min_window_width = 80
vim.cmd("let g:prettier#autoformat_config_present = 1")

vim.g.neomake_open_list = 2

vim.cmd([[
		autocmd QuickFixCmdPost [^l]* nested copen
autocmd QuickFixCmdPost    l* nested lopen
	]])

vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

-- vim.g.CommandTCancelMap = "<C-x>"

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
	 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
    endif
endif
]])

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

require("nvim_utils")
-- require("colorizer").setup()

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function() end,
	pattern = "*",
})

vim.api.nvim_exec(
	[[
  autocmd BufWritePre *.lua :lua require("stylua-nvim").format_file()
]],
	true
)

vim.api.nvim_exec(
	[[
  autocmd BufRead * :EnableHLChunk
  autocmd BufRead * :EnableHLLineNum
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

-- HACK:
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
