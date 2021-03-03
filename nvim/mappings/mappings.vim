" Custom KeyBindings To make life easier
" You can change this to your own
" Remember to map Your leader by writing
" let mapleader = " "
" I use space as leader you can anything by putting 
" that character inside of the the double Qoutes

let mapleader = " "

nnoremap ,in :-1read ~/.config/nvim/skeleton.intro<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :NERDTree <bar> :vertical resize 25<CR>
nnoremap <leader>pp :NERDTree<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader><leader> <C-^>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>pg :GFiles<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <leader>ttv :below vertical terminal<CR>
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>ss :split<CR>
nnoremap <leader>st :tabedit<CR>
nmap <leader>sp :tabp<CR>
nmap <leader>sn :tabn<CR>
nnoremap \gr :GoRun<CR>
nnoremap \gb :GoBuild<CR>
nnoremap \gt :GoTest<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pr :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For >")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-w> "+p<CR>
" Telescope

" nnoremap <Leader>tg <cmd>lua require'telescope.builtin'.git_files{}<CR>
" " Searches over files in a git folder. Note: This does not work outside a git repo folder.
"
" nnoremap <Leader>tf <cmd>lua require'telescope.builtin'.find_files{}<CR>
" " || Search over files in your cwd current working directory. ||
"
" nnoremap <Leader>gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
" " Search over variable references from your Language Server.
"
" nnoremap <Leader>ts <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>
"
"
" nnoremap <Leader>tn <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
nmap<F8> :TagbarToggle<CR>

lua require("arpangreat")

nnoremap <leader>ts :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>tf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>tw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>tb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>th :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>trc :lua require('arpangreat.telescope').search_dotfiles()<CR>
" nnoremap <leader>ta :lua require('arpangreat.telescope').anime_selector()<CR>
" nnoremap <leader>tc :lua require('arpangreat.telescope').git_branches()<CR>

" nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gv :GitFiles<CR>
nnoremap <leader>r :source %<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gf :Gpull<CR>
nnoremap <leader>go :GCheckout<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :q!<CR>

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" Nvim Lsp mappings
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
