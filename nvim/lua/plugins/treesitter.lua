return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	branch = "main",
	init = function()
		-- User-configurable settings
		local config = {
			size_threshold = vim.g.ts_size_threshold or (300 * 1024), -- 300KB default
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

		-- Filter large files early
		vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
			group = vim.api.nvim_create_augroup("ts_perf", { clear = true }),
			callback = function(args)
				local file = vim.api.nvim_buf_get_name(args.buf)
				local size = vim.fn.getfsize(file)

				-- Check for manual override
				if vim.b[args.buf].treesitter_force_enable then
					log("Forcing treesitter for: " .. file)
					return
				end

				-- Size check
				if size > config.size_threshold or size == -2 then
					vim.b[args.buf].large_buf = true
					log("Large file disabled (" .. (size == -2 and "unreadable" or size .. "B") .. "): " .. file)
					return
				end

				-- Pattern check
				if is_excluded(file) then
					vim.b[args.buf].large_buf = true
					log("Generated file disabled: " .. file)
				end
			end,
		})

		-- Add command to toggle treesitter for current buffer
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
		local install = require("nvim-treesitter.install")
		local config = {
			enable_logging = vim.g.ts_enable_logging or false,
		}

		local function log(msg)
			if config.enable_logging then
				vim.notify("[TS] " .. msg, vim.log.levels.INFO)
			end
		end

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

		-- Install missing parsers on startup
		local installed = require("nvim-treesitter.config").get_installed()
		local to_install = {}
		for _, lang in ipairs(parsers) do
			if not vim.list_contains(installed, lang) then
				table.insert(to_install, lang)
			end
		end

		if #to_install > 0 then
			log("Installing missing parsers: " .. table.concat(to_install, ", "))
			install.install(to_install)
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
						local ok, err = pcall(function()
							vim.treesitter.start(ev.buf)
							log("Treesitter started for buffer " .. ev.buf)
						end)
						if not ok then
							vim.notify("[TS Error] " .. tostring(err), vim.log.levels.WARN)
							log("Failed to start treesitter: " .. tostring(err))
						end
					end
				end)
			end,
		})
	end,
}
