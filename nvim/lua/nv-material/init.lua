vim.g.material_flat_ui = 1
vim.g.material_italic_comments = 1
vim.g.material_italic_keywords = 1
vim.g.material_italic_functions = 1
vim.g.material_italic_variables = 1
vim.g.material_style = 'palenight'
-- vim.g.material_contrast = false
vim.g.material_borders = true
-- vim.g.material_disable_background = 0

require('colorbuddy').colorscheme('material')
vim.cmd("colorscheme material")

vim.api.nvim_exec([[highlight Normal guibg=none]], true)

--Lua:
vim.api.nvim_set_keymap('n', '<C-m>', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
