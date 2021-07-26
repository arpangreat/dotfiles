-- Sets 
-- Ignoptrecases
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- Vim UI
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.colorcolumn = '120'
vim.opt.showcmd = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.signcolumn="yes"
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = "menuone,noselect"
vim.opt.hidden = true
-- vim.opt.include
vim.opt.display = "lastline"
vim.opt.backspace = "indent,eol,start"
vim.opt.winblend = 0
vim.opt.pumblend = 30
vim.opt.textwidth = 80

-- Visuals
vim.opt.syntax = "enable"
-- vim.opt.filetype = "plugin on"
-- vim.api.nvim_set_optption('t_Co',256)
vim.opt.termguicolors = true
-- vim.opt.encodingvim.o.hidden = true
vim.opt.include = ""
vim.opt.display = "lastline"
vim.opt.encoding="utf-8"
-- vim.wopt.winblend = 100
-- vim.api.nvim_exec([[set winblend=100]], true)
-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.wopt.cursorcolumn = true

-- Utils
vim.opt.compatible = false
vim.opt.mouse='a'
vim.opt.autoindent = true
vim.opt.backup = false
-- vim.opt.undofile = false
vim.cmd("set undofile")
vim.opt.undodir='/home/arpangreat/.vim/undodir'
vim.opt.backupdir="/home/arpangreat/.vim/backupdir"
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.emoji = false

-- Times
vim.opt.ttimeoutlen = 50
vim.opt.updatetime = 100
vim.opt.shortmess = "I"
vim.opt.laststatus = 2

-- Disabling Gitgutter
vim.cmd("let g:gitgutter_enabled = 0")
vim.cmd("let g:gitgutter_signs = 0")
