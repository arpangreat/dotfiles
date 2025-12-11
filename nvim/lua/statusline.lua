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
	icon = require("mini.icons").get("file", name) or ""

	-- Add [+] if file is modified
	local modified = vim.bo.modified and " [+]" or ""

	return icon .. " " .. name .. modified
end

---------------------------------------------------------------
--  BUFFER COUNT + MACRO
---------------------------------------------------------------
_G.BufCount = function()
	local c = 0
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(b) == 1 then
			c = c + 1
		end
	end
	return c > 1 and ("+" .. (c - 1)) or ""
end
---------------------------------------------------------------
--  LSP
---------------------------------------------------------------
_G.LSPNames = function()
	local names = {}
	for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		table.insert(names, c.name)
	end
	return #names > 0 and (" " .. table.concat(names, "|")) or ""
end

---------------------------------------------------------------
--  STATIC HIGHLIGHT GROUPS (TOKYONIGHT)
---------------------------------------------------------------
local function setup_highlights()
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

	vim.api.nvim_set_hl(0, "StatusLine", { bg = C.bg })
end

-- Setup highlights on VimEnter (after everything is loaded)
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = setup_highlights,
})

-- Also setup when colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = setup_highlights,
})

---------------------------------------------------------------
--  FINAL STATUSLINE LAYOUT (CENTER STYLE C1)
---------------------------------------------------------------
vim.opt.laststatus = 3

vim.opt.statusline = table.concat({

	-- LEFT: mode, git, diff
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

	-- EXPAND LEFT
	"%=",

	-- TRUE CENTER: diagnostics, filename, buffcount, macro
	"%#SLError#%{v:lua.DiagError()}%#StatusLine#",
	"%#SLWarn#%{v:lua.DiagWarn()}%#StatusLine#",
	"%#SLInfo#%{v:lua.DiagInfo()}%#StatusLine#",
	"%#SLHint#%{v:lua.DiagHint()}%#StatusLine#",
	"%#SLFile#%{v:lua.File()}%#StatusLine# ",
	"%{v:lua.BufCount()} ",

	-- EXPAND RIGHT
	"%=",

	-- RIGHT: lsp, percent, cursor
	"%#SLLSP#%{v:lua.LSPNames()}%#StatusLine# ",
	"%3p%%",
	"%4l:%-3c",
})
