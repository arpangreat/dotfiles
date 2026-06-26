local M = {}

---------------------------------------------------------------
-- COLORS
---------------------------------------------------------------
local C = {
	bg = "#1e2030", -- slightly darker for better contrast

	blue = "#7aa2ff", -- brighter, more saturated
	green = "#9ece6a", -- punchier green
	green1 = "#4fd6be", -- keep teal but already good
	magenta = "#f7768e", -- more vibrant pink-magenta
	yellow = "#ffc777", -- already strong, keep
	red = "#ff6b6b", -- brighter red (less dull)

	-- optional extras (future-proof if used)
	cyan = "#4cc9f0", -- brighter cyan
	fg = "#e0e6ff", -- slightly brighter foreground
	fg_dim = "#a6adc8", -- dim text (for ruler etc.)
}

---------------------------------------------------------------
-- CACHE
---------------------------------------------------------------
local cache = {
	mode = "",
	git = {},
}
local last_mode = nil
local mini_icons = nil

local function is_cmdline_mode(mode)
	return mode == "c" or mode == "cv" or mode == "ce" or mode == "r" or mode == "rm" or mode == "r?" or mode == "!"
end

---------------------------------------------------------------
-- MODE MAP
---------------------------------------------------------------
local base_modes = {
	NORMAL = { text = "NORMAL", bg = C.blue },
	INSERT = { text = "INSERT", bg = C.green },
	VISUAL = { text = "VISUAL", bg = C.magenta },
	COMMAND = { text = "COMMAND", bg = C.yellow },
	REPLACE = { text = "REPLACE", bg = C.red },
	TERM = { text = "TERM", bg = C.green1 },
	SELECT = { text = "SELECT", bg = C.magenta },
	PENDING = { text = "OP-PENDING", bg = C.yellow },
}

local mode_map = {
	n = base_modes.NORMAL,
	i = base_modes.INSERT,
	v = base_modes.VISUAL,
	V = base_modes.VISUAL,
	["\22"] = base_modes.VISUAL,
	c = base_modes.COMMAND,
	R = base_modes.REPLACE,
	t = base_modes.TERM,

	["no"] = base_modes.PENDING,
	["nov"] = base_modes.PENDING,
	["noV"] = base_modes.PENDING,
	["no\22"] = base_modes.PENDING,

	["niI"] = base_modes.NORMAL,
	["niR"] = base_modes.NORMAL,
	["niV"] = base_modes.NORMAL,
	["nt"] = base_modes.NORMAL,
	["ntT"] = base_modes.NORMAL,

	["vs"] = base_modes.VISUAL,
	["Vs"] = base_modes.VISUAL,
	["\22s"] = base_modes.VISUAL,

	["s"] = base_modes.SELECT,
	["S"] = base_modes.SELECT,
	["\19"] = base_modes.SELECT,

	["ic"] = base_modes.INSERT,
	["ix"] = base_modes.INSERT,

	["Rc"] = base_modes.REPLACE,
	["Rx"] = base_modes.REPLACE,

	["Rv"] = { text = "VIRT REPLACE", bg = C.red },
	["Rvc"] = { text = "VIRT REPLACE", bg = C.red },
	["Rvx"] = { text = "VIRT REPLACE", bg = C.red },

	["cv"] = base_modes.COMMAND,
	["ce"] = base_modes.COMMAND,

	["r"] = base_modes.COMMAND,
	["rm"] = base_modes.COMMAND,
	["r?"] = base_modes.COMMAND,

	["!"] = base_modes.COMMAND,
}

---------------------------------------------------------------
-- MODE
---------------------------------------------------------------
function M.mode()
	local mode = vim.api.nvim_get_mode().mode

	if is_cmdline_mode(mode) then
		return cache.mode ~= "" and cache.mode or "%#StatusLine#"
	end

	if mode == last_mode then
		return cache.mode
	end

	local entry = mode_map[mode] or base_modes.NORMAL

	vim.api.nvim_set_hl(0, "SLModeDyn", {
		fg = entry.bg,
		bold = true,
	})

	cache.mode = string.format("%%#SLModeDyn#%s%%#StatusLine#", entry.text)
	last_mode = mode

	return cache.mode
end

---------------------------------------------------------------
-- GIT
---------------------------------------------------------------
function M.git()
	local file = vim.api.nvim_buf_get_name(0)

	-- ignore invalid / special buffers
	if file == "" or vim.bo.buftype ~= "" then
		return ""
	end

	local dir = vim.fs.dirname(file)

	-- ensure directory exists (VERY IMPORTANT)
	if not dir or vim.fn.isdirectory(dir) == 0 then
		return ""
	end

	-- cached per directory
	if cache.git[dir] ~= nil then
		return cache.git[dir]
	end

	cache.git[dir] = "" -- mark as fetching

	vim.system({ "git", "-C", dir, "rev-parse", "--abbrev-ref", "HEAD" }, { text = true }, function(res)
		vim.schedule(function()
			if res.code == 0 and res.stdout then
				local branch = res.stdout:gsub("%s+", "")
				cache.git[dir] = branch ~= "" and branch or ""
			else
				cache.git[dir] = ""
			end
			vim.cmd.redrawstatus()
		end)
	end)

	return ""
end

---------------------------------------------------------------
-- DIFF
---------------------------------------------------------------
function M.diff()
	local s = vim.b.minidiff_summary or {}

	return string.format(
		"%%#SLDiffAdd#+%d%%#StatusLine# %%#SLDiffMod#~%d%%#StatusLine# %%#SLDiffDel#-%d%%#StatusLine#",
		s.add or 0,
		s.change or 0,
		s.delete or 0
	)
end

