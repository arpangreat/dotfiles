local plugins = require("plugins")
local theme = "tokyonight.nvim"
local blink_build_required = false
local blink_build_scheduled = false

local function load_pack_plugins(specs)
	for _, spec in ipairs(specs) do
		if spec.name ~= theme then
			vim.cmd.packadd(spec.name)
		end
	end
end

local function build_blink_cmp()
	local ok, blink = pcall(require, "blink.cmp")
	if not ok then
		vim.notify("blink.cmp build failed to load: " .. blink, vim.log.levels.ERROR)
		return false
	end

	local cargo_build_jobs = vim.env.CARGO_BUILD_JOBS
	vim.env.CARGO_BUILD_JOBS = "3"

	local call_ok, build_ok, err = pcall(function()
		return blink.build():pwait()
	end)

	vim.env.CARGO_BUILD_JOBS = cargo_build_jobs

	if not call_ok or not build_ok then
		vim.notify("blink.cmp build failed: " .. tostring(call_ok and err or build_ok), vim.log.levels.ERROR)
		return false
	end

	return true
end

local function build_blink_if_required()
	blink_build_scheduled = false
	if not blink_build_required then
		return
	end

	blink_build_required = false
	vim.cmd.packadd("blink.lib")
	vim.cmd.packadd("blink.cmp")
	build_blink_cmp()
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
			return
		end

		local name = ev.data.spec.name
		if name ~= "blink.lib" and name ~= "blink.cmp" then
			return
		end

		blink_build_required = true
		if not blink_build_scheduled then
			blink_build_scheduled = true
			vim.schedule(build_blink_if_required)
		end
	end,
})

vim.pack.add(plugins.specs, {
	confirm = false,
	load = false,
})

-- Set the final background before loading the rest of the plugin graph so the
-- first rendered frame does not use Neovim's default colors.
vim.cmd.packadd(theme)
require("plugins.tokyonight").setup()

load_pack_plugins(plugins.specs)

-- PackChanged runs during vim.pack.add() for fresh installs. Build now so the
-- native matcher is ready before require("blink.cmp").setup() runs below.
build_blink_if_required()

vim.api.nvim_create_user_command("BlinkCmpBuild", build_blink_cmp, { desc = "Build blink.cmp native matcher" })
plugins.setup()
