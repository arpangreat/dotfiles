vim.g.rnvimr_enable_ex = 1

vim.g.rnvimr_enable_picker = 1

-- vim.g.rnvimr_edit_cmd = "drop"

-- vim.g.rnvimr_draw_border = 0

vim.g.rnvimr_hide_gitignore = 1

-- vim.g.rnvimr_enable_bw = 1

-- vim.g.rnvimr_shadow_winblend = 70

vim.cmd([[ 
highlight link RnvimrNormal CursorLine
let g:rnlet_border_attr = {'fg': 14, 'bg': -1}
let g:rnlet_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
]])
