return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local async_formatting = function(bufnr)
			bufnr = bufnr or vim.api.nvim_get_current_buf()

			vim.lsp.buf_request(
				bufnr,
				"textDocument/formatting",
				vim.lsp.util.make_formatting_params({}),
				function(err, res, ctx)
					if err then
						local err_msg = type(err) == "string" and err or err.message
						-- you can modify the log message / level (or ignore it completely)
						vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
						return
					end

					-- don't apply results if buffer is unloaded or has been modified
					if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
						return
					end

					if res then
						local client = vim.lsp.get_client_by_id(ctx.client_id)
						vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
						vim.api.nvim_buf_call(bufnr, function()
							vim.cmd("silent noautocmd update")
						end)
					end
				end
			)
		end

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		require("null-ls").setup({
			-- add your sources / config options here
			sources = {
				require("null-ls").builtins.formatting.stylua,
				-- require("null-ls").builtins.hover.dictionary,
				-- require("null-ls").builtins.diagnostics.cpplint,
				require("null-ls").builtins.formatting.prettier,
				require("null-ls").builtins.formatting.clang_format,
				require("null-ls").builtins.formatting.ocamlformat,
				-- require("null-ls").builtins.formatting.cmakelang,
				-- require("null-ls").builtins.formatting.rustfmt,
				require("null-ls").builtins.formatting.goimports,
				-- require("null-ls").builtins.formatting.clang_format,
				-- require("null-ls").builtins.diagnostics.eslint_d,
				-- require("null-ls").builtins.completion.cspell,
				-- require("null-ls").builtins.diagnostics.golangci_lint,
				-- require("null-ls").builtins.diagnostics.revive,
				-- require("null-ls").builtins.diagnostics.shellcheck,
				require("null-ls").builtins.diagnostics.pylint,
				require("null-ls").builtins.formatting.black,
				require("null-ls").builtins.formatting.blade_formatter,
				-- require("null-ls").builtins.code_actions.shellcheck,
			},
			debug = false,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePost", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							async_formatting(bufnr)
						end,
					})
				end
			end,
		})
	end,
}
