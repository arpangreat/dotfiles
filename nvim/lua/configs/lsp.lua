-- Diagnostic configuration
vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
		severity = { min = vim.diagnostic.severity.ERROR },
	},
	virtual_text = {
		severity = {
			max = vim.diagnostic.severity.WARN,
		},
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
	update_in_insert = true,
	undercurl = true,
	float = {
		scope = "line",
		border = "single",
	},
	on_jump = {
		float = true,
	},
})

-- Disable semantic tokens entirely
vim.lsp.semantic_tokens.enable(false)

-- Set initial capabilities (without blink or semantic tokens)
local caps = require("configs.config").get_capabilities()
caps.semanticTokens = vim.NIL
vim.lsp.config("*", {
	capabilities = caps,
})

-- Lazy-load LSP servers on first buffer
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

-- Update capabilities when blink loads
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	once = true,
	callback = function()
		-- Update capabilities config for future servers
		local blink_caps = require("blink.cmp").get_lsp_capabilities(nil, true)
		vim.lsp.config("*", { capabilities = blink_caps })

		-- Update already-running clients' capabilities
		for _, client in ipairs(vim.lsp.get_clients()) do
			client.config.capabilities = vim.tbl_deep_extend("force", client.config.capabilities or {}, blink_caps)
		end
	end,
})
