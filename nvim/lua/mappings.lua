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
vim.api.nvim_set_keymap("n", "<Leader>pp", ":NvimTreeOpen<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ps", ":Rg<SPACE>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader><Leader>", "<C-^>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>pf", ":Files<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>pg", ":GFiles<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>+", ":vertical resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>-", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ttv", ":below vertical terminal<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sv", ":vsplit<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ss", ":split<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>st", ":tabedit<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sp", ":tabp<CR>", { noremap = false, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>sn", ":tabn<CR>", { noremap = false, silent = false })
vim.keymap.set("n", "<Leader>sS", ":SaveSession<CR>")
vim.keymap.set("n", "<Leader>sr", ":RestoreSession<CR>")

vim.api.nvim_set_keymap("n", "\\gr", ":!go run %<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "\\gb", ":!go build<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "\\gt", ":!go test<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<Leader>fp", ":cprevious<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "<Leader>fn", ":cnext<CR>", { noremap = true, silent = false, expr = false })

-- Telescope

vim.api.nvim_set_keymap("n", "<F8>", ":TagBarToggle<CR>", { noremap = false, silent = false })

-- lua require("arpangreat")
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgf",
	":lua require('telescope.builtin').git_files()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgc",
	":lua require('telescope.builtin').git_commits()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgb",
	":lua require('telescope.builtin').git_bcommits()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgs",
	":lua require('telescope.builtin').git_status()<CR>",
	{ noremap = true, silent = false }
)
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
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgi",
	":lua require('telescope').extensions.gh.issues()<CR>",
	{ noremap = true, silent = false }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgp",
	":lua require('telescope').extensions.gh.pull_request()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgg",
	":lua require('telescope').extensions.gh.gist()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap("n", "<Leader>to", ":Telescope", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ttc", ":TodoTelescope<CR>", { noremap = true, silent = false, expr = false })
vim.keymap.set("n", "<Leader>ttt", ":Telescope telescope-tabs list_tabs<CR>")

vim.api.nvim_set_keymap(
	"n",
	"<Leader>tea",
	":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>teo",
	":lua require('telescope.builtin').lsp_range_code_actions()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ter",
	":lua require('telescope.builtin').lsp_references()<CR>",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tes",
	":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
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
	"<Leader>tz",
	"<Cmd>lua require'telescope'.extensions.zoxide.list{}<CR>",
	{ noremap = true, silent = false, expr = false }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>tgr",
	"<Cmd>lua require('arpangreat.rg')<CR>",
	{ noremap = true, silent = false, expr = false }
)

vim.api.nvim_set_keymap("n", "<Leader>gv", ":GitFiles<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>rf", ":luafile %<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>gp", "<cmd>lua require('neogit').open()<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>go", ":Neogit branch<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Neogit stash<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>gd", ":DiffviewOpen<CR>", { noremap = true, silent = false })
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

-- Nvim Lsp mappings
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ga", "<cmd>CodeActionMenu<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

-- DashBoard
vim.api.nvim_set_keymap("n", "<Leader>sl", ":<C-u>SessionLoad<CR>", { noremap = true, silent = false })

