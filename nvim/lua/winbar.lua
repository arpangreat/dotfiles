local get_filename = function()
	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local f = require("user.functions")

	if not f.isempty(filename) then
		local file_icon, file_icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

		local hl_group = "FileIconColor" .. extension

		vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
		if f.isempty(file_icon) then
			file_icon = ""
			file_icon_color = ""
		end
		-- vim.api.nvim_set_hl(0, "Winbar", { fg = "#6b737f" })

		return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"
	end
end

local get_winbar = function()
	local status_winbar_ok, winbar = pcall(require, "nvim-winbar")
	if not status_winbar_ok then
		return ""
	end

	local status_ok, winbar_location = pcall(winbar.get_location, {})
	if not status_ok then
		return ""
	end

	if not winbar.is_available() or winbar_location == "error" then
		return ""
	end

	if not require("user.functions").isempty(winbar_location) then
		return require("user.icons").ui.ChevronRight .. " " .. winbar_location
	else
		return ""
	end
end

vim.o.winbar = get_filename()