---------------------------------------------------------------
-- DIAGNOSTICS
---------------------------------------------------------------
local diag_icons = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.INFO] = " ",
	[vim.diagnostic.severity.HINT] = " ",
}

local diag_hl = {
	[vim.diagnostic.severity.ERROR] = "SLError",
	[vim.diagnostic.severity.WARN] = "SLWarn",
	[vim.diagnostic.severity.INFO] = "SLInfo",
	[vim.diagnostic.severity.HINT] = "SLHint",
}

function M.diagnostics()
	local diags = vim.diagnostic.get(0)
	if not diags or #diags == 0 then
		return ""
	end

	local counts = { 0, 0, 0, 0 }

	for _, d in ipairs(diags) do
		counts[d.severity] = counts[d.severity] + 1
	end

	local parts = {}

	for severity = 1, 4 do
		local count = counts[severity]
		if count > 0 then
			parts[#parts + 1] =
				string.format("%%#%s#%s%d%%#StatusLine#", diag_hl[severity], diag_icons[severity], count)
		end
	end

	return table.concat(parts, " ")
end

---------------------------------------------------------------
-- FILE
---------------------------------------------------------------
function M.file()
	local name = vim.api.nvim_buf_get_name(0)
	name = name ~= "" and vim.fs.basename(name) or "[No Name]"

	if mini_icons == nil then
		local ok, mod = pcall(require, "mini.icons")
		if ok then
			mini_icons = mod
		end
	end

	local icon = ""
	if mini_icons then
		icon = mini_icons.get("file", name) or ""
	end
	local modified = vim.bo.modified and " [+]" or ""

	return string.format("%%#SLFile#%s %s%s%%#StatusLine#", icon, name, modified)
end

---------------------------------------------------------------
-- BUFCOUNT
---------------------------------------------------------------
function M.bufcount()
	local count = 0
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[b].buflisted then
			count = count + 1
		end
	end
	return count > 1 and ("+" .. (count - 1)) or ""
end

---------------------------------------------------------------
-- LSP
---------------------------------------------------------------
function M.lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local names = {}
	for _, c in ipairs(clients) do
		names[#names + 1] = c.name
	end

	return string.format("%%#SLLSP# %s%%#StatusLine#", table.concat(names, "|"))
end

---------------------------------------------------------------
-- POSITION
---------------------------------------------------------------
function M.position()
	return table.concat({
		"%#SLProgress#",
		"%3p%%",
		"%#StatusLine#",
		" ",
		"%#SLRuler#",
		"%4l:%-3c",
		"%#StatusLine#",
	})
end

---------------------------------------------------------------
-- RENDER (CENTERED + NO OVERFLOW)
---------------------------------------------------------------

function M.render()
	local git = M.git()
	local dirty = vim.bo.modified and " %#SLDirty#●%#StatusLine#" or ""

	local left = table.concat({
		" ",
		M.mode(),
		git ~= "" and (" %#SLGit# " .. git .. dirty .. "%#StatusLine#") or "",
		" ",
		M.diff(),
	})

	-----------------------------------------------------------
	-- CENTER (always full)
	-----------------------------------------------------------
	local diagnostics = M.diagnostics()
	local file = M.file()
	local bufcount = M.bufcount()

	local center = table.concat({
		diagnostics,
		diagnostics ~= "" and " " or "",
		file,
		bufcount ~= "" and (" " .. bufcount) or "",
	})

	-----------------------------------------------------------
	-- RIGHT
	-----------------------------------------------------------
	local right = table.concat({
		M.lsp(),
		" ",
		M.position(),
	})

	-----------------------------------------------------------
	-- TRUE CENTER LAYOUT
	-----------------------------------------------------------
	return table.concat({
		left,
		"%=",
		center,
		"%=",
		right,
	})
end

---------------------------------------------------------------
-- HIGHLIGHTS
---------------------------------------------------------------
local function setup_highlights()
	vim.api.nvim_set_hl(0, "SLGit", { fg = C.green1, bold = true })
	vim.api.nvim_set_hl(0, "SLDirty", { fg = C.red, bold = true })
	vim.api.nvim_set_hl(0, "SLDiffAdd", { fg = C.green })
	vim.api.nvim_set_hl(0, "SLDiffMod", { fg = C.yellow })
	vim.api.nvim_set_hl(0, "SLDiffDel", { fg = C.red })

	vim.api.nvim_set_hl(0, "SLError", { fg = C.red })
	vim.api.nvim_set_hl(0, "SLWarn", { fg = C.yellow })
	vim.api.nvim_set_hl(0, "SLInfo", { fg = C.blue })
	vim.api.nvim_set_hl(0, "SLHint", { fg = C.green1 })

	vim.api.nvim_set_hl(0, "SLProgress", { fg = C.blue })
	vim.api.nvim_set_hl(0, "SLRuler", { fg = C.green1 })

	vim.api.nvim_set_hl(0, "SLFile", { fg = C.magenta, bold = true })
	vim.api.nvim_set_hl(0, "SLLSP", { fg = C.blue })

	vim.api.nvim_set_hl(0, "StatusLine", { bg = C.bg })
end

---------------------------------------------------------------
-- LAZY REDRAW
---------------------------------------------------------------
vim.api.nvim_create_autocmd({
	"ModeChanged",
	"BufEnter",
	"BufWritePost",
	"DiagnosticChanged",
	"LspAttach",
	"LspDetach",
}, {
	callback = function()
		vim.cmd.redrawstatus()
	end,
})

---------------------------------------------------------------
-- INIT
---------------------------------------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = setup_highlights,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = setup_highlights,
})

vim.o.laststatus = 3
vim.o.statusline = "%!v:lua.require('statusline').render()"

return M