-- Toggleterm
vim.api.nvim_set_keymap("n", "<Leader>gg", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<F7>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Vim-Ultest
vim.api.nvim_set_keymap("n", "]t", "<Plug>(ultest-next-fail)", { noremap = false, silent = false })
vim.api.nvim_set_keymap("n", "[t", "<Plug>(ultest-prev-fail)", { noremap = true, silent = false })

-- Nohl
vim.api.nvim_exec([[nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], true)

-- LspSaga
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ef",
	"<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ea",
	"<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"v",
	"<Leader>ea",
	":<C-U>lua require('lspsaga.codeaction').ranger_code_action()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>eh",
	"<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-f>",
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-b>",
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>es",
	"<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>er",
	"<cmd>lua require('lspsaga.rename').rename()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ee",
	"<cmd>lua require'lspsaga.provider'.preview_definition()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ec",
	"<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"[e",
	"<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"]e",
	"<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
	{ noremap = true, silent = true }
)

-- Symbols Outline
vim.api.nvim_set_keymap("n", "<Leader>so", "<cmd>SymbolsOutline<CR>", { noremap = true, silent = false, expr = false })

-- Neoterm
vim.api.nvim_set_keymap("n", "<C-q>", ":Ttoggle<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("i", "<C-q>", ":Ttoggle<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("t", "<C-q>", "<C-\\><C-n>:Ttoggle<CR>", { noremap = true, silent = false, expr = false })

-- Vim Test
vim.api.nvim_set_keymap("n", "tt", ":TestNearest<CR>", { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap("n", "tf", ":TestFile<CR>", { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap("n", "ts", ":TestSuite<CR>", { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap("n", "t_", ":TestLast<CR>", { noremap = true, silent = true, expr = false })

-- Command-T
vim.api.nvim_set_keymap("n", "<LocalLeader>t", ":CommandT<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "<LocalLeader>h", ":CommandTHelp<CR>", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap("n", "<LocalLeader>H", ":CommandTHistory<CR>", {
	noremap = true,
	silent = false,
	expr = false,
})

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

-- Move to previous/next
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", " :BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", opts)
map("n", "<C-p>", ":BufferPick<CR>", opts)

-- Treesitter Unit
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tus",
	':lua require("treesitter-unit-plugin").select()<CR>',
	{ noremap = true, silent = false, expr = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tud",
	':lua require("treesitter-unit-plugin").delete()<CR>',
	{ noremap = true, silent = false, expr = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>tuc",
	':lua require("treesitter-unit-plugin").change()<CR>',
	{ noremap = true, silent = false, expr = false }
)
vim.api.nvim_set_keymap(
	"o",
	"<Leader>tuy",
	':<C-u>lua require("treesitter-unit-plugin").select(true)<CR>:y<CR>',
	{ noremap = true, silent = false, expr = false }
)
vim.api.nvim_set_keymap(
	"o",
	"<Leader>tuf",
	':<C-u>lua require("treesitter-unit-plugin").select(true)<CR>:lua vim.lsp.buf.formatting_sync()<CR>',
	{ noremap = true, silent = false, expr = false }
)

-- HACK: Formating Big Lines with g
vim.api.nvim_set_keymap(
	"n",
	"<Leader>fg",
	"<cmd>g/ ./ normal gqq<CR>",
	{ noremap = true, silent = false, expr = false }
)

-- Rust Tools
vim.api.nvim_set_keymap(
	"n",
	"<Leader>ri",
	":lua require('rust-tools.inlay_hints').toggle_inlay_hints()<CR>",
	{ noremap = true, silent = false, expr = false }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>rr",
	":lua require('rust-tools.runnables').runnables()<CR>",
	{ noremap = true, silent = false, expr = false }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>rm",
	":lua require'rust-tools.expand_macro'.expand_macro()<CR>",
	{ noremap = true, silent = false, expr = false }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>rh",
	":lua require'rust-tools.hover_actions'.hover_actions({ hover_with_actions = true })<CR>",
	{ noremap = true, silent = false, expr = false }
)

vim.keymap.set("n", "<Leader>rg", "<cmd>lua vim.lsp.codelens.run()<CR>")

vim.keymap.set("n", "<Leader>rc", ":RustOpenCargo<CR>", { noremap = true, silent = false, expr = false })

local ls = require("luasnip")
vim.keymap.set("i", "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- Telekasten
vim.keymap.set("n", "<Leader>zf", ":Telekasten panel<CR>", { noremap = true, silent = false, expr = false })

vim.keymap.set("n", "<C-f>", "<ESC>/")

-- Move between windows
vim.keymap.set("n", "<Leader>h", "<C-w>h<CR>")
vim.keymap.set("n", "<Leader>k", "<C-w>k<CR>")
vim.keymap.set("n", "<Leader>j", "<C-w>j<CR>")
vim.keymap.set("n", "<Leader>l", "<C-w>l<CR>")

vim.keymap.set("n", "<Leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<Leader>th", "<cmd>Telescope harpoon marks<CR>")
