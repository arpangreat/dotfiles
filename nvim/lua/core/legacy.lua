for _, plugin in ipairs({
	"netrw",
	"netrwPlugin",
	"gzip",
	"tarPlugin",
	"tohtml",
	"tutor",
	"zipPlugin",
	"syntax",
	"Syntax",
}) do
	vim.g["loaded_" .. plugin] = 1
end

vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_2html_plugin = 1

pcall(vim.cmd.packadd, "nvim.undotree")
pcall(vim.cmd.packadd, "nvim.difftool")

vim.api.nvim_create_user_command("Lazy", function()
	vim.cmd.packupdate()
end, { desc = "Open the built-in plugin manager" })

require("vim._core.ui2").enable({
	enabled = true,
	msg = {
		targets = "msg",
	},
})
