return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    version = "*",
    init = function()
      require("toggleterm").setup({
        open_mapping = [[<c-/>]],
        direction = "float",
      })
    end,
}
