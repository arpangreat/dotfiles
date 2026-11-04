local M = {}

function M.setup_icons()
	require("mini.icons").setup()
	require("mini.icons").mock_nvim_web_devicons()
end

function M.setup_hipatterns()
	local hi = require("mini.hipatterns")
	hi.setup({
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
		},
	})
end

function M.setup_diff()
	require("mini.diff").setup({
		view = {
			style = "sign",
			signs = { add = "┃", change = "┃", delete = "_" },
		},
	})
end

function M.setup()
	M.setup_icons()
	M.setup_hipatterns()
	M.setup_diff()
end

M.specs = {
	{
		src = "nvim-mini/mini.icons",
		setup = false,
		on_setup = M.setup_icons,
	},
	{
		src = "nvim-mini/mini.hipatterns",
		setup = false,
		on_setup = M.setup_hipatterns,
	},
	{
		src = "echasnovski/mini.diff",
		setup = false,
		on_setup = M.setup_diff,
	},
}

return M
