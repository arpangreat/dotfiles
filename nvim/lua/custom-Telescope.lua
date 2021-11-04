local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local themes = require("telescope.themes")

local mini = {
  layout_strategy = "vertical",
  layout_config = {
    height = 10,
    width = 0.3,
  },
}

function enter(prompt_bufnr)
  local selected = actions_state.get_selected_entry()
  -- print(vim.inspect(selected))
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
  actions.close(prompt_bufnr)
end

local opts = {
  finder = finders.new_table {"tokyonight", "nightfly", "katppuccino"},
  sorter = sorters.get_generic_fuzzy_sorter({}),

  attach_mappings = function (prompt_bufnr, map)
    map("i", "<CR>", enter)
    return true
  end,
}

local dropdown = themes.get_dropdown()
local ivy = themes.get_ivy()
local cursor = themes.get_cursor()

local colors = pickers.new(mini, opts)

colors:find()
