local themes = require "telescope.themes"

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
		vimgrep_arguments = {
		 'rg',
         '--color=never',
		 '--no-heading',
		 '--with-filename',
		 '-line-number',
		 '--column',
		 '--smart-case'
		},
        prompt_prefix = '$> ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
		scroll_strategy = "cycle",
        layout_strategy = "horizontal",
		layout_config = {
	      horizontal = {
	        mirror = false,
	      },
	      vertical = {
	        mirror = false,
	      },
	      prompt_position = "top",
		},
		file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = {},
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,

		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    },
    extensions = {
        -- fzy_native = {
        --     override_generic_sorter = false,
        --     override_file_sorter = true,
        -- },
		fzf = {
	        fuzzy = true,
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
		},
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = {"*.git/*", "*/tmp/*"},
			workspaces = {
				["conf"]    = "/home/arpangreat/.config",
				["rust"]    = "/home/arpangreat/RustExs",
				["cpp"]    = "/home/arpangreat/cppexamples",
				["java"]    = "/home/arpangreat/javaexsnew",
				["ts"]    = "/home/arpangreat/TypeScriptExs",
				["project"] = "/home/arpangreat/termigit",
				["wiki"]    = "/home/arpangreat/wiki"
		    }
		},
    	media_files = {
		-- filetypes whitelist
		-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    		filetypes = {"png", "webp", "jpg", "jpeg"},
    		find_cmd = "rg" -- find command (defaults to `fd`)
    	},
    	git_worktree = {},
    	z = {},
    },
}


-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')
require('telescope').load_extension('frecency')
require('telescope').load_extension('z')
require('telescope').load_extension('media_files')


local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/dotfiles/nvim",
    })
end

M.search_notes = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Notes >",
        cwd = "$HOME/wiki/",
	layout_strategy="vertical",
    })
end

M.search_configs = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Configs >",
        cwd = "$HOME/dotfiles/",
    })
end



M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M
