return {
  "sontungexpt/sttusline",
  branch = "table_version",
  event = { "BufEnter" },
  config = function()
    require("sttusline").setup({})
  end,
}
