-- vim.g.dashboard_custom_header = {
--     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
--     '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
--     '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
--     '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
--     '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
--     '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',
-- }
local db = require("dashboard")
db.custom_heder = {
	"",
	"░█████╗░██████╗░██████╗░░█████╗░███╗░░██╗░██████╗░██████╗░███████╗░█████╗░████████╗",
	"██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔══██╗██╔════╝██╔══██╗╚══██╔══╝",
	"███████║██████╔╝██████╔╝███████║██╔██╗██║██║░░██╗░██████╔╝█████╗░░███████║░░░██║░░░",
	"██╔══██║██╔══██╗██╔═══╝░██╔══██║██║╚████║██║░░╚██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░",
	"██║░░██║██║░░██║██║░░░░░██║░░██║██║░╚███║╚██████╔╝██║░░██║███████╗██║░░██║░░░██║░░░",
	"╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░",
	"",
}
-- vim.g.dashboard_preview_command = 'cat'
-- vim.g.dashboard_preview_pipeline = 'lolcat'
-- vim.g.dashboard_preview_file = '~/dotfiles/nvim/ascii-files/arpangreat-cool2.cat'
-- vim.g.dashboard_preview_file_height = 8
-- vim.g.dashboard_preview_file_width = 90

--[[ vim.cmd("let g:indentLine_fileTypeExclude = ['dashboard']")

vim.g.dashboard_default_executive = "telescope" ]]

db.custom_center = {
	{ desc = { " Find File        :SPC t f" }, action = "Telescope find_files" },
	{ desc = { " Recently Used Files  :SPC f h" }, action = "Telescope oldfiles" },
	{ desc = { " Load Last Session  :SPC s l" }, action = "SessionLoad" },
	{ desc = { " Find Word          :SPC f a" }, action = "Telescope live_grep" },
	{ desc = { " Marks              :SPC f b" }, action = "Telescope marks" },
	{ desc = { "𝓝𝓿𝓲𝓶 Nvim Configuration :SPC t r c" }, action = " Telescope configuration" },
	{ desc = { " Nvim Configuration :SPC t r c" }, action = " Telescope configuration" },
}

db.custom_footer = { "https://github.com/arpangreat/" }
