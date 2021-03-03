
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/dotfiles/nvim",
    })
end

            -- map(mode, key, lua function to call)
            --
            -- good place to look: telescope.actions (init.lua)
            -- lua function to call:  (gets bufnr, not necessarily needed)
            --   require('telescope.actions.state').get_selected_entry(bufnr)
            --   Actions just take the bufnr and give out information
            --   require('telescope.actions').close(bufnr)
            --
            --   check out telescope.actions for _all the available_ supported
            --   actions.
            --
            --   :h telescope.setup ->
            --   :h telescope.builtin ->
            --   :h telescope.layout ->
            --   :h telescope.actions
            --
-- function set_background(content)
--     vim.fn.system(
--         "dconf write /org/mate/desktop/background/picture-filename \"'" .. content .. "'\"")
-- end

-- M.anime_selector = function()
--     require("telescope.builtin").find_files({
--         prompt_title = "< Anime Bobs > ",
--         cwd = "~/dotfiles/backgrounds",
--
--         attach_mappings = function(prompt_bufnr, map)
--             function set_the_background(close)
--                 local content =
--                     require('telescope.actions.state').get_selected_entry(bufnr)
--                 set_background(content.cwd .. "/" .. content.value)
--                 if close then
--                     require('telescope.actions').close(prompt_bufnr)
--                 end
--             end
--
--             map('i', '<C-p>', function(bufnr)
--                 set_the_background()
--             end)
--
--             map('i', '<CR>', function(bufnr)
--                 set_the_background(true)
--             end)
--
--             -- Please continue mapping (attaching additional key maps):
--             -- Ctrl+n/p to move up and down the list.
--             return true
--         end
--     })
-- end

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

