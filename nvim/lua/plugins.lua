return {
	"SmiteshP/nvim-navic",
	"kylechui/nvim-surround",
	{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
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
	"windwp/nvim-autopairs",
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
	{"lukas-reineke/indent-blankline.nvim", main="ibl", opts={} },
  "HiPhish/rainbow-delimiters.nvim",
	{
		"uga-rosa/ccc.nvim",
		init = function()
			require("ccc").setup()
		end,
	},
	"folke/tokyonight.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{ "themercorp/themer.lua" },
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
	"p00f/clangd_extensions.nvim",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	"nvim-telescope/telescope-frecency.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	"tami5/sql.nvim",
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	"christianchiarulli/harpoon",
	{ "j-hui/fidget.nvim", tag = "legacy" },
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

	"RRethy/vim-illuminate",
	{ "iamcco/markdown-preview.nvim" },
  { 'echasnovski/mini.files', event = "VeryLazy", config = function() require("mini.files").setup() end },
}
