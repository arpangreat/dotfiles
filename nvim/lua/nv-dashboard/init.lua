local db = require("dashboard")
local header = {
	"",
	"░█████╗░██████╗░██████╗░░█████╗░███╗░░██╗░██████╗░██████╗░███████╗░█████╗░████████╗",
	"██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔══██╗██╔════╝██╔══██╗╚══██╔══╝",
	"███████║██████╔╝██████╔╝███████║██╔██╗██║██║░░██╗░██████╔╝█████╗░░███████║░░░██║░░░",
	"██╔══██║██╔══██╗██╔═══╝░██╔══██║██║╚████║██║░░╚██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░",
	"██║░░██║██║░░██║██║░░░░░██║░░██║██║░╚███║╚██████╔╝██║░░██║███████╗██║░░██║░░░██║░░░",
	"╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░",
	"",
}
local newline = [[]]

db.custom_header = header

vim.g.indentLine_fileTypeExclude = { "dashboard" }

db.custom_center = {
	{ icon = " ", desc = "Find File              ", shortcut = "SPC t f", action = "Telescope find_files" },
	{ icon = " ", desc = "Recently Used Files    ", shortcut = "SPC f h", action = "Telescope oldfiles" },
	{ icon = " ", desc = "Find Word              ", shortcut = "SPC f a", action = "Telescope live_grep" },
	{ icon = " ", desc = "Marks                  ", shortcut = "SPC f b", action = "Telescope marks" },
}

db.custom_footer = { "https://github.com/arpangreat/" }
