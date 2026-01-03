return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "main",
	init = function()
		-- Performance: disable treesitter for large/generated files
		local config = {
			size_threshold = vim.g.ts_size_threshold or (300 * 1024),
			enable_logging = vim.g.ts_enable_logging or false,
			excluded_patterns = vim.g.ts_excluded_patterns or {
				"%.min%.",
				"lock%.json$",
				"node_modules",
				"/target/",
				"/dist/",
				"/build/",
				"%.bundle%.",
			},
		}

		local function log(msg)
			if config.enable_logging then
				vim.notify("[TS] " .. msg, vim.log.levels.INFO)
			end
		end

		local function is_excluded(file)
			for _, pattern in ipairs(config.excluded_patterns) do
				if file:match(pattern) then
					return true
				end
			end
			return false
		end

		vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
			group = vim.api.nvim_create_augroup("ts_perf", { clear = true }),
			callback = function(args)
				local file = vim.api.nvim_buf_get_name(args.buf)
				local size = vim.fn.getfsize(file)

				if vim.b[args.buf].treesitter_force_enable then
					log("Forcing treesitter for: " .. file)
					return
				end

				if size > config.size_threshold or size == -2 then
					vim.b[args.buf].large_buf = true
					log("Large file disabled (" .. (size == -2 and "unreadable" or size .. "B") .. "): " .. file)
					return
				end

				if is_excluded(file) then
					vim.b[args.buf].large_buf = true
					log("Generated file disabled: " .. file)
				end
			end,
		})

		vim.api.nvim_create_user_command("TreesitterToggle", function()
			local buf = vim.api.nvim_get_current_buf()
			if vim.b[buf].large_buf then
				vim.b[buf].treesitter_force_enable = true
				vim.b[buf].large_buf = false
				vim.treesitter.start(buf)
				log("Treesitter enabled for buffer " .. buf)
			else
				vim.treesitter.stop(buf)
				vim.b[buf].large_buf = true
				log("Treesitter disabled for buffer " .. buf)
			end
		end, { desc = "Toggle treesitter for current buffer" })
	end,
	config = function()
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
		local nvim_ts = require("nvim-treesitter")
		local installed = nvim_ts.get_installed()
		local to_install = {}
		for _, lang in ipairs(parsers) do
			if not vim.list_contains(installed, lang) then
				table.insert(to_install, lang)
			end
		end

		if #to_install > 0 then
			nvim_ts.install(to_install)
		end

		-- Core treesitter features
		nvim_ts.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		})

		-- Enable features on FileType
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ts_start", { clear = true }),
			callback = function(ev)
				if vim.b[ev.buf].large_buf then
					return
				end

				vim.schedule(function()
					if not vim.api.nvim_buf_is_valid(ev.buf) then
						return
					end

					-- Only start if parser exists for this language
					local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
					if not lang then
						return
					end

					local has_parser = pcall(vim.treesitter.language.inspect, lang)
					if not has_parser then
						return
					end

					-- Get the window for this buffer
					local win = vim.fn.bufwinid(ev.buf)
					if win == -1 then
						return
					end

					local ok, err = pcall(function()
						vim.treesitter.start(ev.buf)
						vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end)
					if not ok then
						vim.notify("[TS Error] " .. tostring(err), vim.log.levels.WARN)
					end
				end)
			end,
		})
	end,
}
