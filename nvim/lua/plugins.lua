return {
	{ "tpope/vim-dispatch", lazy = true, cmd = { "Dispatch", "Make", "Focus", "Start" } },
	"mfussenegger/nvim-dap",
	"jbyuki/one-small-step-for-vimkind",
	"theHamsta/nvim-dap-virtual-text",
	"leoluz/nvim-dap-go",
	"mfussenegger/nvim-dap-python",
	"rcarriga/nvim-dap-ui",
	"nvim-telescope/telescope-dap.nvim",
	{ "edluffy/specs.nvim" },
	"lewis6991/impatient.nvim",
	{
		"anuvyklack/hydra.nvim",
		dependencies = "anuvyklack/keymap-layer.nvim", -- needed only for pink hydras
	},
	{
		"rmagatti/auto-session",
		init = function()
			require("auto-session").setup({
				auto_session_enabled = false,
			})
		end,
	},
	"tamton-aquib/duck.nvim",
	"SmiteshP/nvim-navic",
	"SmiteshP/nvim-gps",
	"ghillb/cybu.nvim",
	{ "echasnovski/mini.nvim", version = false },
	{
		"abecodes/tabout.nvim",
	},
	-- "jinh0/eyeliner.nvim",
	"unblevable/quick-scope",
	"kylechui/nvim-surround",
	"stevearc/aerial.nvim",
	"is0n/jaq-nvim",
	"rafcamlet/nvim-luapad",

	--		{
	--			"gorbit99/codewindow.nvim",
	--			init = function()
	--				local codewindow = require"codewindow"
	--				codewindow.setup,
	--				codewindow.apply_default_keybinds,
	--			end,
	--		},

	{
		"mrshmllow/document-color.nvim",
		init = function()
			require("document-color").setup({
				-- Default options
				mode = "foreground", -- "background" | "foreground" | "single"
			})
		end,
	},

	{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
	"kevinhwang91/rnvimr",

	-- {
	-- 	"anuvyklack/windows.nvim",
	-- 	dependencies = {
	-- 		"anuvyklack/middleclass",
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- 	init = function()
	-- 		vim.o.winwidth = 10
	-- 		vim.o.winminwidth = 10
	-- 		vim.o.equalalways = false
	-- 		require("windows").setup()
	-- 	end,
	-- },

	-- Also run code after load see the "config" key,

	-- Local plugins can be included
	--  '~/projects/personal/hover.nvim'

	-- Plugins can have post-install/update hooks

	-- Post-install/update hook with neovim command
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "nvim-treesitter/playground" },
	},

	-- Post-install/update hook with call of vimscript function with argument
	--  { 'glacambre/firenvim', run = function, vim.fn['firenvim#install']0, end }

	--  specific branch, dependency and run lua file after load
	--[[ {
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons" },
	}, ]]
	-- "NTBBloodbath/galaxyline.nvim",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "arkav/lualine-lsp-progress" },
	},
	{ "freddiehaddad/feline.nvim" },
	-- "rebelot/heirline.nvim",

	"kyazdani42/nvim-web-devicons",

	--  dependency and run lua function after load
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"folke/noice.nvim",
		event = "VimEnter",
		init = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					-- bottom_search = true, -- use a classic bottom cmdline for search
					-- command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = true, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
				views = {
					virtualtext = {
						enter = true,
					},
				},
				cmdline = {
					format = {
						cmdline = { icon = ">" },
						search_down = { icon = "🔍⌄" },
						search_up = { icon = "🔍⌃" },
						filter = { icon = "$" },
						lua = { icon = "☾" },
						help = { icon = "?" },
					},
				},
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to  the notification view.
			--   If not available, we  `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	--[[ {
			"narutoxy/dim.lua",
			config = function,
				require"dim",.setup{
					disable_lsp_decorations = false,
				},
			end,
		}, ]]
	"mfussenegger/nvim-jdtls",

	-- You can specify multiple plugins in a single call
	{ "tjdevries/colorbuddy.vim" },

	"windwp/nvim-autopairs",
	--  'jiangmiao/auto-pairs'
	"ldelossa/gh.nvim",
	{ "TimUntersberger/neogit", dependencies = { "nvim-lua/plenary.nvim", "rbong/vim-flog", "tpope/vim-fugitive" } },
	"sindrets/diffview.nvim",
	"rhysd/committia.vim",
	"junegunn/fzf",
	"junegunn/fzf.vim",
	-- "airblade/vim-gitgutter",
	--  'preservim/nerdcommenter'
	"b3nj5m1n/kommentary",
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"numToStr/Comment.nvim",
	},

	{
		"mvllow/modes.nvim",
		init = function()
			vim.opt.cursorline = true
			require("modes").setup()
		end,
	},
	"folke/todo-comments.nvim",
	--  '/home/arpangreat/todo-comments.nvim'
	"lukas-reineke/indent-blankline.nvim",
	"Darazaki/indent-o-matic",
	"sainnhe/tmuxline.vim",
	-- "vimpostor/vim-tpipeline",
	"HiPhish/nvim-ts-rainbow2",
	{
		"tversteeg/registers.nvim",
		init = function()
			require("registers").setup()
		end,
	},
	--  'glepnir/indent-guides.nvim'
	"tjdevries/gruvbuddy.nvim",
	"Yagua/nebulous.nvim",
	"marko-cerovac/material.nvim",
	-- "norcalli/nvim-colorizer.lua",
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
	"ray-x/starry.nvim",
	-- { "~/nvim", as = "catppuccin" },
	"EdenEast/nightfox.nvim",
	"bluz71/vim-nightfly-guicolors",
	"rebelot/kanagawa.nvim",
	{ "themercorp/themer.lua" },
	"sainnhe/gruvbox-material",
	-- Packer
	{ "olimorris/onedarkpro.nvim", priority = 1000 },
	"rafamadriz/neon",
	"tamago324/lir.nvim",
	-- "dylanaraps/wal.vim",

	-- Language specific
	--  'tpope/vim-surround'
	"tpope/vim-sleuth",
	"neovim/nvim-lspconfig",
	-- LSP Extensions
	-- "nvim-lua/lsp_extensions.nvim",
	-- "tami5/lspsaga.nvim",
	"onsails/lspkind-nvim",
	-- "nvim-lua/completion-nvim",
	--[[  'steelsojka/completion-buffers'
   'nvim-treesitter/completion-treesitter'
   'albertoCaroM/completion-tmux' ]]
	"nvim-lua/popup.nvim",
	-- "beauwilliams/focus.nvim",
	"mrjones2014/smart-splits.nvim",
	"sindrets/winshift.nvim",
	"jlanzarotta/bufexplorer",
	"norcalli/nvim_utils",
	"windwp/nvim-ts-autotag",
	-- "anott03/nvim-lspinstall",
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
	--  'hrsh7th/nvim-compe'
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
			"petertriho/cmp-git",
			"jcorbin/vim-lobster",
			"rktjmp/lush.nvim",
			{ "tzachar/cmp-tabnine", build = "./install.sh" },
			"windwp/nvim-autopairs",
			{ "L3MON4D3/LuaSnip" },
			"rafamadriz/friendly-snippets",
			{
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				event = "InsertEnter",
				config = function()
					require("copilot").setup({
						panel = {
							-- auto_refresh = true,
							enabled = false,
						},
						suggestions = {
							-- auto_trigger = true,
							enables = false,
						},
					})
				end,
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
			{ "shellRaining/hlchunk.nvim" },
			{
				"rmagatti/goto-preview",

				config = function()
					require("goto-preview").setup()
				end,
			},
			{
				"nvim-neorg/neorg",
				build = ":Neorg sync-parsers",
				dependencies = { "nvim-lua/plenary.nvim" },
				config = function()
					require("neorg").setup({
						load = {
							["core.defaults"] = {}, -- Loads default behaviour
							["core.concealer"] = {}, -- Adds pretty icons to your documents
							["core.dirman"] = { -- Manages Neorg workspaces
								config = {
									workspaces = {
										notes = "~/notes",
									},
								},
							},
						},
					})
				end,
			},
		},
	},
	"p00f/clangd_extensions.nvim",

	-- "kyazdani42/nvim-tree.lua",
	{ "nvim-neo-tree/neo-tree.nvim", version = "v2.x" },
	"MunifTanjim/nui.nvim",
	{ "Shougo/defx.nvim", build = ":UpdateRemotePlugins" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-github.nvim",
	"nvim-telescope/telescope-frecency.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	"nvim-telescope/telescope-z.nvim",
	"tami5/sql.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"nvim-telescope/telescope-arecibo.nvim",
		rocks = { "openssl", "lua-http-parser" },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	"jvgrootveld/telescope-zoxide",
	"lukaspietzschmann/telescope-tabs",
	"christianchiarulli/harpoon",
	"tjdevries/nlua.nvim",
	"stevearc/dressing.nvim",
	-- "tjdevries/lsp_extensions.nvim",
	-- "ray-x/lsp_signature.nvim",
	-- "tjdevries/cyclist.vim",
	"norcalli/snippets.nvim",
	-- "L3MON4D3/LuaSnip",
	"hrsh7th/vim-vsnip",
	"hrsh7th/vim-vsnip-integ",
	-- "rafamadriz/friendly-snippets",
	-- "ryanoasis/vim-devicons",
	"glepnir/dashboard-nvim",
	-- "akinsho/nvim-bufferline.lua",
	-- "romgrk/barbar.nvim",
	"j-hui/fidget.nvim",

	"renerocksai/telekasten.nvim",
	"renerocksai/calendar-vim",
	--  'kshenoy/vim-signature'
	--  'tpope/vim-git'
	-- "liuchengxu/vim-which-key",
	--  'SirVer/ultisnips'
	"honza/vim-snippets",
	-- "mbbill/undotree",
	"simnalamburt/vim-mundo",
	--  'christoomey/vim-tmux-navigator'
	-- "voldikss/vim-floaterm",
	-- "tjdevries/sg.nvim",
	--  'mhartington/formatter.nvim'
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
	"ckipp01/stylua-nvim",
	"rcarriga/nvim-notify",
	"jose-elias-alvarez/null-ls.nvim",

	-- My Plugins
	"arpangreat/treesitter-unit-plugin",
	"arpangreat/statusfire.nvim",
	"tjdevries/express_line.nvim",
	{ "williamboman/mason.nvim", branch = "main" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- "williamboman/nvim-lsp-installer",
	-- { "/home/arpangreat/catppnv/", as = "catppuccin" },
	-- { "/home/arpangreat/onedarker.nvim-master/", as = "onedarker" },
	-- { "/home/arpangreat/lsp-inlayhints.nvim-main/", as = "lsp-inlayhints" },
	{ "lvimuser/lsp-inlayhints.nvim" },
	"lunarvim/synthwave84.nvim",
	{
		"ahmedkhalf/project.nvim",
		init = function()
			require("project_nvim").setup()
		end,
	},

	{ "nyoom-engineering/oxocarbon.nvim" },

	--[[ {
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function,
				require"alpha",.setuprequire"alpha.themes.startify",.config,
			end,
		}, ]]

	{
		"krady21/compiler-explorer.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"RRethy/vim-illuminate",
	{ "iamcco/markdown-preview.nvim" },
}
