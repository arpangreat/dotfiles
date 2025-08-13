return {
	"kawre/neotab.nvim",
	event = "InsertEnter",
	opts = {
		-- configuration goes here
		smart_punctuators = {
			enabled = true,
			semicolon = {
				enabled = true,
				ft = { "cs", "c", "cpp", "java" },
			},
			escape = { enabled = true },
		},
	},
}
