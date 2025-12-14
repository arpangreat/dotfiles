return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "main",
	init = function()
		-- Filter large files early
		vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
			group = vim.api.nvim_create_augroup("ts_perf", { clear = true }),
			callback = function(args)
				local file = vim.api.nvim_buf_get_name(args.buf)
				local size = vim.fn.getfsize(file)

				-- Lower threshold for low-RAM systems (300KB)
				if size > 300 * 1024 or size == -2 then
					vim.b[args.buf].large_buf = true
					return
				end

				-- Skip generated/build files
				if
					file:match("%.min%.")
					or file:match("lock%.json$")
					or file:match("node_modules")
					or file:match("/target/")
					or file:match("/dist/")
					or file:match("/build/")
					or file:match("%.bundle%.")
				then
					vim.b[args.buf].large_buf = true
				end
			end,
		})
	end,
	config = function()
		local ts = require("nvim-treesitter")

		-- Optional setup
		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Parser languages to install
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
			"tmux",
			"tsx",
			"vim",
			"lua",
			"vimdoc",
			"hyprlang",
			"diff",
			"markdown",
		}

		-- Install missing parsers
		local to_install = vim.tbl_filter(function(lang)
			return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
		end, parsers)

		if #to_install > 0 then
			ts.install(to_install)
		end

		-- Build filetypes list properly (NEW table, not inserting into source)
		local filetypes = {}
		for _, lang in ipairs(parsers) do
			for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
				table.insert(filetypes, ft)
			end
		end

		-- Start treesitter on FileType
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ts_start", { clear = true }),
			pattern = filetypes,
			callback = function(ev)
				if vim.b[ev.buf].large_buf then
					return
				end

				-- Schedule to prevent blocking on low-RAM systems
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(ev.buf) then
						vim.treesitter.start(ev.buf)
					end
				end)
			end,
		})
	end,
}
