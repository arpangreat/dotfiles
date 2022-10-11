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

local get_gps = function()
	local status_gps_ok, gps = pcall(require, "nvim-gps")
	if not status_gps_ok then
		return ""
	end

	local status_ok, gps_location = pcall(gps.get_location, {})
	if not status_ok then
		return ""
	end

	if not gps.is_available() or gps_location == "error" then
		return ""
	end

	if not require("user.functions").isempty(gps_location) then
		return require("user.icons").ui.ChevronRight .. " " .. gps_location
	else
		return ""
	end
end

vim.o.winbar = get_filename()
