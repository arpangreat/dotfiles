return {
	"olimorris/codecompanion.nvim",
	opts = {
		adapters = {
			acp = {
				gemini_cli = function()
					return require("codecompanion.adapters").extend("gemini_cli", {
						commands = {
							default = {
								"gemini",
								"--experimental-acp",
							},
						},
						defaults = {
							auth_method = "gemini-api-key",
							timeout = 20000, -- 20 seconds
						},
						env = {
							-- Using 'cmd:' to securely load API key from 1Password CLI
							-- GEMINI_API_KEY = "cmd:op read op://personal/Gemini/credential --no-newline",
						},
					})
				end,
			},
		},
		strategies = {
			chat = {
				adapter = "gemini_cli",
			},
			inline = {
				adapter = "gemini_cli",
			},
			agent = {
				adapter = "gemini_cli",
			},
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)

		-- Keymaps for CodeCompanion
		-- In normal mode, this opens the prompt with :CodeCompanion
		-- The space at the end is intentional, so you can start typing your prompt
		vim.keymap.set("n", "<leader>ca", ":CodeCompanion ", { desc = "CodeCompanion prompt" })

		-- In visual mode, this uses the selected text as context for the prompt
		vim.keymap.set("v", "<leader>ca", ":CodeCompanion<cr>", { desc = "CodeCompanion with selection" })
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
