return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local utils = require("core.utils")

		-- Patch tokyonight theme once and reuse
		local function patched_tokyonight()
			local custom = require("lualine.themes.tokyonight")
			local C = require("tokyonight.colors").setup({ style = "storm", transparent = true })

			local function patch(group, fg, bg)
				if custom[group] then
					custom[group].a = { fg = C[fg], bg = C.none }
					custom[group].b = { bg = C.none }
				end
			end

			patch("normal", "blue")
			patch("insert", "green")
			patch("visual", "magenta")
			patch("replace", "red")
			patch("command", "yellow")
			patch("terminal", "green1")

			custom.inactive.a.bg = C.none
			custom.inactive.b.bg = C.none
			custom.inactive.c.bg = C.none

			return custom
		end

		local theme = patched_tokyonight()

		local function get_listed_buffer_count()
			local count = 0
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.fn.buflisted(buf) == 1 then
					count = count + 1
				end
			end
			return count
		end

		return {
			options = {
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
				theme = theme,
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
							local count = get_listed_buffer_count()
							return "+" .. (count - 1) .. " "
						end,
						cond = function()
							return get_listed_buffer_count() > 1
						end,
						color = utils.get_hlgroup("Operator", nil),
						padding = { left = 0, right = 1 },
					},
				},
				lualine_x = {
					-- function()
					-- 	local bufnr = vim.api.nvim_get_current_buf()
					-- 	local clients = vim.lsp.get_clients({ bufnr = bufnr })
					-- 	if not clients or #clients == 0 then
					-- 		return ""
					-- 	end
					-- 	local names = {}
					-- 	for _, client in ipairs(clients) do
					-- 		table.insert(names, client.name)
					-- 	end
					-- 	return " " .. table.concat(names, "|")
					-- end,
					{ "lsp_status", symbols = { separator = "|" } },
					{ "diff" },
				},
				lualine_y = {},
				lualine_z = {
					"progress",
					{
						"location",
						color = utils.get_hlgroup("Boolean"),
					},
				},
			},
		}
	end,
}
