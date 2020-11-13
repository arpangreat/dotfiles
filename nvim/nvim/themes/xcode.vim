" " colorscheme xcodedark
" colorscheme xcodedarkhc
" " colorscheme xcodelight
" " colorscheme xcodelighthc
" " colorscheme xcodewwdc
"
"
"
" augroup vim-colors-xcode
"     autocmd!
" augroup END
"
" autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
" autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic
"
" let g:signify_sign_add    = '┃'
" let g:signify_sign_change = '┃'
" let g:signify_sign_delete = '•'
"
" let g:signify_sign_show_count = 0 " Don’t show the number of deleted lines.
"
" " Update Git signs every time the text is changed
" autocmd User SignifySetup
"             \ execute 'autocmd! signify' |
"             \ autocmd signify TextChanged,TextChangedI * call sy#start()
