vim.g.nb_disable_background = true
vim.g.nb_italic_comments  = true
vim.g.nb_italic_keywords  = true
vim.g.nb_italic_functions = true
vim.g.nb_italic_variables = true
vim.g.nb_style = "night"
require("nebulous").setup()
-- vim.api.nvim_exec([[
-- colorscheme nebulous
-- highlight Normal guibg=none
-- ]], true)
