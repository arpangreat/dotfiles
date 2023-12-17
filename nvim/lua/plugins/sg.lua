return {
  "sourcegraph/sg.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  build = "nvim -l build/init.lua"
}
