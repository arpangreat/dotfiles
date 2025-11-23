-- ============================================================
--   MINIMAL TOKYONIGHT STATUSLINE (CENTER STYLE C1, SAFE)
-- ============================================================

local C = require("tokyonight.colors").setup({
	style = "storm",
	transparent = true,
})

---------------------------------------------------------------
--  MODE BLOCK (SOLID TOKYONIGHT BACKGROUND)
---------------------------------------------------------------
local MODE_COLORS = {
	n = C.blue,
	i = C.green,
	v = C.magenta,
	V = C.magenta,
	["\22"] = C.magenta,
	c = C.yellow,
	R = C.red,
	t = C.green1,
}

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

	return " " .. entry.text .. " "
end
---------------------------------------------------------------
--  GIT
---------------------------------------------------------------
_G.GitBranch = function()
	return vim.b.gitsigns_head or ""
end

---------------------------------------------------------------
--  DIFF: + ~ -
---------------------------------------------------------------
_G.DiffAdded = function()
	local g = vim.b.gitsigns_status_dict or {}
	return "+" .. (g.added or 0)
end

_G.DiffChanged = function()
	local g = vim.b.gitsigns_status_dict or {}
	return "~" .. (g.changed or 0)
end

_G.DiffRemoved = function()
	local g = vim.b.gitsigns_status_dict or {}
	return "-" .. (g.removed or 0)
end

---------------------------------------------------------------
--  DIAGNOSTICS
---------------------------------------------------------------
_G.DiagError = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR]
	return d and d > 0 and (" " .. d .. " ") or ""
end
_G.DiagWarn = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.WARN]
	return d and d > 0 and (" " .. d .. " ") or ""
end
_G.DiagInfo = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.INFO]
	return d and d > 0 and (" " .. d .. " ") or ""
end
_G.DiagHint = function()
	local d = vim.diagnostic.count(0)[vim.diagnostic.severity.HINT]
	return d and d > 0 and (" " .. d .. " ") or ""
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
	local ok, devicons = pcall(require, "nvim-web-devicons")
	if ok then
		icon = devicons.get_icon(name, nil, { default = true }) or ""
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

_G.Macro = function()
	local r = vim.fn.reg_recording()
	if r == "" then
		r = vim.fn.reg_executing()
	end
	return r ~= "" and (" " .. r) or ""
end

---------------------------------------------------------------
--  LSP
---------------------------------------------------------------
_G.LSPNames = function()
	local names = {}
	for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		table.insert(names, c.name)
	end
	return #names > 0 and (" " .. table.concat(names, "|")) or ""
end

---------------------------------------------------------------
--  STATIC HIGHLIGHT GROUPS (TOKYONIGHT)
---------------------------------------------------------------
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

---------------------------------------------------------------
--  FINAL STATUSLINE LAYOUT (CENTER STYLE C1)
---------------------------------------------------------------
vim.opt.laststatus = 3

vim.opt.statusline = table.concat({

	-- LEFT: mode, git, diff
	"%#SLModeDyn#%{v:lua.ModeBlock()}%#StatusLine#",
	" ",
	"%#SLGit#%{v:lua.GitBranch()}%#StatusLine#",
	" ",
	"%#SLDiffAdd#%{v:lua.DiffAdded()}%#StatusLine#",
	" ",
	"%#SLDiffMod#%{v:lua.DiffChanged()}%#StatusLine#",
	" ",
	"%#SLDiffDel#%{v:lua.DiffRemoved()}%#StatusLine#",
	" ",

	-- CENTER BEGINS
	"%=",

	-- CENTER BLOCK: diagnostics, filename, buffcount, macro
	"%#SLError#%{v:lua.DiagError()}%#StatusLine#",
	"%#SLWarn#%{v:lua.DiagWarn()}%#StatusLine#",
	"%#SLInfo#%{v:lua.DiagInfo()}%#StatusLine#",
	"%#SLHint#%{v:lua.DiagHint()}%#StatusLine#",
	" %#SLFile#%{v:lua.File()}%#StatusLine# ",
	"%{v:lua.BufCount()} ",
	"%{v:lua.Macro()} ",

	-- CENTER ENDS
	"%=",

	-- RIGHT: lsp, percent, cursor
	"%#SLLSP#%{v:lua.LSPNames()}%#StatusLine# ",
	"%p%% ",
	"%l:%c ",
})
