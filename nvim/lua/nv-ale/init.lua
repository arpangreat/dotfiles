-- Ale Configs
vim.cmd("let g:ale_sign_error = '§'")
vim.cmd("let g:ale_sign_warning = 'Þ'")

-- vim.cmd('let g:airline#extensions#ale#enabled = 1')
-- vim.cmd('set statusline=%{LinterStatus()}')
vim.cmd('nmap <silent> <C-l> <Plug>(ale_previous_wrap)')
vim.cmd('nmap <silent> <C-h> <Plug>(ale_next_wrap)')

-- Intregrating with airline
vim.cmd('let g:airline#extensions#ale#enabled = 1')
