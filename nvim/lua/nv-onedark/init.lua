-- Example config in Lua
vim.g.onedark_italic_comments = true
vim.g.onedark_italic_keywords = true
vim.g.onedark_italic_variables = true
vim.g.onedark_italic_functions = true
vim.g.onedark_transparent = true
vim.g.onedark_dark_sidebars = false
vim.g.onedark_dark_float = false
vim.g.onedark_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.onedark_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.api.nvim_exec([[
colorscheme onedark
highlight Normal guibg=none
]], true)

