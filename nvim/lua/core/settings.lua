vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.completeopt = { "menu", "menuone", "noselect", "fuzzy" }
vim.opt.wildoptions = { "pum", "tagfile", "fuzzy" }
vim.opt.winborder = "single"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon0-TermCursor"
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
-- vim.opt.shortmess = vim.opt.shortmess + "I"
-- vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.shortmess:append("c")
vim.opt.showmode = false

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- Keep the command line on its own row so it does not cover the statusline.
vim.opt.cmdheight = 0

vim.g.grepprg = "rg --vimgrep --smart-case"
vim.g.grepformat = "%f:%l:%c:%m"

vim.g.health = { style = "float" }

vim.g.tmux_navigator_no_mappings = 1
