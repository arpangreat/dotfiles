--local execute = vim.api.nvim_command
--local fn = vim.fn
--
--local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--
--if fn.empty(fn.glob(install_path)) > 0 then
--  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
-- execute 'packadd packer.nvim'
--end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		-- Lazy loading:
		-- Load on specific commands
		use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
		use("mfussenegger/nvim-dap")
		use("jbyuki/one-small-step-for-vimkind")
		use("theHamsta/nvim-dap-virtual-text")
		use("leoluz/nvim-dap-go")
		use("mfussenegger/nvim-dap-python")
		use("rcarriga/nvim-dap-ui")
		use("nvim-telescope/telescope-dap.nvim")
		use({ "edluffy/specs.nvim" })
		use("lewis6991/impatient.nvim")
		use("github/copilot.vim")
		use({
			"anuvyklack/hydra.nvim",
			requires = "anuvyklack/keymap-layer.nvim", -- needed only for pink hydras
		})
		use({
			"rmagatti/auto-session",
			config = function()
				require("auto-session").setup({
					auto_session_enabled = false,
				})
			end,
		})
		use("tamton-aquib/duck.nvim")
		use("SmiteshP/nvim-navic")
		use("SmiteshP/nvim-gps")
		use("ghillb/cybu.nvim")
		use({
			"abecodes/tabout.nvim",
			wants = { "nvim-treesitter" }, -- or require if not used so far
			after = { "nvim-cmp" },
		})
		-- use("jinh0/eyeliner.nvim")
		use("unblevable/quick-scope")
		use("kylechui/nvim-surround")
		use("stevearc/aerial.nvim")
		use("is0n/jaq-nvim")
		use("rafcamlet/nvim-luapad")

		use({
			"gorbit99/codewindow.nvim",
			config = function()
				local codewindow = require("codewindow")
				codewindow.setup()
				codewindow.apply_default_keybinds()
			end,
		})

		use({
			"mrshmllow/document-color.nvim",
			config = function()
				require("document-color").setup({
					-- Default options
					mode = "foreground", -- "background" | "foreground" | "single"
				})
			end,
		})

		use("weilbith/nvim-code-action-menu")
		use("kevinhwang91/rnvimr")

		use({
			"anuvyklack/windows.nvim",
			requires = {
				"anuvyklack/middleclass",
				"anuvyklack/animation.nvim",
			},
			config = function()
				vim.o.winwidth = 10
				vim.o.winminwidth = 10
				vim.o.equalalways = false
				require("windows").setup()
			end,
		})

		-- Also run code after load (see the "config" key)

		-- Local plugins can be included
		-- use '~/projects/personal/hover.nvim'

		-- Plugins can have post-install/update hooks
		-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

		-- Post-install/update hook with neovim command
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("nvim-treesitter/nvim-treesitter-textobjects")

		-- Post-install/update hook with call of vimscript function with argument
		-- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

		-- Use specific branch, dependency and run lua file after load
		--[[ use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons" },
	}) ]]
		-- use("NTBBloodbath/galaxyline.nvim")
		use({
			"nvim-lualine/lualine.nvim",
		})
		use("arkav/lualine-lsp-progress")

		use("kyazdani42/nvim-web-devicons")

		-- Use dependency and run lua function after load
		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		--[[ use({
			"folke/noice.nvim",
			event = "VimEnter",
			config = function()
				require("noice").setup()
			end,
			requires = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			},
		}) ]]

		--[[ use({
			"narutoxy/dim.lua",
			config = function()
				require("dim").setup({
					disable_lsp_decorations = false,
				})
			end,
		}) ]]
		use("mfussenegger/nvim-jdtls")

		-- You can specify multiple plugins in a single call
		use({ "tjdevries/colorbuddy.vim" })

		use("windwp/nvim-autopairs")
		-- use 'jiangmiao/auto-pairs'
		use("tpope/vim-fugitive")
		use("ldelossa/gh.nvim")
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		use("sindrets/diffview.nvim")
		use("rhysd/committia.vim")
		use("junegunn/fzf")
		use("junegunn/fzf.vim")
		-- use("airblade/vim-gitgutter")
		-- use 'preservim/nerdcommenter'
		use("b3nj5m1n/kommentary")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use({
			"numToStr/Comment.nvim",
		})

		use({
			"mvllow/modes.nvim",
			config = function()
				vim.opt.cursorline = true
				require("modes").setup()
			end,
		})
		use("folke/todo-comments.nvim")
		-- use '/home/arpangreat/todo-comments.nvim'
		use("lukas-reineke/indent-blankline.nvim")
		use("Darazaki/indent-o-matic")
		use("sainnhe/tmuxline.vim")
		-- use("vimpostor/vim-tpipeline")
		use("p00f/nvim-ts-rainbow")
		use({
			"tversteeg/registers.nvim",
			config = function()
				require("registers").setup()
			end,
		})
		-- use 'glepnir/indent-guides.nvim'

		-- Colorscheme
		use("tjdevries/gruvbuddy.nvim")
		use("Yagua/nebulous.nvim")
		use("marko-cerovac/material.nvim")
		use("norcalli/nvim-colorizer.lua")
		use("folke/tokyonight.nvim")
		use({
			"catppuccin/nvim",
			as = "catppuccin",
		})
		-- use({ "~/nvim", as = "catppuccin" })
		use("EdenEast/nightfox.nvim")
		use("bluz71/vim-nightfly-guicolors")
		use("rebelot/kanagawa.nvim")
		use({ "themercorp/themer.lua" })
		use("sainnhe/gruvbox-material")
		-- Packer
		use("olimorris/onedarkpro.nvim")
		use("tamago324/lir.nvim")
		-- use("dylanaraps/wal.vim")

		-- Language specific
		-- use 'tpope/vim-surround'
		use("tpope/vim-sleuth")
		use("neovim/nvim-lspconfig")
		-- LSP Extensions
		-- use("nvim-lua/lsp_extensions.nvim")
		-- use("tami5/lspsaga.nvim")
		use("onsails/lspkind-nvim")
		-- use("nvim-lua/completion-nvim")
		--[[ use 'steelsojka/completion-buffers'
  use 'nvim-treesitter/completion-treesitter'
  use 'albertoCaroM/completion-tmux' ]]
		use("nvim-lua/popup.nvim")
		-- use("beauwilliams/focus.nvim")
		use("mrjones2014/smart-splits.nvim")
		use("sindrets/winshift.nvim")
		use("jlanzarotta/bufexplorer")
		use("norcalli/nvim_utils")
		use("windwp/nvim-ts-autotag")
		-- use("anott03/nvim-lspinstall")
		use("dart-lang/dart-vim-plugin")
		-- use 'hrsh7th/nvim-compe'
		use({
			"hrsh7th/nvim-cmp",
			requires = {
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
				{ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" },
				-- "hrsh7th/cmp-copilot",
			},
		})
		use("alaviss/nim.nvim")
		use("p00f/clangd_extensions.nvim")
		use("ibhagwan/fzf-lua")
		-- use("kyazdani42/nvim-tree.lua")
		use({ "nvim-neo-tree/neo-tree.nvim", version = "v2.x" })
		use("MunifTanjim/nui.nvim")
		use({ "Shougo/defx.nvim", run = ":UpdateRemotePlugins" })

		-- Vim Only
		use("nvim-treesitter/playground")
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			},
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use("nvim-telescope/telescope-github.nvim")
		use("nvim-telescope/telescope-frecency.nvim")
		use("nvim-telescope/telescope-symbols.nvim")
		use("nvim-telescope/telescope-z.nvim")
		use("tami5/sql.nvim")
		use("nvim-telescope/telescope-media-files.nvim")
		use({ "nvim-telescope/telescope-file-browser.nvim" })
		use({
			"nvim-telescope/telescope-arecibo.nvim",
			rocks = { "openssl", "lua-http-parser" },
		})
		use({ "nvim-telescope/telescope-ui-select.nvim" })
		use("jvgrootveld/telescope-zoxide")
		use("lukaspietzschmann/telescope-tabs")
		use("christianchiarulli/harpoon")
		use("tjdevries/nlua.nvim")
		use("stevearc/dressing.nvim")
		-- use("tjdevries/lsp_extensions.nvim")
		-- use("ray-x/lsp_signature.nvim")
		-- use("tjdevries/cyclist.vim")
		use("norcalli/snippets.nvim")
		use("L3MON4D3/LuaSnip")
		use("hrsh7th/vim-vsnip")
		use("hrsh7th/vim-vsnip-integ")
		use("rafamadriz/friendly-snippets")
		-- use("ryanoasis/vim-devicons")
		use("rust-lang/rust.vim")
		use("ziglang/zig.vim")
		use("simrat39/rust-tools.nvim")
		use("Tetralux/odin.vim")
		use("scalameta/nvim-metals")
		use("glepnir/dashboard-nvim")
		-- use("akinsho/nvim-bufferline.lua")
		-- use("romgrk/barbar.nvim")
		use("j-hui/fidget.nvim")

		use("renerocksai/telekasten.nvim")
		use("renerocksai/calendar-vim")
		-- use 'kshenoy/vim-signature'
		-- use 'tpope/vim-git'
		-- use("liuchengxu/vim-which-key")
		use("folke/which-key.nvim")
		-- use 'SirVer/ultisnips'
		use("honza/vim-snippets")
		-- use("mbbill/undotree")
		use("simnalamburt/vim-mundo")
		-- use 'christoomey/vim-tmux-navigator'
		-- use("voldikss/vim-floaterm")
		-- use("tjdevries/sg.nvim")
		-- use 'mhartington/formatter.nvim'
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("toggleterm").setup({
					open_mapping = [[<c-/>]],
					direction = "float",
				})
			end,
		})
		use("ckipp01/stylua-nvim")
		use("rcarriga/nvim-notify")
		use("jose-elias-alvarez/null-ls.nvim")

		-- My Plugins
		use("arpangreat/treesitter-unit-plugin")
		use("arpangreat/statusfire.nvim")
		use("tjdevries/express_line.nvim")
		use({ "williamboman/mason.nvim", branch = "main" })
		use({ "williamboman/mason-lspconfig.nvim" })
		-- use("williamboman/nvim-lsp-installer")
		-- use({ "/home/arpangreat/catppnv/", as = "catppuccin" })
		-- use({ "/home/arpangreat/onedarker.nvim-master/", as = "onedarker" })
		-- use({ "/home/arpangreat/lsp-inlayhints.nvim-main/", as = "lsp-inlayhints" })
		use({ "lvimuser/lsp-inlayhints.nvim" })
		use("lunarvim/synthwave84.nvim")
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup()
			end,
		})

		use({ "shaunsingh/oxocarbon.nvim", run = "./install.sh" })

		--[[ use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
		}) ]]

		use({
			"krady21/compiler-explorer.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})

		use("RRethy/vim-illuminate")
		use({ "iamcco/markdown-preview.nvim" })

		-- Lua
		-- use("/home/arpangreat/orangide.nvim")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})