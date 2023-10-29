return {
	"SmiteshP/nvim-navic",
	"kylechui/nvim-surround",
	{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
	{ "nvimtools/none-ls.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "nvim-treesitter/playground" },
	},

	{
		"nvim-lualine/lualine.nvim",
	},

	"kyazdani42/nvim-web-devicons",

	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- },
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		init = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = true,
			})
		end,
	},
	"ldelossa/gh.nvim",
	{ "NeogitOrg/neogit", dependencies = { "nvim-lua/plenary.nvim", "rbong/vim-flog", "tpope/vim-fugitive" } },
	"sindrets/diffview.nvim",
	"rhysd/committia.vim",
	"b3nj5m1n/kommentary",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"numToStr/Comment.nvim",
	},

	"folke/todo-comments.nvim",
	"HiPhish/rainbow-delimiters.nvim",
	{
		"uga-rosa/ccc.nvim",
		init = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end,
	},
	"folke/tokyonight.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{ "themercorp/themer.lua" },
	"rebelot/kanagawa.nvim",
	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	"mrjones2014/smart-splits.nvim",
	"windwp/nvim-ts-autotag",
	"dart-lang/dart-vim-plugin",
	{
		"akinsho/flutter-tools.nvim",
		init = function()
			require("flutter-tools").setup({
				experimental = {
					lsp_derive_paths = true,
				},
				widget_guides = {
					enabled = true,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
			--   {
			--     "elixir-tools/elixir-tools.nvim",
			--     version="*",
			--   event = { "BufRead", "BufNewFile" },
			-- },
			"mhinz/vim-mix-format",
			{ "tzachar/cmp-tabnine", build = "./install.sh" },
			{ "L3MON4D3/LuaSnip" },
			"rafamadriz/friendly-snippets",
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				event = "InsertEnter",
			},
			{
				"zbirenbaum/copilot-cmp",
				after = { "copilot.lua" },
				config = function()
					require("copilot_cmp").setup()
				end,
			},
			{
				"folke/which-key.nvim",
			},
			{ "ollykel/v-vim" },
			{
				"rust-lang/rust.vim",
				"ziglang/zig.vim",
				"simrat39/rust-tools.nvim",
				"Tetralux/odin.vim",
				"scalameta/nvim-metals",
			},
			{ "ibhagwan/fzf-lua" },
			{
				"hrsh7th/nvim-insx",
				config = function()
					require("insx.preset.standard").setup()
				end,
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	"nvim-telescope/telescope-frecency.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	-- "tami5/sql.nvim",
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	"ThePrimeagen/harpoon",
	"simnalamburt/vim-mundo",
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		init = function()
			require("toggleterm").setup({
				open_mapping = [[<c-/>]],
				direction = "float",
			})
		end,
	},
	-- My Plugins
	{ "williamboman/mason.nvim", branch = "main" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "lvimuser/lsp-inlayhints.nvim" },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"echasnovski/mini.files",
		event = "VeryLazy",
		config = function()
			require("mini.files").setup()
		end,
	},
	{
		"echasnovski/mini.cursorword",
		event = "VeryLazy",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{ "WhoIsSethDaniel/lualine-lsp-progress.nvim", event = "VeryLazy" },
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
	},
}
