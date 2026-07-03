vim.loader.enable(true)

require("core.settings")
require("core.legacy")
require("core.mappings")
require("user.autocommands")
require("statusline")
require("configs.config")
require("configs.lsp")

pcall(vim.cmd.packadd, "nvim.undotree")
pcall(vim.cmd.packadd, "nvim.difftool")
require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = "msg",
	},
})
