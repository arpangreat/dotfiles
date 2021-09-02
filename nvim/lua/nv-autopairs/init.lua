--auto pairs
vim.cmd('let g:AutoPairsFlyMode = 1')
vim.cmd("let g:AutoPairsShortcutBackInsert = '<M-b>'")

vim.api.nvim_exec([[
  au FileType lua      let b:AutoPairs = AutoPairsDefine({'then' : 'end', 'do': 'end'})
]], true)

