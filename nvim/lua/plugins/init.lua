return {
  "nvim-tree/nvim-web-devicons",
  "sindrets/diffview.nvim",
  "rhysd/committia.vim",
  {
    "uga-rosa/ccc.nvim",
    init = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
  "dart-lang/dart-vim-plugin",
  {
    "akinsho/flutter-tools.nvim",
    init = function()
      require("flutter-tools").setup({
        experimental = {
          lsp_derive_paths = true,
        },
        widget_guides = {
          enabled = true,
        },
      })
    end,
  },
  "ThePrimeagen/harpoon",
  {"simnalamburt/vim-mundo", event = "VeryLazy"},
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    config = function()
      require("mini.files").setup()
    end,
  },
  {
    "echasnovski/mini.cursorword",
    event = "VeryLazy",
    config = function()
      require("mini.cursorword").setup()
    end,
  },
  { "WhoIsSethDaniel/lualine-lsp-progress.nvim", event = "VeryLazy" },
}
