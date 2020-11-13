call cyclist#add_listchar_option_set('limited', {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'trail': '·',
        \ 'extends': '<',
        \ 'precedes': '>',    
        \ 'conceal': '┊',
        \ 'nbsp': '␣',
        \ })

call cyclist#add_listchar_option_set('busy', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',    
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })

" Add a new named configuration
" call cyclist#add_listchar_option_set('limited', {
"         \ 'eol': '↲',
"         \ 'tab': '» ',
"         \ 'trail': '·',
"         \ 'extends': '<',
"         \ 'precedes': '>',
"         \ 'conceal': '┊',
"         \ 'nbsp': '␣',
"         \ })
"
" " Cycle to the next configuration
" nmap <leader>cn <Plug>CyclistNext
" nmap <leader>cp <Plug>CyclistPrev
"
" " Set a specific configuration
" call cyclist#activate_listchars('limited')
"
" " Reset to default configuration
" call cyclist#activate_listchars('default')
"
" " Override just one value in a configuration
" "   Each of the `cyclist#set_*` is based on the names in `:help listchars`
"
" " TRAIL U+2591
" call cyclist#set_trail('default', '░')
"
" " PRECEDES & EXTENDS
" call cyclist#set_preceds('default', '☚')
" call cyclist#set_extends('default', '☛')

" lua require'nvim-web-devicons'.setup()
"
" lua require'nvim-web-devicons'.get_icon(filename, extension, options)
