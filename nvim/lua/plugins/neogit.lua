return {
 "NeogitOrg/neogit",
 event = "VeryLazy",
 dependencies = { "nvim-lua/plenary.nvim", "rbong/vim-flog", "tpope/vim-fugitive" },
 opts = {
   disable_signs = false,
   disable_context_highlighting = false,
   auto_refresh = true,
   disable_builtin_notifications = false,
   commit_popup = {
     kind = "vsplit",
   },
   disable_commit_confirmation = true,
   -- customize displayed signs
   signs = {
     -- { CLOSED, OPENED }
     section = { ">", "v" },
     item = { ">", "v" },
     hunk = { "", "" },
   },
   integrations = {
     -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
     -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
     --
     -- Requires you to have `sindrets/diffview.nvim` installed.
     -- use {
     --   'TimUntersberger/neogit',
     --   requires = {
     --     'nvim-lua/plenary.nvim',
     --     'sindrets/diffview.nvim'
     --   }
     -- }
     --
     diffview = true,
 }
 }
}
