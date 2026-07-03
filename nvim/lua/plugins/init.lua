local function gh(repo)
	return "https://github.com/" .. repo
end

local function plugin(repo)
	return {
		src = gh(repo),
		name = repo:match("[^/]+$"),
	}
end

local M = {
	specs = {
		plugin("nvim-mini/mini.icons"),
		plugin("nvim-mini/mini.hipatterns"),
		plugin("windwp/nvim-autopairs"),
		plugin("saghen/blink.lib"),
		plugin("rafamadriz/friendly-snippets"),
		plugin("saghen/blink.cmp"),
		plugin("stevearc/conform.nvim"),
		plugin("ibhagwan/fzf-lua"),
		plugin("roginfarrer/fzf-lua-lazy.nvim"),
		plugin("echasnovski/mini.diff"),
		plugin("mason-org/mason.nvim"),
		plugin("kawre/neotab.nvim"),
		plugin("christoomey/vim-tmux-navigator"),
		plugin("folke/tokyonight.nvim"),
		plugin("romus204/tree-sitter-manager.nvim"),
		plugin("folke/trouble.nvim"),
		plugin("folke/which-key.nvim"),
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

	safe_setup("autopairs")
	safe_setup("blink")
	safe_setup("conform")
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
