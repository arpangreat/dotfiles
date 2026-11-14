vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.keymap.set

map("n", "<Leader>u", "<cmd>Undotree<CR>", { desc = "Undotree" })
map("n", "<Leader><Leader>", "<C-^>", { desc = "Alternate buffer" })
map("n", "<Leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<Leader>ss", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<Leader>st", "<cmd>tabedit<CR>", { desc = "New tab" })
map("n", "<Leader>sp", "<cmd>tabp<CR>", { desc = "Previous tab" })
map("n", "<Leader>sn", "<cmd>tabn<CR>", { desc = "Next tab" })

map("n", "[c", "<cmd>cprev<CR>", { desc = "Previous quickfix" })
map("n", "]c", "<cmd>cnext<CR>", { desc = "Next quickfix" })

map("n", "<LocalLeader>", ":<C-U>WhichKey ','<CR>", { silent = true })
map("n", "<Leader>w", "<cmd>w!<CR>", { desc = "Write" })
map("n", "<Leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<Leader>ex", "<cmd>qa!<CR>", { desc = "Quit all" })

map("t", "<Esc>", "<C-\\><C-n>")

-- Nohl
map("n", "<CR>", function()
	return vim.v.hlsearch == 1 and "<cmd>nohl<CR>" or "<CR>"
end, { expr = true })

-- Better yank / search / join
map("n", "Y", "y$")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "J`z")
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '>-2<CR>gv=gv", { silent = true })
map("n", "<LocalLeader>j", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<LocalLeader>k", "<cmd>m .-2<CR>==", { desc = "Move line up" })

-- Marks / substitute
map("n", "M", "m")
map({ "x", "o", "v" }, "<Leader>s", ":s//g<Left><Left>")

-- Tmux Navigator
map("n", "<M-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<M-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<M-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<M-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>")

-- Make command
map("n", "gm", function()
	vim.cmd("silent make")
	vim.cmd("cwindow")
	if vim.v.shell_error == 0 then
		vim.notify("make: ok")
	elseif vim.tbl_isempty(vim.fn.getqflist()) then
		vim.notify("make: failed (run :make to see the output)", vim.log.levels.ERROR)
	end
end, { desc = "Run the :make command" })
