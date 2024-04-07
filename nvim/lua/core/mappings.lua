-- Custom KeyBindings To make life easier You can change this to your own
-- Remember to map Your leader by writing
-- let mapleader = -- --
-- I use space as leader you can anything by putting
-- that character inside of the the double Qoutes

-- HACK: YOU HAVE A MAPPING FOR Keymaps named nvmap
vim.api.nvim_set_keymap(
	"n",
	"<Leader>pv",
	":wincmd v<bar> :NvimTreeOpen <bar> :vertical resize 20<CR>",
	{ noremap = true, silent = false }
)

vim.api.nvim_set_keymap("n", "<Leader>u", ":MundoToggle<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ps", ":Rg<SPACE>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-^>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>+", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>-", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ttv", ":below vertical terminal<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sv", ":vsplit<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ss", ":split<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>st", ":tabedit<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sp", ":tabp<CR>", { noremap = false, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sn", ":tabn<CR>", { noremap = false, silent = false })

vim.api.nvim_set_keymap("n", "\\gr", ":!go run %<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "\\gb", ":!go build<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "\\gt", ":!go test<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<Leader>fp", ":cprevious<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "<Leader>fn", ":cnext<CR>", { noremap = true, silent = false, expr = false })

vim.keymap.set(
	"n",
	"<Leader>ft",
	"<cmd>Telescope flutter commands<CR>",
	{ noremap = true, silent = false, expr = false }
)

-- FZFLua
vim.api.nvim_set_keymap("n", "<Leader>fz", ":FzfLua<CR>", { noremap = true, silent = false, expr = false })

-- Telescope

-- vim.api.nvim_set_keymap("n", "<F8>", ":TagBarToggle<CR>", { noremap = false, silent = false })

-- lua require("arpangreat")
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tf",
	":lua require('telescope').extensions.file_browser.file_browser({ hidden = true })<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tw",
	":lua require('telescope.builtin').grep_string({ prompt_prefix=🔍 })<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tb",
	":lua require('telescope.builtin').buffers()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-h>",
	":lua require('telescope.builtin').help_tags()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tm",
	":lua require('telescope.builtin').man_pages()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tj",
	":lua require('telescope.builtin').jumplist()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>trc",
	":lua require('arpangreat.telescope').search_dotfiles()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>trg",
	":lua require('telescope.builtin').live_grep({ prompt_prefix=🔍 })<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>trr",
	":lua require('telescope.builtin').registers()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tcc",
	":lua require('arpangreat.telescope').search_configs()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tcb",
	":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap("n", "<Leader>to", ":Telescope", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ttc", ":TodoTelescope<CR>", { noremap = true, silent = false, expr = false })

vim.api.nvim_set_keymap(
	"n",
	"<Leader>tlr",
	":lua require('telescope.builtin').lsp_references()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tld",
	":lua require('telescope.builtin').lsp_definitions()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tli",
	":lua require('telescope.builtin').lsp_implementations()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tls",
	":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tlw",
	":lua require('telescope.builtin').lsp_workspace_symbols({ query = vim.fn.input('Query > ') })<CR>",
	{ noremap = true, silent = false }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>trf",
	"<Cmd>lua require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown({ layout_config = { width = 0.25 } }))<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgr",
	"<Cmd>lua require('arpangreat.rg')<CR>",
	{ noremap = true, silent = false, expr = false }
)

vim.api.nvim_set_keymap("n", "<LocalLeader>", ":<C-U>WhichKey ','<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>w", ":w!<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ex", ":q!<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y<CR>', { noremap = true, silent = false })

-- For Notes
vim.api.nvim_set_keymap("n", "<Leader>ne", ":vsplit ~/wiki/index.md<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>no", ":e ~/wiki/index.md<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ns",
	":lua require('arpangreat.telescope').search_notes(require('telescope.themes').get_dropdown({ layout_strategy = 'vertical' }))<CR>",
	{ noremap = true, silent = false }
)

-- Toggleterm
-- vim.api.nvim_set_keymap("n", "<Leader>gg", ":ToggleTerm<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<F7>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })

-- Vim-Ultest
-- vim.api.nvim_set_keymap("n", "]t", "<Plug>(ultest-next-fail)", { noremap = false, silent = false })
-- vim.api.nvim_set_keymap("n", "[t", "<Plug>(ultest-prev-fail)", { noremap = true, silent = false })

-- Nohl
vim.api.nvim_exec([[nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], true)

-- UUUUUUUU
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "J", "J`z", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("i", "!", "!<c-g>u", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("i", "?", "?<c-g>u", { noremap = true, silent = false, expr = false })
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

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- HACK: Formating Big Lines with g
vim.api.nvim_set_keymap(
	"n",
	"<Leader>fg",
	"<cmd>g/ ./ normal gqq<CR>",
	{ noremap = true, silent = false, expr = false }
)

local ls = require("luasnip")
vim.keymap.set("i", "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- Copilot
-- vim.api.nvim_set_keymap(
--   "n",
--   "<c-s>",
--   "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>",
--   { noremap = true, silent = true }
-- )

-- Telekasten
-- vim.keymap.set("n", "<Leader>zf", ":Telekasten panel<CR>", { noremap = true, silent = false, expr = false })

vim.keymap.set("n", "<C-f>", "<ESC>/")

-- Move between windows
vim.keymap.set("n", "<Leader>h", "<C-w>h<CR>")
vim.keymap.set("n", "<Leader>k", "<C-w>k<CR>")
vim.keymap.set("n", "<Leader>j", "<C-w>j<CR>")
vim.keymap.set("n", "<Leader>l", "<C-w>l<CR>")

vim.keymap.set("n", "<Leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<Leader>th", "<cmd>Telescope harpoon marks<CR>")

-- Mini Files
vim.keymap.set("n", "<Leader>mf", "<cmd>lua MiniFiles.open()<CR>")

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
