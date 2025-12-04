vim.api.nvim_set_keymap("n", "<Leader>u", ":Undotree<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-^>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sv", ":vsplit<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ss", ":split<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>st", ":tabedit<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sp", ":tabp<CR>", { noremap = false, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sn", ":tabn<CR>", { noremap = false, silent = false })

vim.api.nvim_set_keymap("n", "\\gr", ":!go run %<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "\\gb", ":!go build<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "\\gt", ":!go test<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "[c", ":cprev<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "]c", ":cnext<CR>", { noremap = true, silent = false, expr = false })

vim.api.nvim_set_keymap("n", "]g", "<cmd>lua require('mini.diff').goto_hunk('next')<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "[g", "<cmd>lua require('mini.diff').goto_hunk('prev')<CR>", { noremap = true, silent = false, expr = false })

-- FZFLua
vim.keymap.set("n", "<Leader>fz", ":FzfLua ", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd>FzfLua files<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>fll",
	":lua require('fzf-lua-lazy').search()<CR>",
	{ noremap = true, silent = false }
)

vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>FzfLua live_grep<cr>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>fb", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>fh", "<cmd>FzfLua helptags<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>fm", "<cmd>FzfLua manpages<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>fj", "<cmd>FzfLua jump<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>frc",
	":lua require'fzf-lua'.files({ prompt='Dotfiles> ', cwd='~/dotfiles/nvim' })<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>fcc",
	":lua require'fzf-lua'.files({ prompt='Config> ', cwd='~/dotfiles' })<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap("n", "<Leader>fcb", "<cmd>FzfLua lgrep_curbuf<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ftc", ":TodoFzfLua<CR>", { noremap = true, silent = false, expr = false })

vim.api.nvim_set_keymap("n", "<LocalLeader>", ":<C-U>WhichKey ','<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>w", ":w!<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ex", ":qa!<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = false })

-- Nohl
vim.cmd([[nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], true)

-- UUUUUUUU
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "J", "J`z", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("v", "K", ":m '>-2<CR>gv=gv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "<LocalLeader>j", ":m .+1<CR>==", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "<LocalLeader>k", ":m .-2<CR>==", { noremap = true, silent = false, expr = false })

-- Realising useless mappings
vim.api.nvim_set_keymap("n", "Q", ":wq!<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "M", "m", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("x", "<Leader>s", ":s//g<Left><Left>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("o", "<Leader>s", ":s//g<Left><Left>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("v", "<Leader>s", ":s//g<Left><Left>", { noremap = true, silent = false, expr = false })

vim.keymap.set("n", "<Leader>mf", "<cmd>lua require('oil').open_float()<CR>", { desc = "Open parent directory" })

vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
	if not require("noice.lsp").scroll(4) then
		return "<c-f>"
	end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<c-b>"
	end
end, { silent = true, expr = true })
