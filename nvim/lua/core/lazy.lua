local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = false },
	change_detection = {
		enabled = true,
		notify = true,
	},
	spec = {
		{ import = "plugins" },
	},
	profiling = {
		loader = true,
		require = true,
	},
	performance = {
		cache = {
			enable = true,
		},
		rtp = {
			disabled_plugin = {
				"netrw",
				"matchit",
				"netrwPlugin",
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	debug = false,
	-- ui = {
	-- 	border = "single",
	-- },
})

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("core.mappings")
	end,
})
