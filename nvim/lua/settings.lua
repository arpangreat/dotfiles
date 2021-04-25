-- Sets 
-- Ignorecases
vim.o.ignorecase = true
vim.o.smartcase = true

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.inccommand = "split"

-- Vim UI
vim.o.smartindent = true
vim.o.wrap = false
vim.o.colorcolumn = '120'
vim.o.showcmd = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.signcolumn="yes"
vim.o.scrolloff = 8
vim.o.showmode = false
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.hidden = true
-- vim.o.include
vim.o.display = "lastline"
vim.o.backspace = "indent,eol,start"

-- Visuals
vim.o.syntax = "enable"
-- vim.o.filetype = "plugin on"
vim.o.t_Co="256"
-- vim.api.nvim_set_option('t_Co',256)
vim.o.termguicolors = true
-- vim.o.encodingvim.o.hidden = true
vim.o.include = ""
vim.o.display = "lastline"
vim.o.encoding="utf-8"
-- vim.wo.winblend = 100
-- vim.api.nvim_exec([[set winblend=100]], true)
-- Numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
-- vim.wo.cursorcolumn = true

-- Utils
vim.o.compatible = false
vim.o.mouse='a'
vim.o.autoindent = true
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir="~/.vim/undodir"
vim.o.swapfile = false
vim.o.shada="!,'1000,<50,s10,h"
vim.o.viminfo="'100,n$HOME/.vim/files/info/viminfo"
vim.o.clipboard = "unnamedplus"

-- Times
vim.o.ttimeoutlen = 50
vim.o.updatetime = 100
vim.o.shortmess = "I"
vim.o.laststatus = 2

-- Disabling Gitgutter
vim.cmd("let g:gitgutter_enabled = 0")
vim.cmd("let g:gitgutter_signs = 0")
