-- ============================================================
--   MINIMAL TOKYONIGHT STATUSLINE (CENTER STYLE C1, SAFE)
-- ============================================================

local C
local function get_colors()
	if not C then
		---@diagnostic disable-next-line: missing-fields
		C = require("tokyonight.colors").setup({
			style = "storm",
			transparent = true,
		})
	end
	return C
end

---------------------------------------------------------------
--  MODE BLOCK (SOLID TOKYONIGHT BACKGROUND)
---------------------------------------------------------------
_G.ModeBlock = function()
	local mode = vim.fn.mode()
	local c = get_colors()

	local map = {
		n = { text = "NORMAL", bg = c.blue },
		i = { text = "INSERT", bg = c.green },
		v = { text = "VISUAL", bg = c.magenta },
		V = { text = "V-LINE", bg = c.magenta },
		["\22"] = { text = "V-BLOCK", bg = c.magenta },
		c = { text = "COMMAND", bg = c.yellow },
		R = { text = "REPLACE", bg = c.red },
		t = { text = "TERM", bg = c.green1 },
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
	if vim.b.git_branch == nil then
		local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
		if handle then
			vim.b.git_branch = handle:read("*a"):gsub("\n", "")
			handle:close()
		else
			vim.b.git_branch = ""
		end
	end
	return vim.b.git_branch or ""
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
_G.DiagError = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR]
	return d and d > 0 and (" " .. d .. " ") or ""
end
_G.DiagWarn = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.WARN]
	return d and d > 0 and (" " .. d .. " ") or ""
end
_G.DiagInfo = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.INFO]
	return d and d > 0 and (" " .. d .. " ") or ""
end
_G.DiagHint = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.HINT]
	return d and d > 0 and (" " .. d .. " ") or ""
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
	local c = get_colors()
	vim.api.nvim_set_hl(0, "SLGit", { fg = c.blue })
	vim.api.nvim_set_hl(0, "SLDiffAdd", { fg = c.green })
	vim.api.nvim_set_hl(0, "SLDiffMod", { fg = c.yellow })
	vim.api.nvim_set_hl(0, "SLDiffDel", { fg = c.red })
	vim.api.nvim_set_hl(0, "SLError", { fg = c.red })
	vim.api.nvim_set_hl(0, "SLWarn", { fg = c.yellow })
	vim.api.nvim_set_hl(0, "SLInfo", { fg = c.blue })
	vim.api.nvim_set_hl(0, "SLHint", { fg = c.green1 })
	vim.api.nvim_set_hl(0, "SLFile", { fg = c.magenta })
	vim.api.nvim_set_hl(0, "SLLSP", { fg = c.blue })

	vim.api.nvim_set_hl(0, "StatusLine", { bg = c.bg })
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
	"%p%% ",
	"%l:%c ",
})
