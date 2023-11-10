return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  branch = "main",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  }
}
