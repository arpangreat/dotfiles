vim.g.material_flat_ui = 1
vim.g.material_italic_comments = 1
vim.g.material_italic_keywords = 1
vim.g.material_italic_functions = 1
vim.g.material_style = 'palenight'

require('colorbuddy').colorscheme('material')
vim.cmd("colorscheme material")

vim.api.nvim_exec([[highlight Normal guibg=none]], true)

--Lua:
vim.api.nvim_set_keymap('n', '<C-m>', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
