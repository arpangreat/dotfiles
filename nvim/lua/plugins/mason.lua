local M = {}

function M.setup()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

M.spec = {
	src = "mason-org/mason.nvim",
	setup = false,
	on_setup = M.setup,
}

return M
