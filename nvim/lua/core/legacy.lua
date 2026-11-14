-- Disable built-in plugins that we never use.
-- Setting these before any runtime sourcing prevents Neovim from even
-- looking for the corresponding plugin/ scripts.
local g = vim.g
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_gzip = 1
g.loaded_tarPlugin = 1
g.loaded_tohtml = 1
g.loaded_tutor = 1
g.loaded_zipPlugin = 1
g.loaded_syntax = 1
g.loaded_Syntax = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_2html_plugin = 1
-- Also skip matchit/matchparen if not needed (they source vimscript)
g.loaded_matchit = 1
g.loaded_matchparen = 1
