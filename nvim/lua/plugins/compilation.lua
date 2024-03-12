return {
  "ej-shafran/compile-mode.nvim",
  event = "VeryLazy",
  -- branch = "latest",
  -- or a specific version:
  -- tag = "v2.0.0"
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "m00qek/baleia.nvim", tag = "v1.3.0" },
  },
  opts = {
    -- you can disable colors by uncommenting this line
    -- no_baleia_support = true,
    default_command = "",
  },
}
