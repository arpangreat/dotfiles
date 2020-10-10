"colorscheme nightfly
"let g:nightflyCursorColor = 1
"set background=dark
"let g:nightflyUnderlineMatchParen = 1

"if exists('&cursorlineopt')
"    set cursorlineopt=number
"    set cursorline
"endif

"function! RelativeNumberActivity(active)
"    if &diff
"        " For diffs, do nothing since we want relativenumbers in all windows.
"        return
"    endif
"    if &buftype == "nofile" || &buftype == "nowrite"
"        setlocal nonumber
"    elseif a:active == v:true
"        setlocal relativenumber
"        if exists('&cursorlineopt')
"            setlocal cursorline
"        endif
"    else
"        setlocal norelativenumber
"        if exists('&cursorlineopt')
"            setlocal nocursorline
"        endif
"    endif
"endfunction

"augroup CustomWindowActivity
"    autocmd!
"    autocmd WinEnter * call RelativeNumberActivity(v:true)
"    autocmd WinLeave * call RelativeNumberActivity(v:false)
"augroup END
