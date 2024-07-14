return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	keys = { { "<leader>" } },
	config = function()
		local wk = require("which-key")

		wk.setup({
			plugins = {
				marks = false, -- shows a list of your marks on ' and `
				registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = false, -- default bindings on <c-w>
					nav = false, -- misc bindings to work with windows
					z = false, -- bindings for folds, spelling and others prefixed with z
					g = false, -- bindings for prefixed with g
				},
				spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
			},

			-- operators = { gc = "Comments" },
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = "single", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			show_help = true, -- show help message on the command line when the popup is visible
			triggers = "auto", -- automatically setup triggers
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			-- triggers = {"<leader>"} -- or specify a list manually
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for key maps that start with a native binding
				-- most people should not need to change this
				i = { "j", "k" },
				v = { "j", "k" },
			},

			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt" },
			},
		})

		wk.add({
			{
				mode = { "n" },
				{ "<leader>d", group = "Debug" }, -- group
				{ "<leader>dt", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
				{
					"<leader>db",
					function()
						print("hello")
					end,
					desc = "Foobar",
				},
				{ "<leader>dc", desc = "New File" },
				{ "<leader>dC", hidden = true }, -- hide this keymap
				{ "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
				{ "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
				{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
				{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
				{ "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
				{ "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
				{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
				{ "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
				{ "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
				{ "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
				{ "<leader>l", group = "Lazy" },
				{ "<leader>ll", "<cmd>Lazy<CR>", desc = "Lazy Home" },
				{ "<leader>lf", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "find file" },
			},
		})
	end,
}
