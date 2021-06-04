
-- "vim airline
-- let g:airline#extensions#tabline#enabled = 1
-- let g:airline#extensions#tabline#left_sep = ' '
-- let g:airline#extensions#tabline#left_alt_sep = '>'
-- let g:airline#extensions#tabline#formatter = 'default'
-- unicode symbols
vim.cmd("let g:airline_powerline_fonts = 1")
vim.cmd("let g:airline_theme = 'simple'")
vim.cmd("let g:airline_exclude_filetypes = ['unite']")
vim.cmd("let g:airline#extensions#hunks#non_zero_only = 1")
vim.cmd("let g:airline#extensions#tabline#enabled = 1")
vim.cmd("let g:airline#extensions#tabline#show_buffers = 0")
vim.cmd("let g:airline#extensions#tabline#fnamemod = ':t'")
vim.cmd("let g:airline#extensions#tabline#enabled = 1")

--call airline#parts#define_function('goinfo', 'go#complete#GetInfo')
--call airline#parts#define_condition('goinfo', '&ft =~ "go"')
-- let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

-- vim.cmd("set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{fugitive#statusline()}")

vim.cmd("let g:airline#extensions#branch#enabled = 1")
vim.cmd("let g:airline#extensions#tagbar#enabled = 1")
vim.cmd("let g:airline#extensions#ale#enabled = 1")

vim.cmd([[
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
]])

-- unicode symbols
vim.cmd("let g:airline_left_sep = '»'")
vim.cmd("let g:airline_left_sep = '▶'")
vim.cmd("let g:airline_right_sep = '«'")
vim.cmd("let g:airline_right_sep = '◀'")
vim.cmd("let g:airline_symbols.linenr = '␊'")
vim.cmd("let g:airline_symbols.linenr = '␤'")
vim.cmd("let g:airline_symbols.linenr = '¶'")
vim.cmd("let g:airline_symbols.branch = '⎇'")
vim.cmd("let g:airline_symbols.paste = 'ρ'")
vim.cmd("let g:airline_symbols.paste = 'Þ'")
vim.cmd("let g:airline_symbols.paste = '∥'")
vim.cmd("let g:airline_symbols.whitespace = 'Ξ'")

-- airline symbols
vim.cmd("let g:airline_left_sep = ''")
vim.cmd("let g:airline_left_alt_sep = ''")
vim.cmd("let g:airline_right_sep = ''")
vim.cmd("let g:airline_right_alt_sep = ''")
vim.cmd("let g:airline_symbols.branch = ''")
vim.cmd("let g:airline_symbols.readonly = ''")
vim.cmd("let g:airline_symbols.linenr = ''")
