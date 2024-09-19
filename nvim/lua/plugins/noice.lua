return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		popupmenu = {
			backend = "nui",
		},

		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = "auto",
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				zindex = 65,
				position = "auto",
				size = {
					width = "auto",
					height = "auto",
				},
				border = {
					style = "rounded",
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
			popup = {
				size = {
					width = "auto",
					height = "auto",
				},
			},
		},

		messages = {
			enabled = true,
			view_error = "messages",
			-- view_warn = "messages",
		},
		cmdline = {
			enabled = true,
			-- view = "popup",
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			-- command_palette = true, -- position the cmdline and popupmenu together
			-- long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
}
