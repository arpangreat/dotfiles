-- ============================================================
--   MINIMAL TOKYONIGHT STATUSLINE (CENTER STYLE C1, SAFE)
-- ============================================================

local C = {
	bg = "#222436",
	bg_dark = "#1e2030",
	bg_dark1 = "#191B29",
	bg_highlight = "#2f334d",
	blue = "#82aaff",
	blue0 = "#3e68d7",
	blue1 = "#65bcff",
	blue2 = "#0db9d7",
	blue5 = "#89ddff",
	blue6 = "#b4f9f8",
	blue7 = "#394b70",
	comment = "#636da6",
	cyan = "#86e1fc",
	dark3 = "#545c7e",
	dark5 = "#737aa2",
	fg = "#c8d3f5",
	fg_dark = "#828bb8",
	fg_gutter = "#3b4261",
	green = "#c3e88d",
	green1 = "#4fd6be",
	green2 = "#41a6b5",
	magenta = "#c099ff",
	magenta2 = "#ff007c",
	orange = "#ff966c",
	purple = "#fca7ea",
	red = "#ff757f",
	red1 = "#c53b53",
	teal = "#4fd6be",
	terminal_black = "#444a73",
	yellow = "#ffc777",
	git = {
		add = "#b8db87",
		change = "#7ca1f2",
		delete = "#e26a75",
	},
}

---------------------------------------------------------------
--  MODE BLOCK (SOLID TOKYONIGHT BACKGROUND)
---------------------------------------------------------------
_G.ModeBlock = function()
	local mode = vim.fn.mode()

	local map = {
		n = { text = "NORMAL", bg = C.blue },
		i = { text = "INSERT", bg = C.green },
		v = { text = "VISUAL", bg = C.magenta },
		V = { text = "V-LINE", bg = C.magenta },
		["\22"] = { text = "V-BLOCK", bg = C.magenta },
		c = { text = "COMMAND", bg = C.yellow },
		R = { text = "REPLACE", bg = C.red },
		t = { text = "TERM", bg = C.green1 },
	}

	local entry = map[mode] or map.n

	vim.api.nvim_set_hl(0, "SLModeDyn", {
		fg = entry.bg, -- Color goes to foreground now
		bold = true,
	})

	return entry.text
end
---------------------------------------------------------------
--  GIT
---------------------------------------------------------------
_G.GitBranch = function()
	if vim.b.git_branch ~= nil then
		return vim.b.git_branch
	end
	vim.b.git_branch = "" -- Set placeholder immediately
	vim.fn.jobstart({ "git", "rev-parse", "--abbrev-ref", "HEAD" }, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data then
				vim.b.git_branch = data[1]:gsub("\n", "")
				vim.cmd("redrawstatus")
			end
		end,
		on_exit = function()
			vim.b.git_branch = vim.b.git_branch or ""
		end,
	})
	return "[...]"
end

---------------------------------------------------------------
--  DIFF: + ~ -
---------------------------------------------------------------
_G.DiffAdded = function()
	local summary = vim.b.minidiff_summary or {}
	return "+" .. (summary.add or 0)
end

_G.DiffChanged = function()
	local summary = vim.b.minidiff_summary or {}
	return "~" .. (summary.change or 0)
end

_G.DiffRemoved = function()
	local summary = vim.b.minidiff_summary or {}
	return "-" .. (summary.delete or 0)
end

---------------------------------------------------------------
--  DIAGNOSTICS
---------------------------------------------------------------
local diag_icons = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = " ",
	[vim.diagnostic.severity.INFO] = " ",
}

_G.DiagError = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR]
	return d and d > 0 and (diag_icons[vim.diagnostic.severity.ERROR] .. d .. " ") or ""
end

_G.DiagWarn = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.WARN]
	return d and d > 0 and (diag_icons[vim.diagnostic.severity.WARN] .. d .. " ") or ""
end

_G.DiagInfo = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.INFO]
	return d and d > 0 and (diag_icons[vim.diagnostic.severity.INFO] .. d .. " ") or ""
end

_G.DiagHint = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.HINT]
	return d and d > 0 and (diag_icons[vim.diagnostic.severity.HINT] .. d .. " ") or ""
end

---------------------------------------------------------------
--  FILE + ICON
---------------------------------------------------------------
_G.File = function()
	local name = vim.fn.expand("%:t")
	if name == "" then
		name = "[No Name]"
	end

	local icon = ""
	local ok, miniicons = pcall(require, "mini.icons")
	if ok then
		icon = miniicons.get("file", name) or ""
	end

	-- Add [+] if file is modified
	local modified = vim.bo.modified and " [+]" or ""

	return icon .. " " .. name .. modified
end

---------------------------------------------------------------
--  BUFFER COUNT + MACRO
---------------------------------------------------------------
_G.BufCount = function()
	local bufs = vim.tbl_filter(function(buf)
		return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
	end, vim.api.nvim_list_bufs())
	return #bufs > 1 and ("+" .. (#bufs - 1)) or ""
end
---------------------------------------------------------------
--  LSP
---------------------------------------------------------------
local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local spinner_index = 1
local spinner_timer = nil

