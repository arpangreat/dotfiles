return {
  {
    "echasnovski/mini.indentscope",
    event = "BufEnter",
    opts = {},
    config = function()
      require("mini.indentscope").setup({
      })
    end,
  },
}
