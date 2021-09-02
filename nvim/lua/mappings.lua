-- Custom KeyBindings To make life easier You can change this to your own
-- Remember to map Your leader by writing
-- let mapleader = -- --
-- I use space as leader you can anything by putting 
-- that character inside of the the double Qoutes

-- HACK: YOU HAVE A MAPPING FOR Keymaps named nvmap

vim.g.mapleader = " "
vim.g.maplocalleader = ","

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

vim.api.nvim_set_keymap('n', '<Leader>fp', ':cprevious<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>fn', ':cnext<CR>', { noremap = true, silent = false, expr = false })

-- Compe
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i',  '<CR>', "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i',  '<C-e>', "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i',  '<C-f>', "compe#scroll({ 'delta': +4 })", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i',  '<C-d>', "compe#scroll({ 'delta': -4 })", { noremap = true, silent = true, expr = true })


-- Telescope

vim.api.nvim_set_keymap('n','<F8>',':TagBarToggle<CR>',{ noremap = false, silent = false })

-- lua require("arpangreat")
vim.api.nvim_set_keymap('n','<Leader>tgf',":lua require('telescope.builtin').git_files()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgc',":lua require('telescope.builtin').git_commits()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgb',":lua require('telescope.builtin').git_bcommits()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgs',":lua require('telescope.builtin').git_status()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tf',":lua require('telescope.builtin').find_files()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tw',":lua require('telescope.builtin').grep_string({ prompt_prefix=🔍 })<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tb',":lua require('telescope.builtin').buffers()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>th',":lua require('telescope.builtin').help_tags()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tm',":lua require('telescope.builtin').man_pages()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tj',":lua require('telescope.builtin').jumplist()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tr',":lua require('telescope.builtin').registers()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>trc',":lua require('arpangreat.telescope').search_dotfiles()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>trg',":lua require('telescope.builtin').live_grep({ prompt_prefix=🔍 })<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tcc',":lua require('arpangreat.telescope').search_configs()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tcb',":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgi',":lua require('telescope').extensions.gh.issues()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgp',":lua require('telescope').extensions.gh.pull_request()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tgg',":lua require('telescope').extensions.gh.gist()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>to',":Telescope",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n', '<Leader>ttc', ':TodoTelescope<CR>', { noremap = true, silent = false, expr = false })

vim.api.nvim_set_keymap('n','<Leader>tea',":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>teo',":lua require('telescope.builtin').lsp_range_code_actions()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ter',":lua require('telescope.builtin').lsp_references()<CR>",{ noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>tes',":lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",{ noremap = true , silent = false })

vim.api.nvim_set_keymap("n", "<Leader>trf", "<Cmd>lua require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown({ layout_config = { width = 0.25 } }))<CR>", {noremap = true, silent = true})

-- noremap <leader>ta :lua require('arpangreat.telescope').anime_selector()<CR>
-- noremap <leader>tc :lua require('arpangreat.telescope').git_branches()<CR>

-- noremap <leader>pw :Rg <C-R>=expand(--<cword>--)<CR><CR>
vim.api.nvim_set_keymap('n','<Leader>gv',':GitFiles<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>r',':luafile %<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gb',':Git blame<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>go',':Git checkout<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gs',':Git stash<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>gd',':Ghdiffsplit<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>', ":<C-U>WhichKey '<Space>'<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n','<LocalLeader>', ":<C-U>WhichKey ','<CR>", { noremap = true , silent = true })
vim.api.nvim_set_keymap('n','<Leader>w',':w!<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>q',':q<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ex',':q!<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>y','"+y<CR>', { noremap = true , silent = false })

-- For Notes
vim.api.nvim_set_keymap('n','<Leader>ne',':vsplit ~/wiki/index.md<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>no',':e ~/wiki/index.md<CR>', { noremap = true , silent = false })
vim.api.nvim_set_keymap('n','<Leader>ns',":lua require('arpangreat.telescope').search_notes(require('telescope.themes').get_dropdown({ layout_strategy = 'vertical' }))<CR>",{ noremap = true , silent = false })

-- For Vsnip
-- vim.api.nvim_exec([[
-- " NOTE: You can use other key to expand snippet.
--
-- " Expand
-- imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
-- smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
--
-- " Expand or jump
-- imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
-- smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
--
-- " Jump forward or backward
-- imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
--
-- " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- " See https://github.com/hrsh7th/vim-vsnip/pull/50
-- nmap        s   <Plug>(vsnip-select-text)
-- xmap        s   <Plug>(vsnip-select-text)
-- nmap        S   <Plug>(vsnip-cut-text)
-- xmap        S   <Plug>(vsnip-cut-text)
--
-- " If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
-- let g:vsnip_filetypes = {}
-- let g:vsnip_filetypes.javascriptreact = ['javascript']
-- let g:vsnip_filetypes.typescriptreact = ['typescript']
-- ]], true)

-- Nvim Lsp mappings
vim.api.nvim_set_keymap('n','<c-]>','<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','gD','<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','<c-K>','<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','1gD','<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','gr','<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true , silent = true})
vim.api.nvim_set_keymap('n','gf','<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true , silent = true})
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

--[[ [count]<leader>cc |NERDCommenterComment|
   [
   [ Comment out the current line or text selected in visual mode.
   [
   [ [count]<leader>cn |NERDCommenterNested|
   [
   [ Same as cc but forces nesting.
   [
   [ [count]<leader>c<space> |NERDCommenterToggle|
   [
   [ Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
   [
   [ [count]<leader>cm |NERDCommenterMinimal|
   [
   [ Comments the given lines using only one set of multipart delimiters.
   [
   [ [count]<leader>ci |NERDCommenterInvert|
   [
   [ Toggles the comment state of the selected line(s) individually.
   [
   [ [count]<leader>cs |NERDCommenterSexy|
   [
   [ Comments out the selected lines with a pretty block formatted layout.
   [
   [ [count]<leader>cy |NERDCommenterYank|
   [
   [ Same as cc except that the commented line(s) are yanked first.
   [
   [ <leader>c$ |NERDCommenterToEOL|
   [
   [ Comments the current line from the cursor to the end of line.
   [
   [ <leader>cA |NERDCommenterAppend|
   [
   [ Adds comment delimiters to the end of line and goes into insert mode between them.
   [
   [ |NERDCommenterInsert|
   [
   [ Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
   [
   [ <leader>ca |NERDCommenterAltDelims|
   [
   [ Switches to the alternative set of delimiters.
   [
   [ [count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
   [
   [ Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
   [
   [ [count]<leader>cu |NERDCommenterUncomment|
   [
   [ Uncomments the selected line(s).
   [  ]]

-- LspSaga
vim.api.nvim_set_keymap('n', '<Leader>ef', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", { noremap = true , silent = true })
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

-- Symbols Outline
vim.api.nvim_set_keymap('n', '<Leader>so', '<cmd>SymbolsOutline<CR>', { noremap = true, silent = false, expr = false })

-- Neoterm
vim.api.nvim_set_keymap('n', '<C-q>', ':Ttoggle<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('i', '<C-q>', ':Ttoggle<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-n>:Ttoggle<CR>', { noremap = true, silent = false, expr = false })

-- Vim Test
vim.api.nvim_set_keymap('n', 'tt', ':TestNearest<CR>', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('n', 'tf', ':TestFile<CR>', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('n', 'ts', ':TestSuite<CR>', { noremap = true, silent = true, expr = false })
vim.api.nvim_set_keymap('n', 't_', ':TestLast<CR>', { noremap = true, silent = true, expr = false })

-- Command-T
vim.api.nvim_set_keymap('n', '<LocalLeader>t', ':CommandT<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<LocalLeader>h', ':CommandTHelp<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<LocalLeader>H', ':CommandTHistory<CR>', { noremap = true, silent = false, expr = false })

-- UUUUUUUU
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = false, expr =  false })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', 'J', 'J`z', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('v', 'K', ":m '>-2<CR>gv=gv", { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<LocalLeader>j', ':m .+1<CR>==', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<LocalLeader>k', ':m .-2<CR>==', { noremap = true, silent = false, expr = false })

-- Bufferline
vim.api.nvim_set_keymap('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>6', ':BufferLineGoToBuffer 6<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>7', ':BufferLineGoToBuffer 7<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>8', ':BufferLineGoToBuffer 8<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>9', ':BufferLineGoToBuffer 9<CR>', { noremap = true, silent = false, expr = false })

-- Treesitter Unit
vim.api.nvim_set_keymap('n', '<Leader>tus', ':lua require("treesitter-unit-plugin").select()<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>tud', ':lua require("treesitter-unit-plugin").delete()<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('n', '<Leader>tuc', ':lua require("treesitter-unit-plugin").change()<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('o', '<Leader>tuy', ':<C-u>lua require("treesitter-unit-plugin").select(true)<CR>:y<CR>', { noremap = true, silent = false, expr = false })
vim.api.nvim_set_keymap('o', '<Leader>tuf', ':<C-u>lua require("treesitter-unit-plugin").select(true)<CR>:lua vim.lsp.buf.formatting_sync()<CR>', { noremap = true, silent = false, expr = false })

-- HACK: Formating Big Lines with g
vim.api.nvim_set_keymap('n', '<Leader>fg', "<cmd>g/ ./ normal gqq<CR>", { noremap = true, silent = false, expr = false })
