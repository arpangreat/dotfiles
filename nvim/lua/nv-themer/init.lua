require("themer").setup({
	-- colorscheme = "catppuccin", -- default colorscheme
	-- colorscheme = "doom_one",
	-- colorscheme = "kurai",
	-- colorscheme = "onedark_deep",
	-- colorscheme = "astron",
	-- colorscheme = "gruvbox-material-dark-soft",
	-- colorscheme = "kanagawa",
	colorscheme = "amora",
	transparent = true,
	term_colors = true,
	dim_inactive = false,
	disable_telescope_themes = {},
	styles = {
		heading = {
			h1 = {},
			h2 = {},
		},
		["function"] = { style = "italic" },
		functionBuiltIn = { style = "italic" },
		variable = { style = "italic" },
		variableBuiltIn = { style = "italic" },
		include = { style = "bold" },
		identifier = { style = "bold" },
		keyword = { style = "bold" },
		keywordBuiltIn = { style = "bold" },
		struct = { style = "italic" },
		string = { style = "italic" },
		parameter = { style = "italic" },
		field = { style = "italic" },
		type = { style = "italic" },
		typeBuiltIn = { style = "italic" },
		property = { style = "italic" },
		comment = { style = "italic" },
		punctuation = { style = "italic" },
		constructor = { style = "italic" },
		operator = { style = "italic" },
		constant = { style = "italic" },
		constantBuiltIn = { style = "italic" },
		todo = { style = "italic" },
		character = { style = "italic" },
		conditional = { style = "italic" },
		number = { style = "italic" },
		statement = { style = "italic" },
		uri = { style = "italic" },
		diagnostic = {
			underline = {
				error = { style = "italic" },
				warn = { style = "italic" },
				info = { style = "italic" },
				hint = { style = "italic" },
			},
			virtual_text = {
				error = { style = "italic" },
				warn = { style = "italic" },
				info = { style = "italic" },
				hint = { style = "italic" },
			},
		},
	},
	remaps = {
		palette = {},
		-- per colorscheme palette remaps, for example:
		--[[ remaps.palette = {
		    rose_pine = {
		    	fg = "#000000"
		    }
		},
		remaps.highlights = {
		    rose_pine = {
		base = {
		    	  Normal = { bg = "#000000" }
		},
		    }
		}, ]]
		--
		-- Also you can do remaps.highlights.globals  for global highlight remaps
		--[[ highlights = {
			doom_one = {
				base = {
					Normal = { guibg = "#000000" },
				},
			},
		}, ]]
		highlights = {
			base = {
				onedark_deep = { guifg = "magenta" },
			},
		},
	},

	langs = {
		html = true,
		md = true,
	},

	plugins = {
		treesitter = true,
		indentline = true,
		barbar = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		lsp = true,
		telescope = true,
	},
	enable_installer = true, -- enable installer module
})

-- vim.cmd([[ colorscheme themer_doom_one ]])
-- vim.cmd([[ colorscheme themer_onedark_deep ]])
-- vim.cmd([[ colorscheme themer_astron ]])
-- vim.cmd([[ colorscheme themer_gruvbox-material-dark-soft]])
-- vim.cmd([[ colorscheme themer_kanagawa ]])
vim.cmd([[ colorscheme themer_amora ]])
