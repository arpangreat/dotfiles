local M = {}

local install_dir = vim.fn.stdpath("data") .. "/site"
local update_hook_initialized = false

local parsers = {
	"rust",
	"zig",
	"javascript",
	"cpp",
	"c",
	"typescript",
	"go",
	"gomod",
	"java",
	"html",
	"css",
	"python",
	"fish",
	-- "tmux",
	"tsx",
	"vim",
	"lua",
	"vimdoc",
	"hyprlang",
	"diff",
	"markdown",
	"markdown_inline",
	-- "ghostty",
	"latex",
}

local lang_by_filetype = {
	javascriptreact = "javascript",
	typescriptreact = "tsx",
}

local filetypes = {
	"rust",
	"zig",
	"javascript",
	"javascriptreact",
	"cpp",
	"c",
	"typescript",
	"typescriptreact",
	"go",
	"gomod",
	"java",
	"html",
	"css",
	"python",
	"fish",
	-- "tmux",
	"tsx",
	"vim",
	"lua",
	"help",
	"hyprlang",
	"diff",
	"markdown",
	-- "ghostty",
}

local function prepend_runtime_queries()
	local paths = vim.api.nvim_get_runtime_file("lua/nvim-treesitter/init.lua", false)
	local plugin_root = paths[1] and vim.fs.dirname(vim.fs.dirname(vim.fs.dirname(paths[1])))
	local runtime_dir = plugin_root and vim.fs.joinpath(plugin_root, "runtime")

	if runtime_dir and vim.uv.fs_stat(runtime_dir) then
		vim.opt.runtimepath:prepend(runtime_dir)
	end
end

function M.setup()
	local treesitter = require("nvim-treesitter")

	treesitter.setup({ install_dir = install_dir })
	prepend_runtime_queries()

	for filetype, lang in pairs(lang_by_filetype) do
		vim.treesitter.language.register(lang, filetype)
	end

	-- Defer parser installation to after startup — it does synchronous
	-- filesystem stat calls for every parser in the list.
	local timer = vim.uv.new_timer()
	timer:start(50, 0, vim.schedule_wrap(function()
		timer:close()
		treesitter.install(parsers)
	end))

	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		callback = function(ev)
			local bufnr = ev.buf
			-- Skip large files (>100KB) to avoid long parse times
			local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
			if ok and stats and stats.size > 100 * 1024 then
				return
			end
			-- Defer parsing to next event loop iteration so the buffer renders first
			local ts_timer = vim.uv.new_timer()
			ts_timer:start(0, 0, vim.schedule_wrap(function()
				ts_timer:close()
				if not vim.api.nvim_buf_is_valid(bufnr) then
					return
				end
				vim.treesitter.start(bufnr)
				vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end))
		end,
	})
end

function M.setup_update_hook()
	if update_hook_initialized then
		return
	end
	update_hook_initialized = true

	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			if ev.data.kind ~= "update" then
				return
			end

			if ev.data.spec.name ~= "nvim-treesitter" then
				return
			end

			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end

			vim.schedule(function()
				vim.cmd("TSUpdate " .. table.concat(parsers, " "))
			end)
		end,
	})
end

M.setup_update_hook()

M.spec = {
	src = "nvim-treesitter/nvim-treesitter",
	version = "main",
	setup = false,
	on_setup = M.setup,
}

return M
