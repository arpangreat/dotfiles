local function gh(repo)
	return "https://github.com/" .. repo
end

local function plugin(repo, version, opts)
	local spec = {
		src = gh(repo),
		name = repo:match("[^/]+$"),
	}

	if version ~= nil then
		spec.version = version
	end

	return vim.tbl_extend("force", spec, opts or {})
end

local M = {
	specs = {
		plugin("nvim-mini/mini.icons", "e56797f90192d81f1fda02e662fc3e8e3d775027"),
		plugin("nvim-mini/mini.hipatterns", "607d604e650cdf21d71f863d040c496a1d0cb320"),
		plugin("windwp/nvim-autopairs", "7b9923abad60b903ece7c52940e1321d39eccc79"),
		plugin("saghen/blink.lib", "5876dd95deeb70aadbe9f1c0b7117a135061cdac"),
		plugin("rafamadriz/friendly-snippets", "6cd7280adead7f586db6fccbd15d2cac7e2188b9"),
		plugin("saghen/blink.cmp", "bda905a4bf1b3edfa708b0be193b8c63d8620c96"),
		plugin("stevearc/conform.nvim", "619363c30309d29ffa631e67c8183f2a72caa373"),
		plugin("j-hui/fidget.nvim", "6f793b2bcd2d35e201c09520f698bb763220908a"),
		plugin("ibhagwan/fzf-lua", "b9919229c84bd64d8539367e67e32811cf39a836"),
		plugin("roginfarrer/fzf-lua-lazy.nvim", "e813f5df261ff5b781204c108af8f071bf0e1b00"),
		plugin("echasnovski/mini.diff", "0743d26bd858ebe32efcf5c86a91a422a000f273"),
		plugin("mason-org/mason.nvim", "2a6940af80375532e5e9e7c1f2fc6319a1b7a69d"),
		plugin("kawre/neotab.nvim", "e99d3e28c5a2066d2d368dfe4ef3827c8d75d337"),
		plugin("christoomey/vim-tmux-navigator", "e41c431a0c7b7388ae7ba341f01a0d217eb3a432"),
		plugin("folke/tokyonight.nvim", "cdc07ac78467a233fd62c493de29a17e0cf2b2b6"),
		plugin("romus204/tree-sitter-manager.nvim"),
		plugin("folke/trouble.nvim", "bd67efe408d4816e25e8491cc5ad4088e708a69a"),
		plugin("folke/which-key.nvim", "3aab2147e74890957785941f0c1ad87d0a44c15a"),
	},
}

function M.setup()
	local function safe_setup(name)
		local ok, mod = pcall(require, "plugins." .. name)
		if not ok then
			vim.notify(("Skipping %s: %s"):format(name, mod), vim.log.levels.WARN)
			return
		end

		if type(mod.setup) ~= "function" then
			return
		end

		local ok_setup, err = pcall(mod.setup)
		if not ok_setup then
			vim.notify(("Plugin setup failed for %s: %s"):format(name, err), vim.log.levels.WARN)
		end
	end

	safe_setup("tokyonight")
	safe_setup("autopairs")
	safe_setup("blink")
	safe_setup("conform")
	safe_setup("fidget")
	safe_setup("fzflazy")
	safe_setup("gitsigns")
	safe_setup("mason")
	safe_setup("neotab")
	safe_setup("treesitter")
	safe_setup("trouble")
	safe_setup("tmux")
	safe_setup("whichkey")

	local hi = require("mini.hipatterns")
	hi.setup({
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
		},
	})
end

return M
