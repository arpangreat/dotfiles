return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		win = {
			-- border = "single", -- none, single, double, shadow
			height = { max = 30 },
			padding = { 1, 1 },
		},
		layout = {
			-- align = "center", -- align columns left, center or right
			spacing = 5,
		},
		show_help = true, -- show help message on the command line when the popup is visible
		triggers = {
			{ "<auto>", mode = "nixsotc" },
			{ "a", mode = { "n", "v" } },
		}, -- automatically setup triggers
		show_keys = true, -- show the currently pressed key and its label as a message in the command line

		icons = {
			keys = {
				Leader = "󱁐 ",
				LocalLeader = ",",
			},
		},

		spec = {
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
			{ "<leader>t", group = "Telescope" },
			{ "<leader>f", group = "FzfLua", icon = " " },
			{ "<leader>s", group = "Split" },
			{ "<leader>g", group = "Lsp" },
			{ "<leader>m", group = "Mini" },
			{ "<leader>mf", group = "MiniFiles" },
			{ "<leader>q", group = "Quit" },
			{ "<leader>ex", group = "Quit" },
			{ "<leader>w", group = "Write" },
			{ "<leader>c", group = "Compile" },
			-- { "<leader>ff", group = "Format" },
			{ "<leader>h", group = "Gitsigns" },
			{ "]h", "<cmd>lua require('gitsigns').nav_hunk('next')<cr>", desc = "Next Hunk" },
			{ "[h", "<cmd>lua require('gitsigns').nav_hunk('prev')<cr>", desc = "Prev Hunk" },
			{ "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<cr>", desc = "Diff hunk" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>L", group = "Laravel" },
		},

		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
