return {
	"nvim-lualine/lualine.nvim",
	-- event = "VeryLazy",
	-- enabled = false,
	opts = function()
		-- Patch tokyonight theme once and reuse
		local function patched_tokyonight()
			local custom = require("lualine.themes.tokyonight")
			local C = require("tokyonight.colors").setup({ style = "storm", transparent = true })

			local function patch(group, fg)
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
				-- always_divide_middle = true,
				refresh = {
					statusline = 100,
				},
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
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
						padding = { left = 0, right = 1 },
					},
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								reg = vim.fn.reg_executing()
							end
							if reg ~= "" then
								return " " .. reg
							end
							return ""
						end,
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
					{ "lsp_status" },
					{
						"diff",
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = {},
				lualine_z = {
					"progress",
					{
						"location",
					},
				},
			},
		}
	end,
}
