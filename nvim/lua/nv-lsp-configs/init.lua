-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

vim.cmd("let g:rustfmt_autosave = 1")

vim.cmd("let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']")
require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.vuels.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.zls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.bashls.setup{ on_attach=require'completion'.on_attach }
--  require'lspconfig'.ghcide.setup{ on_attach=require'completion'.on_attach }
--  require'lspconfig'.sumneko_.setup{ on_attach=require'completion'.on_attach }
--  require'lspconfig'.rls.setup{ on_attach=require'completion'.on_attach }
-- vim.cmd("let g:LanguageClient_serverCommands = {
--             \ 'typescript': ['typescript-language-server', '--stdio', '--tsserver-path', 'node_modules/.bin/tsserver'],
--             \ }")
require'lspconfig'.vimls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.cssls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.dockerls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.graphql.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.hls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- Java Setup

require'lspconfig'.jdtls.setup{ on_attach=require'completion'.on_attach }

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
