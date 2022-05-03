vim.lsp.set_log_level("debug")

-- nvim_lsp object
local nvim_lsp = require("lspconfig")
local protocol = require("vim.lsp.protocol")

local lsp_highlight_document = function(client)
	-- Set Autocommands conditional on server capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			true
		)
	end
end

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	-- formatting
	if client.server_capabilities.document_formatting then
		vim.api.nvim_exec(
			[[augroup Format
     autocmd! * <buffer>
     autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
     augroup END]],
			true
		)
	end

	lsp_highlight_document(client)
	-- require'completion'.on_attach(client, bufnr)

	--protocol.SymbolKind = { }
	protocol.CompletionItemKind = {
		"", -- Text
		"", -- Method
		"", -- Function
		"", -- Constructor
		"", -- Field
		"", -- Variable
		"", -- Class
		"ﰮ", -- Interface
		"", -- Module
		"", -- Property
		"", -- Unit
		"", -- Value
		"", -- Enum
		"", -- Keyword
		"﬌", -- Snippet
		"", -- Color
		"", -- File
		"", -- Reference
		"", -- Folder
		"", -- EnumMember
		"", -- Constant
		"", -- Struct
		"", -- Event
		"ﬦ", -- Operator
		"", -- TypeParameter
	}
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.codeAction = {
	dynamicRegistration = true,
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = (function()
				local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
				table.sort(res)
				return res
			end)(),
		},
	},
}

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable rust_analyzer
--[[ nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "by_self",
			},
			cargo = { loadOutDirsFromCheck = true },
			procMacro = { enable = true },
			checkOnSave = {
				command = "clippy",
			},
			inlayHints = true,
		},
	},
})

vim.api.nvim_exec(
	"autocmd CursorMoved,InsertLeave,TabEnter,BufWritePost *.rs lua require'lsp_extensions'.inlay_hints{ prefix = '<- ', highlight = 'Comment', enabled = {'TypeHint', 'ChainingHint', 'ParameterHint', 'closureReturnTypeHints', 'lifetimeElisionHints', 'reborrowHints'}}",
	true
)
 ]]
-- Enable diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- Could be '●', '▎', 'x'
	},
	signs = true,
	update_in_insert = true,
	undercurl = true,
})

-- define signcolumn lsp diagnostic icons
local diagnostic_signs = { " ", " ", " ", " " }
local diagnostic_severity_fullnames = { "Error", "Warning", "Hint", "Information" }
local diagnostic_severity_shortnames = { "Error", "Warn", "Hint", "Info" }

-- define diagnostic icons/highlights for signcolumn and other stuff
for index, icon in ipairs(diagnostic_signs) do
	local fullname = diagnostic_severity_fullnames[index]
	local shortname = diagnostic_severity_shortnames[index]

	vim.fn.sign_define("DiagnosticSign" .. shortname, {
		text = icon,
		texthl = "Diagnostic" .. shortname,
		linehl = "",
		numhl = "",
	})

	vim.fn.sign_define("LspDiagnosticsSign" .. fullname, {
		text = icon,
		texthl = "LspDiagnosticsSign" .. fullname,
		linehl = "",
		numhl = "",
	})
end

vim.cmd("let g:rustfmt_autosave = 1")

-- vim.cmd("let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']")
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").vuels.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").clangd.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").gopls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").zls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").bashls.setup({ on_attach = on_attach })
require("lspconfig").ocamlls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").vimls.setup({ on_attach = on_attach })
require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").dockerls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").graphql.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").hls.setup({ on_attach = on_attach, capabilities = capabilities })
-- require'lspconfig'.jsonls.setup{ on_attach = on_attach, capabilities = capabilities }
require("lspconfig").yamlls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").phpactor.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").dartls.setup({ on_attach = on_attach, capabilities = capabilities })
-- require('sg.lsp').setup{ on_attach = on_attach, capabilities = capabilities }
require("lspconfig").r_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Perl Setup
local perlconfig = {
	cmd = { "/opt/bin/pls" }, -- complete path to where PLS is located
	settings = {
		perl = {
			inc = { "/my/perl/5.34/lib", "/some/other/perl/lib" }, -- add list of dirs to @INC
			cwd = { "/home/arpangreat/perl-examples/" }, -- working directory for PLS
			-- perlcritic = { enabled = true, perlcriticrc = "/my/projects/.perlcriticrc" }, -- use perlcritic and pass a non-default location for its config
			syntax = { enabled = true, perl = "/usr/bin/perl" }, -- enable syntax checking and use a non-default perl binary
			-- perltidyrc = "/my/projects/.perltidyrc", -- non-default location for perltidy's config
		},
	},
}
require("lspconfig").perlpls.setup({ on_attach = on_attach, capabilities = capabilities, perlconfig })

-- Java Setup

require("lspconfig").jdtls.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").java_language_server.setup({ cmd = {"java-language-server"}, on_attach = on_attach, capabilities = capabilities })

-- Commands:
--
-- Default Values:
--   cmd = { "/usr/lib/jvm/adoptopenjdk-11-hotspot-amd64/bin/java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.ls.core.product", "-Dlog.protocol=true", "-Dlog.level=ALL", "-Xms1g", "-Xmx2G", "-jar", "vim.NIL", "-configuration", "vim.NIL", "-data", "vim.NIL", "--add-modules=ALL-SYSTEM", "--add-opens java.base/java.util=ALL-UNNAMED", "--add-opens java.base/java.lang=ALL-UNNAMED" }
--   cmd_env = {
--     GRADLE_HOME = "/usr/share/gradle",
--     JAR = vim.NIL
--   }
--   filetypes = { "java" }
--   handlers = {
--     ["language/status"] = <function 1>,
--     ["textDocument/codeAction"] = <function 2>
--   }
--   init_options = {
--     jvm_args = {},
--     workspace = "/home/runner/workspace"
--   }
--   root_dir = root_pattern(".git")
