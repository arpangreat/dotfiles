" Ale Configs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

let g:airline#extensions#ale#enabled = 1
set statusline=%{LinterStatus()}
nmap <silent> <C-l> <Plug>(ale_previous_wrap)
nmap <silent> <C-h> <Plug>(ale_next_wrap)
