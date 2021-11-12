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

local input = { "rg", "" }

local options = {
	finder = finders.new_oneshot_job(input),
	sorter = sorters.get_generic_fuzzy_sorter(),
}

local picker = pickers.new(options)
picker:find()
