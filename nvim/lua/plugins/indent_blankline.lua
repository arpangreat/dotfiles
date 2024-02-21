return {
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPost",
    opts = {},
    config = function()
      require("mini.indentscope").setup({
      })
    end,
  },
}
