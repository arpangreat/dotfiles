-- ripgrep with Telescope

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
-- local previewers = require("telescope.previewers")

local input = {'rg', '--line-number', '--column', ''}

local opts = {
  finder = finders.new_oneshot_job(input),
  sorter = sorters.get_generic_fuzzy_sorter(),
  -- previewer = previewers.(),
}

local picker = pickers.new(opts)
picker:find()
