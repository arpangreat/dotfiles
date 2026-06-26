local M = {}

function M.setup()
	require("tokyonight").setup({
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
		on_highlights = function(highlights, colors)
			highlights.LspInlayHint = { bg = "#063540", fg = colors.blue2 }
			highlights.CursorLine = { bg = "#12314D" }
		end,
	})

	vim.cmd.colorscheme("tokyonight")
end

return M
