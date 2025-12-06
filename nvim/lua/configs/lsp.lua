vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarnMsg",
			[vim.diagnostic.severity.HINT] = "HintMsg",
			[vim.diagnostic.severity.INFO] = "InfoMsg",
		},
	},
	status = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	update_in_insert = false,
	undercurl = true,
	float = {
		scope = "line",
		border = "single",
	},
	on_jump = {
		float = true,
	},
})

vim.lsp.config("*", {
	capabilities = require("configs.config").get_capabilities(),
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	once = true,
	callback = function()
		local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
			:map(function(file)
				return vim.fn.fnamemodify(file, ":t:r")
			end)
			:totable()

		-- Load and configure each server
		for _, server in ipairs(servers) do
			local ok, config = pcall(require, "lsp." .. server)
			if ok and config then
				vim.lsp.config(server, config)
			end
		end

		vim.lsp.enable(servers)
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	once = true,
	callback = function()
		-- Extend neovim's client capabilities with the completion ones after blink loads.
		vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities(nil, true) })
	end,
})
