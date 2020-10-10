" lightline

"let g:lightline = {
"      \ 'colorscheme': 'onedark',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'FugitiveHead'
"      \ },
"      \ }
"
"
"function! LightlineGitGutter()
"  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
"    return ''
"  endif
"  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
"  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
"endfunction
