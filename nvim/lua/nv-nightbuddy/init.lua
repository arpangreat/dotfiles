vim.g.nb_style = "twilight"
require('colorbuddy').colorscheme('nightbuddy')
vim.api.nvim_exec([[
highlight Normal guibg=none
highlight Comment cterm=italic gui=italic
highlight Keyword cterm=italic gui=italic
highlight Function cterm=italic gui=italic
]], true)
