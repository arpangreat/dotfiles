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

vim.loader.enable()

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
	checker = { enabled = false },
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
require("nv-treesitter")
-- require("nv-catppuccin")
require("nv-tokyonight")
require("nv-fzf")
require("nv-indent-blankline")
require("nv-nvim-devicons")
require("nv-comment-nvim")
require("nv-nvim-cmp")
require("nv-lspkind")
require("nv-gitsigns")
require("nv-neogit")
require("nv-mason")
require("nv-lsp-configs")
require("nv-todo-comment")
require("nv-which-key")
require("utils")
require("nv-LuaSnip")
require("lline")
require("nv-fidget")
require("nv-navic")
require("nv-surround")
require("nv-winbar")
require("user.autocommands")
require("nv-inlayhints")
require("nv-code-action")
require("nv-rainbow")
require("nv-copilot")

-- vim.cmd("let g:lsc_auto_map = v:true")
vim.cmd("let g:go_gopls_enabled = 0")
vim.cmd("let g:zig_fmt_autosave = 1")
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
vim.g.v_autofmt_bufwritepre = 1

vim.g.mix_format_on_save = 1
vim.g.mix_format_silet_errors = 1

vim.g.which_key_centered = 0
vim.g.which_key_vertical = 0
vim.g.which_key_sort_horizontal = 0
vim.g.which_key_hspace = 100
vim.g.which_key_flatten = 0
vim.g.which_key_use_floating_win = 1
vim.g.committia_use_singlecolumn = "false"
vim.g.committia_min_window_width = 80
vim.cmd("let g:prettier#autoformat_config_present = 1")


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

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
	end,
})

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function() end,
	pattern = "*",
})

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
