-- Custom KeyBindings To make life easier You can change this to your own
-- Remember to map Your leader by writing
-- let mapleader = -- --
-- I use space as leader you can anything by putting 
-- that character inside of the the double Qoutes

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n','<Leader>bg',':highlight Normal guibg=none<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>h',':wincmd h<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>j',':wincmd j<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>k',':wincmd k<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>l',':wincmd l<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>pv',':wincmd v<bar> :NvimTreeOpen <bar> :vertical resize 20<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>u',':UndotreeShow<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>pp',':NvimTreeOpen<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ps',':Rg<SPACE>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader><Leader>','<C-^>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>pf',':Files<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>pg',':GFiles<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>+',':vertical resize +5<CR>',{ noremap = true , silent = true })
vim.api.nvim_set_keymap('n','<Leader>-',':vertical resize -5<CR>',{ noremap = true , silent = true })
vim.api.nvim_set_keymap('n','<Leader>ttv',':below vertical terminal<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>sv',':vsplit<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ss',':split<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>st',':tabedit<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>sp',':tabp<CR>',{ noremap = false , silent = false })
vim.api.nvim_set_keymap('n','<Leader>sn',':tabn<CR>',{ noremap = false , silent = false })

vim.api.nvim_set_keymap('n','\\gr',':!go run %<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','\\gb',':!go build<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','\\gt',':!go test<CR>',{ noremap = true , silent = false })

-- Telescope

vim.api.nvim_set_keymap('n','<F8>',':TagBarToggle<CR>',{ noremap = false, silent = false })

-- lua require("arpangreat")
vim.api.nvim_set_keymap('n','<Leader>ts',":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep For >\") })<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgf',":lua require('telescope.builtin').git_files()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tf',":lua require('telescope.builtin').find_files()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tw',":lua require('telescope.builtin').grep_string({ search = vim.fn.expand(\"<cword>\") })<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tb',":lua require('telescope.builtin').buffers()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>th',":lua require('telescope.builtin').help_tags()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>trc',":lua require('arpangreat.telescope').search_dotfiles()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>trg',":lua require('telescope.builtin').live_grep()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tcc',":lua require('arpangreat.telescope').search_configs()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgi',":lua require('telescope').extensions.gh.issues()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgp',":lua require('telescope').extensions.gh.pull_request()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgg',":lua require('telescope').extensions.gh.gist()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>te',":Telescope",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ttc',":Telescope colorscheme<CR>",{ noremap = true , silent = false })


vim.api.nvim_set_keymap("n", "<Leader>trf", "<Cmd>lua require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown({ layout_config = { width = 0.25 } }))<CR>", {noremap = true, silent = true})

-- GitWorkTree
vim.api.nvim_set_keymap("n", "<Leader>gwc", ':lua require("git-worktree").create_worktree', { noremap = true , silent = false })
vim.api.nvim_set_keymap("n", "<Leader>gws", ':lua require("git-worktree").switch_worktree', { noremap = true , silent = false })
vim.api.nvim_set_keymap("n", "<Leader>gwd", ':lua require("git-worktree").delete_worktree', { noremap = true , silent = false })
vim.api.nvim_set_keymap("n", "<Leader>gwt", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true , silent = false })

-- noremap <leader>ta :lua require('arpangreat.telescope').anime_selector()<CR>
-- noremap <leader>tc :lua require('arpangreat.telescope').git_branches()<CR>

-- noremap <leader>pw :Rg <C-R>=expand(--<cword>--)<CR><CR>
vim.api.nvim_set_keymap('n','<Leader>gs',':G<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gv',':GitFiles<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>r',':luafile %<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gc',':Git commit<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gp',':Git push<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gb',':Gblame<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gl',':Glog<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gf',':Gpull<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>go',':GCheckout<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gm',':GitMessenger<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>',":WhichKey '<Space>'<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n','<Leader>w',':w!<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>q',':q<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>e',':q!<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>y','"+y<CR>', { noremap = true , silent = false })

-- For Notes
vim.api.nvim_set_keymap('n','<Leader>mp',':MarkdownPreview<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ne',':vsplit ~/wiki/index.md<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>no',':e ~/wiki/index.md<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ns',":lua require('arpangreat.telescope').search_notes()<CR>",{ noremap = true , silent = false })

vim.api.nvim_set_keymap('i','C-Space' , 'compe#complete()', { noremap = true , silent = true , expr = true })
vim.api.nvim_set_keymap('i','<CR>' , "compe#confirm('<CR>')", { noremap = true , silent = true , expr = true })
vim.api.nvim_set_keymap('i','<C-e>' , "compe#close('<C-e')", { noremap = true , silent = true , expr = true })
vim.api.nvim_set_keymap('i','<C-f>' , "compe#scroll({ 'delta': +4 })", { noremap = true , silent = true , expr = true })
vim.api.nvim_set_keymap('i','<C-f>' , "compe#scroll({ 'delta': -4 })", { noremap = true , silent = true , expr = true })

vim.api.nvim_set_keymap('t','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('t','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('t','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('t','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('i','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('i','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('i','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('i','<A-h>','<C-\\><C-N><C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('n','<A-h>','<C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('n','<A-h>','<C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('n','<A-h>','<C-w>h',{ noremap = true })
vim.api.nvim_set_keymap('n','<A-h>','<C-w>h',{ noremap = true })
-- Nvim Lsp mappings
vim.api.nvim_set_keymap('n','<c-]','<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','gD','<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','<c-K>','<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','1gD','<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','g0','<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','gd','<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','ga','<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true , silent = true})

-- DashBoard 
vim.api.nvim_set_keymap('n','<Leader>fh',':DashboardFindHistory<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>sl',':<C-u>SessionLoad<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>fa',':DashboardFindWord<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>fb',':DashboardJumpMark<CR>', { noremap = true , silent = false })

-- Floaterm
vim.api.nvim_set_keymap('n','<F7>',':FloatermNew --height=0.9 --width=0.9<CR>', { noremap = true , silent = true })
vim.api.nvim_set_keymap('t','<F7>','<C-\\><C-n>:FloatermToggle<CR>', { noremap = true , silent = true })
vim.api.nvim_set_keymap('n','<F12>',':FloatermToggle<CR>', { noremap = true , silent = true })

-- Vim-Ultest
vim.api.nvim_set_keymap('n', ']t', '<Plug>(ultest-next-fail)', { noremap = false , silent = false })
vim.api.nvim_set_keymap('n','[t' , '<Plug>(ultest-prev-fail)', { noremap = true , silent = false })

-- Nohl
vim.api.nvim_exec([[nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], true)

-- vim.api.nvim_set_keymap('n','<CR>','{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()', { noremap = true , expr = true })

-- Prodoc
vim.api.nvim_set_keymap('n', '<Leader>cp', ':ProComment<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('x', '<Leader>cp', ':ProComment<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n', '<Leader>cd', ':ProDoc<CR>', { noremap = true , silent = false })

-- LspSaga
vim.api.nvim_set_keymap('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ea', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('v', '<Leader>ea', ":<C-U>lua require('lspsaga.codeaction').ranger_code_action()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<Leader>eh', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<Leader>es', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<Leader>er', "<cmd>lua require('lspsaga.rename').rename()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ee', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ec', "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', '[e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n', ']e', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", { noremap = true , silent = true })
