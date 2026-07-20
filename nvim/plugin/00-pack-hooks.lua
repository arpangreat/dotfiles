require("core.blink_build").setup()

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
			return
		end

		if ev.data.spec.name ~= "nvim-treesitter" then
			return
		end

		if not ev.data.active then
			vim.cmd.packadd("nvim-treesitter")
		end

		vim.schedule(function()
			vim.cmd.TSUpdate()
		end)
	end,
})
