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