-- Initialize progress_status globally
local progress_status = {
	client = nil,
	kind = nil,
	title = nil,
}

local function start_spinner()
	if not spinner_timer then
		spinner_timer = vim.uv.new_timer()
		if not spinner_timer then
			return
		end
		spinner_timer:start(
			0,
			100,
			vim.schedule_wrap(function()
				spinner_index = (spinner_index % #spinner_frames) + 1
				vim.cmd("redrawstatus")
			end)
		)
	end
end

local function stop_spinner()
	if spinner_timer then
		spinner_timer:stop()
		spinner_timer:close()
		spinner_timer = nil
	end
end

vim.api.nvim_create_autocmd("LspProgress", {
	group = vim.api.nvim_create_augroup("statusline_lsp_progress", { clear = true }),
	callback = function(args)
		if not args.data then
			return
		end

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		progress_status = {
			client = client.name,
			kind = args.data.params.value.kind,
			title = args.data.params.value.title,
		}

		if progress_status.kind == "end" then
			progress_status.title = nil
			stop_spinner()
			vim.defer_fn(function()
				vim.cmd.redrawstatus()
			end, 3000)
		else
			start_spinner()
			vim.cmd.redrawstatus()
		end
	end,
})

_G.LSPProgress = function()
	if not progress_status.client or not progress_status.title then
		return ""
	end

	if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
		return ""
	end

	-- Show only spinner and title (no client name)
	return string.format("%s %s...", spinner_frames[spinner_index], progress_status.title)
end

_G.LSPNames = function()
	local names = {}
	for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		table.insert(names, c.name)
	end
	return #names > 0 and (" " .. table.concat(names, "|")) or ""
end

-- Right section: shows either progress OR position info
_G.RightSection = function()
	-- If LSP is progressing, show that instead of position
	if progress_status.client and progress_status.title then
		if not vim.startswith(vim.api.nvim_get_mode().mode, "i") then
			return string.format("%s %s...", spinner_frames[spinner_index], progress_status.title)
		end
	end

	-- Otherwise show position
	return string.format(
		"%d%% %d:%d",
		math.floor((vim.fn.line(".") / vim.fn.line("$")) * 100),
		vim.fn.line("."),
		vim.fn.col(".")
	)
end

---------------------------------------------------------------
--  STATIC HIGHLIGHT GROUPS (TOKYONIGHT)
--  + STATUSLINE SETUP (FIXED ORDER)
---------------------------------------------------------------
local function setup_highlights_and_statusline()
	-- 1. SET HIGHLIGHTS FIRST
	vim.api.nvim_set_hl(0, "SLGit", { fg = C.blue })
	vim.api.nvim_set_hl(0, "SLDiffAdd", { fg = C.green })
	vim.api.nvim_set_hl(0, "SLDiffMod", { fg = C.yellow })
	vim.api.nvim_set_hl(0, "SLDiffDel", { fg = C.red })
	vim.api.nvim_set_hl(0, "SLError", { fg = C.red })
	vim.api.nvim_set_hl(0, "SLWarn", { fg = C.yellow })
	vim.api.nvim_set_hl(0, "SLInfo", { fg = C.blue })
	vim.api.nvim_set_hl(0, "SLHint", { fg = C.green1 })
	vim.api.nvim_set_hl(0, "SLFile", { fg = C.magenta })
	vim.api.nvim_set_hl(0, "SLLSP", { fg = C.blue })
	vim.api.nvim_set_hl(0, "SLProgress", { fg = C.blue5, bold = true })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = C.bg, fg = C.fg })

	-- 2. STATUSLINE LAYOUT
	vim.opt.statusline = table.concat({
		-- LEFT SECTION
		" ",
		"%#SLModeDyn#%{v:lua.ModeBlock()}%#StatusLine#",
		" ",
		"%#SLGit#%{v:lua.GitBranch()}%#StatusLine#",
		" ",
		"%#SLDiffAdd#%{v:lua.DiffAdded()}%#StatusLine#",
		" ",
		"%#SLDiffMod#%{v:lua.DiffChanged()}%#StatusLine#",
		" ",
		"%#SLDiffDel#%{v:lua.DiffRemoved()}%#StatusLine#",

		-- CENTER SECTION
		"%=",
		"%#SLError#%{v:lua.DiagError()}%#StatusLine#",
		"%#SLWarn#%{v:lua.DiagWarn()}%#StatusLine#",
		"%#SLInfo#%{v:lua.DiagInfo()}%#StatusLine#",
		"%#SLHint#%{v:lua.DiagHint()}%#StatusLine#",
		"%#SLFile#%{v:lua.File()}%#StatusLine# ",
		"%{v:lua.BufCount()} ",

		-- RIGHT SECTION
		"%=",
		"%#SLLSP#%{v:lua.LSPNames()}%#StatusLine# ",
		"%#SLProgress#%{v:lua.RightSection()}%#StatusLine# ",
	})
end

-- Setup autocmds as before
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = setup_highlights_and_statusline,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = setup_highlights_and_statusline,
})

vim.opt.laststatus = 3
