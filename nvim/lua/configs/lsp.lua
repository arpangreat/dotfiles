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
		format = function(counts)
			local icons = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.INFO] = " ",
				[vim.diagnostic.severity.HINT] = " ",
			}

			local parts = {}

			for severity = 1, 4 do
				local count = counts[severity]
				if count and count > 0 then
					parts[#parts + 1] = icons[severity] .. count
				end
			end

			return table.concat(parts, " ")
		end,
	},
	update_in_insert = false, -- Avoids re-rendering diagnostics on every keystroke
	undercurl = true,
	float = {
		scope = "line",
		border = "single",
	},
	on_jump = {
		float = true,
	},
})

-- Defer LSP server discovery and enablement.
-- Using a timer ensures the UI is fully rendered before we do filesystem I/O
-- (scanning lsp/*.lua files) and require() all server configs.
local timer = vim.uv.new_timer()
timer:start(
	0,
	0,
	vim.schedule_wrap(function()
		timer:close()

		local servers = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
			:map(function(file)
				return vim.fn.fnamemodify(file, ":t:r")
			end)
			:totable()

		local capabilities =
			require("blink.cmp").get_lsp_capabilities(require("configs.config").get_capabilities(), true)

		for _, server in ipairs(servers) do
			local ok, config = pcall(require, "lsp." .. server)
			if ok and config then
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				vim.lsp.config(server, config)
			end
		end

		vim.lsp.enable(servers)
	end)
)
