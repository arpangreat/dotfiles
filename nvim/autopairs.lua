return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    init = function()
      require("nvim-autopairs").setup({
        enable_check_bracket_line = true,
        fast_wrap = {},
      })
    end,
}
