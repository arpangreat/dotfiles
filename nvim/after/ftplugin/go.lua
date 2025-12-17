vim.api.nvim_create_user_command("GoModernize", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(bufnr)

	if filepath == "" or not filepath:match("%.go$") then
		vim.notify("Not a Go file or buffer has no file path", vim.log.levels.ERROR)
		return
	end

	-- Check if buffer is modified
	if vim.api.nvim_buf_get_option(bufnr, "modified") then
		vim.cmd("silent write")
	end

	local cmd = {
		"go",
		"run",
		"golang.org/x/tools/gopls/internal/analysis/modernize/cmd/modernize@latest",
		"-fix",
		filepath,
	}

	vim.notify("GoModernize: running...", vim.log.levels.INFO)

	vim.system(cmd, { text = true }, function(result)
		vim.schedule(function()
			if result.code == 0 then
				-- Reload the buffer
				vim.cmd("checktime")

				-- Better message handling
				local msg = vim.trim(result.stderr or result.stdout or "")
				if msg ~= "" then
					vim.notify("GoModernize: " .. msg, vim.log.levels.INFO)
				else
					vim.notify("GoModernize: completed successfully", vim.log.levels.INFO)
				end
			else
				local err = vim.trim(result.stderr or result.stdout or "Unknown error")
				vim.notify("GoModernize failed:\n" .. err, vim.log.levels.ERROR)
			end
		end)
	end)
end, { desc = "Run gopls modernize -fix on current Go file" })
