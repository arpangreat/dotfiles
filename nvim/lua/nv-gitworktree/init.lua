require("git-worktree").setup({
    -- update_on_change = <boolean> -- default: true,
    -- clearjumps_on_change = <boolean> -- default: true,
})

local Worktree = require("git-worktree")

-- op = "switch", "create", "delete"
-- path = branch in which was swapped too
-- upstream = only present on create, upstream of create operation
Worktree.on_tree_update(function(op, path, upstream)
end)
