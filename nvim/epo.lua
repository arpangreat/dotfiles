return {
  "nvimdev/epo.nvim",
  event = "InsertEnter",
  config = function()
    require("epo").setup({
      fuzzy = true,
      debounce = 0,
      signature = true,
      -- snippet_path = nil,
      -- signature_border = "rounded",

      -- kind_format = function(k)
      -- 	return k:lower():sub(1, 1)
      -- end,
    })
  end,
}
