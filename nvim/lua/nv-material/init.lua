-- vim.g.material_flat_ui = 1
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = true
vim.g.material_style = "palenight"
vim.g.material_contrast = false
vim.g.material_borders = false
vim.g.material_disable_background = true

require('material').set()

vim.api.nvim_exec([[highlight Normal guibg=none]], true)

--Lua:
vim.api.nvim_set_keymap('n', '<C-m>', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
