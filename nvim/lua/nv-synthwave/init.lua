local colorscheme = "synthwave84"

vim.g.synthwave84_italic_keywords = true

vim.g.synthwave84_italic_functions = false

vim.g.synthwave84_italic_comments = true

vim.g.synthwave84_italic_loops = true

vim.g.synthwave84_italic_conditionals = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	-- vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd([[ highlight Normal guibg=NONE guifg=NONE ]])
