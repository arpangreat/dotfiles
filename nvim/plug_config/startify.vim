" Vim-Startify

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
 " function! s:gitModified()
 "     let files = systemlist('git ls-files -m 2>/dev/null')
 "     return map(files, "{'line': v:val, 'path': v:val}")
 " endfunction
 "
 " " same as above, but show untracked files, honouring .gitignore
 " function! s:gitUntracked()
 "     let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
 "     return map(files, "{'line': v:val, 'path': v:val}")
 " endfunction
 "
 " let g:startify_lists = [
 "         \ { 'type': 'files',     'header': ['   MRU']            },
 "         \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
 "         \ { 'type': 'sessions',  'header': ['   Sessions']       },
 "         \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
 "         \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
 "         \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
 "         \ { 'type': 'commands',  'header': ['   Commands']       },
 "         \ ]

" See :h g:startify_lists for more information.

" Display NERDTree bookmarks
" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]


" let g:startify_bookmarks = [
"             \ '~/.zshrc',
"             \ '~/.config/nvim/init.vim',
"             \ '~/.config/nvim/init/',
"             \ ]
"
"
" if isdirectory('~/dotfiles')
"   call add(g:startify_bookmarks, '~/dotfiles')
" endif
"
" let g:startify_change_to_dir = 1
" let g:startify_list_order = [
"   \ ['   LRU:'],
"   \ 'files',
"   \ ['   LRU within this dir:'],
"   \ 'dir',
"   \ ['   Sessions:'],
"   \ 'sessions',
"   \ ['   Bookmarks:'],
"   \ 'bookmarks',
"   \ ]
"
" let g:startify_skiplist = [
"             \ 'COMMIT_EDITMSG',
"             \ 'bundle/.*/doc',
"             \ '/data/repo/neovim/runtime/doc',
"             \ '/Users/mhi/local/vim/share/vim/vim74/doc',
"             \ ]
 " function! s:list_commits()
 "   let git = 'git -C ~/cppexamples'
 "   let commits = systemlist(git .' log --oneline | head -n10')
 "   let git = 'G'. git[1:]
 "   return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
 " endfunction
 "
 " let g:startify_lists = [
 "       \ { 'header': ['   MRU'],            'type': 'files' },
 "       \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
 "       \ { 'header': ['   Sessions'],       'type': 'sessions' },
 "       \ { 'header': ['   Commits'],        'type': function('s:list_commits') },
 "       \ ]
 "
 "
 " function! s:list_commits_rustexs()
 "   let git = 'git -C ~/RustExs'
 "   let commits = systemlist(git .' log --oneline | head -n10')
 "   let git = 'G'. git[1:]
 "   return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
 " endfunction
 "
 " let g:startify_lists = [
 "       \ { 'header': ['   MRU'],            'type': 'files' },
 "       \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
 "       \ { 'header': ['   Sessions'],       'type': 'sessions' },
 "       \ { 'header': ['   Commits'],        'type': function('s:list_commits_rustexs') },
 "       \ ]
 "
 "
 " function! s:list_commits_dotfiles()
 "   let git = 'git -C ~/dotfiles'
 "   let commits = systemlist(git .' log --oneline | head -n10')
 "   let git = 'G'. git[1:]
 "   return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
 " endfunction
 "
 " let g:startify_lists = [
 "       \ { 'header': ['   MRU'],            'type': 'files' },
 "       \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
 "       \ { 'header': ['   Sessions'],       'type': 'sessions' },
 "       \ { 'header': ['   Commits'],        'type': function('s:list_commits_dotfiles') },
 "       \ ]
 "
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc', '~/.config/nvim/init.vim']
