require'snippets'.use_suggested_mappings()
require'snippets'.use_suggested_mappings(true)

vim.api.nvim_set_keymap('i','<c-K',"<cmd>lua return require'snippets'.expand_or_advance(1)<CR>", { noremap = true , silent = false })

vim.api.nvim_set_keymap('i','<c-J',"<cmd>lua return require'snippets'.advance_snippet(-1)<CR>", { noremap = true , silent = false })
