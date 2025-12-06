vim.loader.enable(true)

vim.cmd([[syntax off]])
require("core.settings")
require("core.lazy")
require("statusline")
require("user.autocommands")
require("configs.lsp")
