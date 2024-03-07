return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  event = "VeryLazy",
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end
}
