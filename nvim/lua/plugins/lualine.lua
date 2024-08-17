return {
	"nvim-lualine/lualine.nvim",
	event = "BufEnter",
	opts = function()
		local utils = require("core.utils")
		--[[ local copilot_colors = {
			[""] = utils.get_hlgroup("Comment"),
			["Normal"] = utils.get_hlgroup("Comment"),
			["Warning"] = utils.get_hlgroup("DiagnosticError"),
			["InProgress"] = utils.get_hlgroup("DiagnosticWarn"),
		} ]]
		local custom = require("lualine.themes.catppuccin")
		local C = require("catppuccin.palettes").get_palette("mocha")
		-- local custom = require("lualine.themes.tokyonight-night")
		-- local C = require("tokyonight.colors.night")
		custom.normal.a.bg = "none"
		custom.normal.a.fg = C.blue
		custom.normal.b.bg = "none"
		custom.normal.c.bg = "none"
		custom.command.a.bg = "none"
		custom.command.a.fg = C.yellow
		custom.command.b.bg = "none"
		custom.insert.a.bg = "none"
		custom.insert.a.fg = C.green
		custom.insert.b.bg = "none"
		custom.visual.a.bg = "none"
		custom.visual.a.fg = C.magenta
		custom.visual.b.bg = "none"
		custom.replace.a.bg = "none"
		custom.replace.a.fg = C.red
		custom.replace.b.bg = "none"
		custom.terminal.a.bg = "none"
		custom.terminal.a.fg = C.green1
		custom.terminal.b.bg = "none"
		-- custom.terminal.c.bg = "none"

		local clients_lsp = function()
			local bufnr = vim.api.nvim_get_current_buf()

			local clients = vim.lsp.get_clients({ bufnr = bufnr })
			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in pairs(clients) do
				table.insert(c, client.name)
			end
			return "\u{f085} " .. table.concat(c, "|")
		end

		return {
			options = {
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				theme = custom,
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha" } },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = "󰝶 ",
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", padding = { left = 1, right = 0 } },
					{
						function()
							local buffer_count = require("core.utils").get_buffer_count()

							return "+" .. buffer_count - 1 .. " "
						end,
						cond = function()
							return require("core.utils").get_buffer_count() > 1
						end,
						color = utils.get_hlgroup("Operator", nil),
						padding = { left = 0, right = 1 },
					},
				},
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = utils.get_hlgroup("String"),
					},
					{
						clients_lsp,
					},
					{ "diff" },
				},
				lualine_y = {
					"filetype",
				},
				lualine_z = {
					{
						"progress",
					},
					{
						"location",
						color = utils.get_hlgroup("Boolean"),
					},
				},
			},

			tabline = {
				lualine_z = { {
					"tabs",
					mode = 2,
				} },
			},

			extensions = { "lazy", "mason", "trouble" },
		}
	end,
	-- config = function()
	-- 	local icons = require("user.icons")
	-- 	local diff = {
	-- 		"diff",
	-- 		colored = true,
	-- 		symbols = {
	-- 			added = icons.git.LineAdded,
	-- 			modified = icons.git.LineModified,
	-- 			removed = icons.git.LineRemoved,
	-- 		}, -- Changes the symbols used by the diff.
	-- 	}

	-- 	local clients_lsp = function()
	-- 		local bufnr = vim.api.nvim_get_current_buf()

	-- 		local clients = vim.lsp.get_clients({ bufnr = bufnr })
	-- 		if next(clients) == nil then
	-- 			return ""
	-- 		end

	-- 		local c = {}
	-- 		for _, client in pairs(clients) do
	-- 			table.insert(c, client.name)
	-- 		end
	-- 		return "\u{f085} " .. table.concat(c, "|")
	-- 	end

	-- 	local custom = require("lualine.themes.catppuccin")
	-- 	-- local custom = require("lualine.themes.tokyonight")
	-- 	-- local custom = require("lualine.themes.material")
	-- 	-- local custom = require("lualine.themes.horizon")
	-- 	-- local custom = require("lualine.themes.solarized-osaka")
	-- 	-- local custom = require("lualine.themes.eldritch")
	-- 	custom.normal.c.bg = "none"

	-- 	local config = {
	-- 		options = {
	-- 			-- theme = "catppuccin",
	-- 			-- theme = "onedark_vivid",
	-- 			theme = custom,
	-- 			-- theme = "bamboo",
	-- 			-- theme = "solarized-osaka",
	-- 			-- theme = "tokyonight",
	-- 			-- theme = "carbonfox",
	-- 			-- theme = "material",
	-- 			-- theme = "themer",
	-- 			component_separators = { left = "", right = "" },
	-- 			section_separators = { left = "", right = "" },

	-- 			fmt = string.lower,
	-- 			-- refresh = {
	-- 			-- 	statusline = nil,
	-- 			-- },
	-- 		},
	-- 		sections = {
	-- 			lualine_a = {
	-- 				{
	-- 					"mode",
	-- 					fmt = function(str)
	-- 						return str:sub(1, 1)
	-- 					end,
	-- 				},
	-- 			},
	-- 			lualine_b = { "branch" },
	-- 			lualine_c = {
	-- 				diff,
	-- 				--[[ {
	-- 					function()
	-- 						return require("nvim-navic").get_location()
	-- 					end,
	-- 					cond = function()
	-- 						return require("nvim-navic").is_available()
	-- 					end,
	-- 				}, ]]
	-- 			},
	-- 			lualine_y = { "filetype" },
	-- 			lualine_z = { "progress", "location" },
	-- 			lualine_x = {
	-- 				"encoding",
	-- 				clients_lsp,
	-- 				"fileformat",
	-- 			},
	-- 		},
	-- 		tabline = {
	-- 			lualine_z = { {
	-- 				"tabs",
	-- 				mode = 2,
	-- 			} },
	-- 		},
	-- 	}

	-- 	require("lualine").setup(config)
	-- end,
}
