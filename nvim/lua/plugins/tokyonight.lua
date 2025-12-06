return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	-- enabled = false,
	config = function()
		require("tokyonight").setup({
			style = "moon",
			transparent = true,
			-- terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- comments = { italic = true },
				keywords = { bold = true, italic = true },
				functions = { italic = true },
				variables = { italic = true, bold = true },
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
			-- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
			dim_inactive = true, -- dims inactive windows

			cache = true,

			on_highlights = function(hl, c)
				hl["@variable"] = { fg = c.red }
				hl["@lsp.type.namespace"] = { italic = true, bold = true }
				hl["@operator"] = { bold = true }
				hl.LspInlayHint = { bg = "#063540", fg = c.blue2 }
				hl.CursorLine = { bg = "#182235" }
			end,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
