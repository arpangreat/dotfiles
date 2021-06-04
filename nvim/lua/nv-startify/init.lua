vim.g.webdevicons_enable_startify = 1
vim.g.startify_enable_special = 0
vim.g.startify_session_dir = '~/.config/nvim/session'
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_dir = '~/.config/nvim/session'

-- Read ~/.NERDTreeBookmarks file and takes its second column

-- vim.cmd([[
--
-- function! s:nerdtreeBookmarks()
--     let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
--     let bookmarks = bookmarks[0:-2] " Slices an empty last line
--     return map(bookmarks, "{'line': v:val, 'path': v:val}")
-- endfunction
--
-- let g:startify_lists = [
--         \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
--         \]
--
-- ]])

-- Rust exs

-- vim.cmd([[
--
-- function! s:list_commits_rustexs()
--   let git = 'git -C ~/RustExs'
--   let commits = systemlist(git .' log --oneline | head -n10')
--   let git = 'G'. git[1:]
--   return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
-- endfunction
--
-- let g:startify_lists = [
--       \ { 'header': ['   MRU'],            'type': 'files' },
--       \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
--       \ { 'header': ['   Sessions'],       'type': 'sessions' },
--       \ { 'header': ['   Commits'],        'type': function('s:list_commits_rustexs') },
--       \ ]
--
-- ]])

vim.api.nvim_exec(
"let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc', '~/.config/nvim/init.vim']",
true)

