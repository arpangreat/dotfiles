vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.winborder = "single"

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.conceallevel = 1

vim.opt.mouse = vim.opt.mouse + "a"
vim.opt.undofile = true
vim.opt.undodir = "/home/arpangreat/.vim/undodir"
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"

vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0
vim.opt.updatetime = 50
vim.opt.shortmess = vim.opt.shortmess + "I"
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.laststatus = 0
vim.opt.showmode = false

require("vim._extui").enable({})
