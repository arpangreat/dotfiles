local M = {}

---------------------------------------------------------------
-- COLORS
---------------------------------------------------------------
local C = {
	bg = "#1e2030",
	blue = "#7aa2ff",
	green = "#9ece6a",
	green1 = "#4fd6be",
	magenta = "#f7768e",
	yellow = "#ffc777",
	red = "#ff6b6b",
	cyan = "#4cc9f0",
	fg = "#e0e6ff",
	fg_dim = "#a6adc8",
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
local lsp_progress = {}
local lsp_progress_seq = 0
local lsp_spinner_frame = 1
local lsp_spinner_timer = nil

local lsp_spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

-- Use a single persistent uv timer instead of recursive vim.defer_fn.
-- vim.defer_fn creates a new timer object every 100ms which gets GC'd;
-- a single timer avoids that churn entirely.
local function start_lsp_spinner()
	if lsp_spinner_timer then
		return
	end
	lsp_spinner_timer = vim.uv.new_timer()
	if not lsp_spinner_timer then
		return
	end
	lsp_spinner_timer:start(
		100,
		100,
		vim.schedule_wrap(function()
			if not next(lsp_progress) then
				if lsp_spinner_timer then
					lsp_spinner_timer:stop()
					lsp_spinner_timer:close()
					lsp_spinner_timer = nil
				end
				lsp_spinner_frame = 1
				vim.cmd.redrawstatus()
				return
			end
			lsp_spinner_frame = (lsp_spinner_frame % #lsp_spinner) + 1
			vim.cmd.redrawstatus()
		end)
	)
end

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

	if file == "" or vim.bo.buftype ~= "" then
		return ""
	end

	local dir = vim.fs.dirname(file)

	if not dir or vim.fn.isdirectory(dir) == 0 then
		return ""
	end

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
	[vim.diagnostic.severity.HINT] = " ",
	[vim.diagnostic.severity.INFO] = " ",
}

local diag_hl = {
	[vim.diagnostic.severity.ERROR] = "SLError",
	[vim.diagnostic.severity.WARN] = "SLWarn",
	[vim.diagnostic.severity.INFO] = "SLInfo",
	[vim.diagnostic.severity.HINT] = "SLHint",
}

function M.diagnostics()
	local counts = vim.diagnostic.count(0)
	if not counts or not next(counts) then
		return ""
	end

	local parts = {}

	for severity = 1, 4 do
		local count = counts[severity]
		if count and count > 0 then
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
-- Cache buffer count; update on buffer add/delete/wipeout only.
local buf_count_cache = nil

vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufWipeout" }, {
	callback = function()
		buf_count_cache = nil
	end,
})

function M.bufcount()
	if buf_count_cache then
		return buf_count_cache
	end

	local count = 0
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[b].buflisted then
			count = count + 1
		end
	end
	buf_count_cache = count > 1 and ("+" .. (count - 1)) or ""
	return buf_count_cache
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
-- LSP PROGRESS
---------------------------------------------------------------
local function escape_statusline(text)
	return tostring(text or ""):gsub("%%", "%%%%")
end

function M.lsp_progress()
	if vim.api.nvim_get_mode().mode:sub(1, 1) == "i" then
		return ""
	end

	local latest
	for _, progress in pairs(lsp_progress) do
		if not latest or progress.seq > latest.seq then
			latest = progress
		end
	end

	if not latest then
		return ""
	end

	local title = vim.fn.strcharpart(latest.title, 0, 32)
	if vim.fn.strchars(latest.title) > 32 then
		title = title .. "…"
	end

	local percentage = latest.percentage and string.format(" %d%%%%", latest.percentage) or ""
	return table.concat({
		"%#SLLSPProgressSpinner#",
		lsp_spinner[lsp_spinner_frame],
		" ",
		"%#SLLSPProgressClient#",
		escape_statusline(latest.client),
		" ",
		"%#SLLSPProgressTitle#",
		escape_statusline(title),
		percentage,
		"%#StatusLine#",
	})
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
		"%4l:%-2c",
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
		git ~= "" and (" %#SLGit# " .. git .. dirty .. "%#StatusLine#") or "",
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
	local lsp = M.lsp()
	local progress = M.lsp_progress()
	local right = table.concat({
		lsp,
		lsp ~= "" and progress ~= "" and "  " or "",
		progress,
		(lsp ~= "" or progress ~= "") and " " or "",
		M.position(),
		" ",
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
	local set_hl = vim.api.nvim_set_hl
	set_hl(0, "SLGit", { fg = C.green1, bold = true })
	set_hl(0, "SLDirty", { fg = C.red, bold = true })
	set_hl(0, "SLDiffAdd", { fg = C.green })
	set_hl(0, "SLDiffMod", { fg = C.yellow })
	set_hl(0, "SLDiffDel", { fg = C.red })

	set_hl(0, "SLError", { fg = C.red })
	set_hl(0, "SLWarn", { fg = C.yellow })
	set_hl(0, "SLInfo", { fg = C.blue })
	set_hl(0, "SLHint", { fg = C.green1 })

	set_hl(0, "SLProgress", { fg = C.blue })
	set_hl(0, "SLRuler", { fg = C.green1 })

	set_hl(0, "SLFile", { fg = C.magenta, bold = true })
	set_hl(0, "SLLSP", { fg = C.blue })
	set_hl(0, "SLLSPProgressSpinner", { fg = C.green1, bold = true })
	set_hl(0, "SLLSPProgressClient", { fg = C.blue, bold = true })
	set_hl(0, "SLLSPProgressTitle", { fg = C.fg_dim, italic = true })

	set_hl(0, "StatusLine", { bg = C.bg })
end

---------------------------------------------------------------
-- LSP PROGRESS EVENTS
---------------------------------------------------------------
vim.api.nvim_create_autocmd("LspProgress", {
	group = vim.api.nvim_create_augroup("statusline_lsp_progress", { clear = true }),
	desc = "Update LSP progress in the statusline",
	callback = function(args)
		local data = args.data
		local params = data and data.params
		local value = params and params.value
		if not data or not value or not params then
			return
		end

		local client = vim.lsp.get_client_by_id(data.client_id)
		if not client then
			return
		end

		local key = string.format("%d:%s", data.client_id, vim.inspect(params.token)) ---@diagnostic disable-line: param-type-mismatch
		if value.kind == "end" then
			lsp_progress[key] = nil
		else
			lsp_progress_seq = lsp_progress_seq + 1
			lsp_progress[key] = {
				client = client.name,
				title = value.title or value.message or "Working",
				percentage = tonumber(value.percentage),
				seq = lsp_progress_seq,
			}
			start_lsp_spinner()
		end

		vim.cmd.redrawstatus()
	end,
})

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
