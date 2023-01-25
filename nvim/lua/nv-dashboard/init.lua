local db = require("dashboard")
db.setup({
	theme = "hyper",
	config = {
		header = {
			"",
			"░█████╗░██████╗░██████╗░░█████╗░███╗░░██╗░██████╗░██████╗░███████╗░█████╗░████████╗",
			"██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔══██╗██╔════╝██╔══██╗╚══██╔══╝",
			"███████║██████╔╝██████╔╝███████║██╔██╗██║██║░░██╗░██████╔╝█████╗░░███████║░░░██║░░░",
			"██╔══██║██╔══██╗██╔═══╝░██╔══██║██║╚████║██║░░╚██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░",
			"██║░░██║██║░░██║██║░░░░░██║░░██║██║░╚███║╚██████╔╝██║░░██║███████╗██║░░██║░░░██║░░░",
			"╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░",
			"",
		},
		-- ascii text in there
		shortcut = {
			{ desc = "[  Github]", group = "DashboardShortCut" },
			{ desc = "[  arpangreat]", group = "DashboardShortCut" },
			{ desc = "[  3.0.0]", group = "DashboardShortCut" },
		},
		packages = { enable = true }, -- show how many plugins neovim loaded
		project = { limit = 8, action = "Telescope find_files cwd=" }, -- limit how many projects list, action when you press key or enter it will run this action.
		mru = { limit = 10 }, -- how many files in list
		footer = {}, -- footer
	},
})
