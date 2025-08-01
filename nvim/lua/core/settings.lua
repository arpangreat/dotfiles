vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Sets
-- Ignoptrecases
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"

-- Vim UI
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.title = true
-- vim.opt.colorcolumn = '120'
vim.opt.showcmd = false
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.hidden = true
vim.opt.sidescroll = 1
-- vim.opt.include
vim.opt.display = "lastline"
vim.opt.backspace = "indent,eol,start"
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.textwidth = 80
vim.opt.ruler = true
-- vim.opt.winborder = "bold"
-- vim.opt.cmdheight = 0

-- Visuals
vim.opt.syntax = "disable"
-- vim.opt.filetype = "plugin on"
-- vim.api.nvim_set_optption('t_Co',256)
vim.opt.termguicolors = true
-- vim.opt.encodingvim.o.hidden = true
vim.opt.include = ""
vim.opt.display = "lastline"
vim.opt.encoding = "utf-8"
-- vim.wopt.winblend = 100
-- vim.api.nvim_exec([[set winblend=100]], true)
-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "both"
-- vim.wopt.cursorcolumn = true
vim.opt.conceallevel = 1

-- Utils
vim.opt.compatible = false
vim.opt.mouse = vim.opt.mouse + "a"
-- vim.opt.formatoptions:remove("ro")
vim.opt.autoindent = true
-- vim.opt.linebreak = true
-- vim.opt.list = true
vim.opt.listchars = {
	nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
	extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
	precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
	tab = "▷⋯", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
	trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
}
vim.opt.wildmode = "list:longest"

vim.opt.showbreak = "↳ "
vim.opt.backup = false
-- vim.opt.undofile = false
vim.cmd("set undofile")
vim.opt.undodir = "/home/arpangreat/.vim/undodir"
vim.opt.backupdir = "/home/arpangreat/.vim/backupdir"
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.emoji = false

-- Times
vim.opt.timeout = true
vim.opttimeoutlen = 300
vim.opt.ttimeoutlen = 50
vim.opt.updatetime = 50
vim.opt.shortmess = vim.opt.shortmess + "I"
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.laststatus = 0

-- Markdown

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 1

vim.o.background = "dark"

vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters "╭", "─", "╮", "│", "╯", "─", "╰", "│"

-- UndoTree
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_ShortIndicators = 0
vim.g.undotree_HighlightChangedText = 1
vim.g.undotree_HighlightChangedWithSign = 1

vim.g.snacks_animate = false
-- Tmux
-- vim.g.tmux_navigator_no_mapping = 1

-- require("vim._extui").enable({})
