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

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end

	require("aerial").on_attach(client, bufnr)
	require("lsp-inlayhints").on_attach(client, bufnr)
end

--Enable (broadcasting) snippet capability for completion
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
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

--[[ -- define signcolumn lsp diagnostic icons
local diagnostic_signs = { " ", " ", "", " " }
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
end ]]

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- Could be '●', '▎', 'x'
	},
	signs = { active = signs },
	update_in_insert = true,
	undercurl = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd("let g:rustfmt_autosave = 1")

-- vim.cmd("let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']")
require("lspconfig").tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").vuels.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").clangd.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	-- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig").dotls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").bashls.setup({ on_attach = on_attach })
require("lspconfig").ocamlls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").vimls.setup({ on_attach = on_attach })
require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").dockerls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").graphql.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").hls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").jsonls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").yamlls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
-- require("lspconfig").phpactor.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").dartls.setup({ on_attach = on_attach, capabilities = capabilities })
-- require('sg.lsp').setup{ on_attach = on_attach, capabilities = capabilities }
-- require("lspconfig").r_language_server.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
require("lspconfig").zls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").csharp_ls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").taplo.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").grammarly.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").astro.setup({ on_attach = on_attach, capabilities = capabilities })

-- Perl Setup
--[[ local perlconfig = {
	cmd = { "/usr/bin/pls" }, -- complete path to where pls is located
	settings = {
		perl = {
			-- inc = { "/my/perl/5.34/lib", "/some/other/perl/lib" }, -- add list of dirs to @inc
			cwd = { "/home/arpangreat/perl-examples/" }, -- working directory for pls
			-- perlcritic = { enabled = true, perlcriticrc = "/my/projects/.perlcriticrc" }, -- use perlcritic and pass a non-default location for its config
			syntax = { enabled = true, perl = "/usr/bin/perl" }, -- enable syntax checking and use a non-default perl binary
			-- perltidyrc = "/my/projects/.perltidyrc", -- non-default location for perltidy's config
		},
	},
} ]]
-- require("lspconfig").perlpls.setup({ on_attach = on_attach, capabilities = capabilities, perlconfig })
require("lspconfig").perlnavigator.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").ols.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").nimls.setup({ on_attach = on_attach, capabilities = capabilities })
require("lspconfig").kotlin_language_server.setup({ on_attach = on_attach, capabilities = capabilities })

-- Java Setup

-- require("lspconfig").lemmy_help.setup({ on_attach = on_attach, capabilities = capabilities })
require("mason-lspconfig").setup()
-- require("lspconfig").java_language_server.setup({ cmd = {"java-language-server"}, on_attach = on_attach, capabilities = capabilities })

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = "/path/to/workspace-root/" .. project_name

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		"java", -- or '/path/to/java11_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		"/home/arpangreat/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		"-configuration",
		"/home/arpangreat/.local/share/nvim/lsp_servers/jdtls/config_linux",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	-- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {},
	},
}

require("lspconfig").jdtls.setup({ config, on_attach = on_attach, capabilities = capabilities })
