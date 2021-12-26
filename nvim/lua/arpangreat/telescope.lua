local actions = require("telescope.actions")
local action_generate = require("telescope.actions.generate")
local action_state = require("telescope.actions.state")
local action_set = require("telescope.actions.set")
local action_utils = require("telescope.actions.utils")
local action_mt = require("telescope.actions.mt")

require("telescope").setup({
	defaults = {
		-- vimgrep_arguments = {
		--   'rg',
		--   '--color=never',
		--   '--no-heading',
		--   '--with-filename',
		--   '-line-number',
		--   '--column',
		--   '--smart-case'
		-- },
		prompt_prefix = "$> ",
		-- color_devicons = true,

		-- file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
		-- grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
		-- qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

		-- initial_mode = "insert",
		-- selection_strategy = "reset",
		sorting_strategy = "ascending",
		scroll_strategy = "cycle",
		-- layout_strategy = "vertical",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
			prompt_position = "top",
		},
		--[[ mappings = {
			i = {
				-- ["<CR>"] = actions.select_default,
				["<C-h>"] = action_generate.which_key(),
				["<C-m>"] = actions.toggle_selection + actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		}, ]]
		-- file_sorter = require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {
			"$HOME/dotfiles/nvim/jdt-language-server-latest/*",
			"$HOME/dotfiles/nvim/lua-language-server/*",
		},
		-- generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
		-- path_display = {},
		-- winblend = 0,
		-- border = {},
		-- borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
		-- use_less = true,
		-- set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
		--
		-- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			workspaces = {
				["conf"] = "/home/arpangreat/.config",
				["rust"] = "/home/arpangreat/RustExs",
				["cpp"] = "/home/arpangreat/cppexamples",
				["java"] = "/home/arpangreat/javaexsnew",
				["ts"] = "/home/arpangreat/TypeScriptExs",
				["project"] = "/home/arpangreat/termigit",
				["wiki"] = "/home/arpangreat/wiki",
			},
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		git_worktree = {},
		z = {},
		arecibo = {
			["selected_engine"] = "google",
			["url_open_command"] = "xdg-open",
			["show_http_headers"] = false,
			["show_domain_icons"] = false,
		},
		file_browser = {},
		ui_select = {},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("gh")
require("telescope").load_extension("frecency")
require("telescope").load_extension("z")
require("telescope").load_extension("media_files")
require("telescope").load_extension("arecibo")
require("telescope").load_extension("ui-select")

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "$HOME/dotfiles/nvim/",
	})
end

M.search_notes = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Notes >",
		cwd = "$HOME/wiki/",
		layout_strategy = "vertical",
	})
end

M.search_configs = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Configs >",
		cwd = "$HOME/dotfiles/",
	})
end

return M
