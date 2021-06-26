-- Example config in Lua
vim.g.gruvbox_italic_functions = true
vim.g.gruvbox_italic_variables = true
vim.g.gruvbox_transparent = true
vim.g.gruvbox_dark_sidebar = false
vim.g.gruvbox_dark_float = false
vim.g.gruvbox_flat_style = "dark" -- or "hard"

-- vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-flat]]

