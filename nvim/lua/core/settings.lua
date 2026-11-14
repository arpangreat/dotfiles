-- Use vim.o / vim.g for simple scalar options (faster than vim.opt, no
-- metatable overhead).  vim.opt is only needed for list/map operations.
local o, g = vim.o, vim.g

o.ignorecase = true
o.smartcase = true
vim.opt.path:append("**")

o.smartindent = true
o.wrap = false
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.signcolumn = "yes"
o.scrolloff = 10
o.sidescrolloff = 8
vim.opt.wildoptions:append("fuzzy")
o.winborder = "single"
o.pumheight = 10
o.pumblend = 10
o.showmatch = true
o.matchtime = 2
o.title = true
o.splitbelow = true
o.splitright = true

o.number = true
o.relativenumber = true
o.cursorline = true
o.conceallevel = 1
o.mouse = "a"
o.undofile = true
o.undodir = "/home/arpangreat/.vim/undodir"
o.swapfile = false
o.clipboard = "unnamedplus"

o.timeout = true
o.timeoutlen = 300
o.ttimeoutlen = 0
o.updatetime = 50
vim.opt.shortmess:append("c")
o.showmode = false

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0

o.termguicolors = true
o.cmdheight = 0
o.laststatus = 3

g.grepprg = "rg --vimgrep --smart-case"
g.grepformat = "%f:%l:%c:%m"

o.messagesopt = "hit-enter,history:500,maxheight:50,pager:<CR>,timeout:5000"

g.health = { style = "float" }

g.tmux_navigator_no_mappings = 1
