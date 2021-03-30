-- Custom KeyBindings To make life easier
-- You can change this to your own
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

vim.api.nvim_set_keymap('n','\\gr',':GoRun<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','\\gb',':GoBuild<CR>',{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','\\gt',':GoTest<CR>',{ noremap = true , silent = false })

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
vim.api.nvim_set_keymap('n','<Leader>tgi',":lua require('telescope').extensions.gh.issues()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgp',":lua require('telescope').extensions.gh.pull_request()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgg',":lua require('telescope').extensions.gh.gist()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>te',":Telescope<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ttc',":Telescope colorscheme<CR>",{ noremap = true , silent = false })


vim.api.nvim_set_keymap("n", "<Leader>trf", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})

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
vim.api.nvim_set_keymap('n','<Leader>',":WhichKey '<Space>'<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n','<Leader>w',':w!<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>q',':q<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>e',':q!<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>y','"+y<CR>', { noremap = true , silent = false })

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
