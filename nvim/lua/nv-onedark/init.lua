-- Example config in Lua
--[[ require("onedark").setup({
  functionStyle = "italic",
  variableStyle = "italic",
  transparent = "italic",
  darkSidebar = false,
  darkFloat = false,
  -- sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})
 ]]

local colorscheme = "onedarker"

vim.g.onedarker_italic_keywords = true

vim.g.onedarker_italic_functions = false

vim.g.onedarker_italic_comments = true

vim.g.onedarker_italic_loops = true

vim.g.onedarker_italic_conditionals = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  -- vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
