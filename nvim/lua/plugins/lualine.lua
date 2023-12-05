return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local icons = require("user.icons")
		local diff = {
			"diff",
			colored = true,
			symbols = {
				added = icons.git.LineAdded,
				modified = icons.git.LineModified,
				removed = icons.git.LineRemoved,
			}, -- Changes the symbols used by the diff.
		}

		local clients_lsp = function()
			local bufnr = vim.api.nvim_get_current_buf()

			local clients = vim.lsp.buf_get_clients(bufnr)
			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in pairs(clients) do
				table.insert(c, client.name)
			end
			return "\u{f085} " .. table.concat(c, "|")
		end

		local custom = require("lualine.themes.tokyonight")
		-- local custom = require("lualine.themes.horizon")
		-- local custom = require("lualine.themes.solarized-osaka")
		custom.normal.c.bg = "none"

		local config = {
			options = {
				-- theme = "catppuccin",
				-- theme = "onedark_vivid",
				theme = custom,
				-- theme = "solarized-osaka",
				-- theme = "tokyonight",
				-- theme = "carbonfox",
				-- theme = "material",
				-- theme = "themer",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },

				fmt = string.lower,
				-- refresh = {
				-- 	statusline = nil,
				-- },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = { "branch" },
				lualine_c = { diff },
				lualine_y = { "filetype" },
				lualine_z = { "progress", "location" },
				lualine_x = {
					"encoding",
					clients_lsp,
					"fileformat",
				},
			},
			tabline = {
				lualine_z = { {
					"tabs",
					mode = 2,
				} },
			},
		}

		require("lualine").setup(config)
	end,
}
