-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""
local protocol = require('vim.lsp.protocol')

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/dotfiles/nvim/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/dotfiles/nvim/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/dotfiles/nvim/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/dotfiles/nvim/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[augroup Format
     autocmd! * <buffer>
     autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
     augroup END]], true)
  end


  -- require'completion'.on_attach(client, bufnr)

   --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = {
        enable = true,
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          ["${3rd}/love2d/library"] = true},
        maxPreload = 2000,
        checkThirdParty = false,
      },
    },
  },
    on_attach = on_attach,
    capabilities = capabilities,
}
