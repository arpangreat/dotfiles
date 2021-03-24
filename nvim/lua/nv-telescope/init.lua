vim.cmd('highlight TelescopeSelection      guifg=#D79921 gui=bold " selected item')
vim.cmd('highlight TelescopeSelectionCaret guifg=#CC241D " selection caret')
vim.cmd('highlight TelescopeMultiSelection guifg=#928374 " multisections')
vim.cmd('highlight TelescopeNormal         guibg=#00000  " floating windows created by telescope.')

-- Border highlight groups.
vim.cmd('highlight TelescopeBorder         guifg=#00ffff')
vim.cmd('highlight TelescopePromptBorder   guifg=#00ffff')
vim.cmd('highlight TelescopeResultsBorder  guifg=#00ffff')
vim.cmd('highlight TelescopePreviewBorder  guifg=#00ffff')

-- Used for highlighting characters that you match.
vim.cmd('highlight TelescopeMatching       guifg=blue')

-- Used for the prompt prefix
vim.cmd('highlight TelescopePromptPrefix   guifg=red')
