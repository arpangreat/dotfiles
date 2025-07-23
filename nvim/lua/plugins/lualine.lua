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
		-- local custom = require("lualine.themes.catppuccin")
		-- local C = require("catppuccin.palettes").get_palette("mocha")
		-- local custom = require("lualine.themes.tokyonight-night")
		local custom = require("lualine.themes.tokyonight-storm")
		local C = require("tokyonight.colors").setup({ style = "storm", transparent = true })
		custom.normal.a.bg = C.none
		custom.normal.a.fg = C.blue
		custom.normal.b.bg = C.none
		custom.normal.c.bg = C.none
		custom.command.a.bg = C.none
		custom.command.a.fg = C.yellow
		custom.command.b.bg = C.none
		custom.insert.a.bg = C.none
		custom.insert.a.fg = C.green
		custom.insert.b.bg = C.none
		custom.visual.a.bg = C.none
		custom.visual.a.fg = C.magenta
		custom.visual.b.bg = C.none
		custom.replace.a.bg = C.none
		custom.replace.a.fg = C.red
		custom.replace.b.bg = C.none
		custom.terminal.a.bg = C.none
		custom.terminal.a.fg = C.green1
		custom.terminal.b.bg = C.none
		custom.inactive.a.bg = C.none
		custom.inactive.b.bg = C.none
		custom.inactive.c.bg = C.none
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
					{ "filetype", icon_only = true, separator = "", padding = { left = 0, right = 0 } },
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
					"progress",
					{
						"location",
						color = utils.get_hlgroup("Boolean"),
					},
				},
			},

			-- tabline = {
			-- 	lualine_z = {
			-- 		{
			-- 			"tabs",
			-- 			mode = 2,
			-- 			use_mode_colors = true,
			-- 		},
			-- 	},
			-- },

			extensions = { "lazy", "mason", "trouble" },
		}
	end,
}
