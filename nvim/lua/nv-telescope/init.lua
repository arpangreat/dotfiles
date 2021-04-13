vim.api.nvim_exec([[
highlight TelescopeSelection      guifg=#D79921 gui=bold " selected item
highlight TelescopeSelectionCaret guifg=#CC241D " selection caret
highlight TelescopeMultiSelection guifg=#928374 " multisections
highlight TelescopeNormal         guibg=#00000  " floating windows created by telescope

" Border highlight groups.
highlight TelescopeBorder         guifg=#00ffff
highlight TelescopePromptBorder   guifg=#00ffff
highlight TelescopeResultsBorder  guifg=#00ffff
highlight TelescopePreviewBorder  guifg=#00ffff

" Used for highlighting characters that you match.
highlight TelescopeMatching       guifg=blue

" Used for the prompt prefix
highlight TelescopePromptPrefix   guifg=red
]], true)
