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

require("lazy").setup({ { import = "plugins" } }, {
	defaults = { lazy = true },
	install = { colorscheme = { "catppuccin" } },
	checker = { enabled = false },
	change_detection = {
		enabled = true,
		notify = true,
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
			disabled_plugins = {
				"netrw",
				"matchit",
				"netrwPlugin",
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"matchparen",
				"matchpairs",
			},
		},
	},
	debug = false,
	ui = {
		border = "single",
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("core.mappings")
	end,
})
