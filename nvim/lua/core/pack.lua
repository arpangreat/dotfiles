local plugins = require("plugins")

local function load_pack_plugins(specs)
	for _, spec in ipairs(specs) do
		vim.cmd.packadd(spec.name)
	end
end

local function build_blink_cmp()
	local ok, blink = pcall(require, "blink.cmp")
	if not ok then
		vim.notify("blink.cmp build skipped: " .. blink, vim.log.levels.WARN)
		return
	end

	if blink.library_available() then
		return
	end

	local cargo_build_jobs = vim.env.CARGO_BUILD_JOBS
	vim.env.CARGO_BUILD_JOBS = "3"

	local build_ok, err = blink.build():pwait(60000)

	vim.env.CARGO_BUILD_JOBS = cargo_build_jobs

	if not build_ok then
		vim.notify("blink.cmp build failed: " .. tostring(err), vim.log.levels.WARN)
	end
end

local build_hooks = {
	["blink.cmp"] = function(ev)
		if not ev.data.active then
			vim.cmd.packadd(ev.data.spec.name)
		end

		build_blink_cmp()
	end,
	["nvim-treesitter"] = function(ev)
		if not ev.data.active then
			vim.cmd.packadd(ev.data.spec.name)
		end

		vim.cmd("TSUpdate")
	end,
}

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
			return
		end

		local hook = build_hooks[ev.data.spec.name]
		if hook then
			hook(ev)
		end
	end,
})

vim.pack.add(plugins.specs, {
	confirm = false,
	load = false,
})

load_pack_plugins(plugins.specs)
vim.api.nvim_create_user_command("BlinkCmpBuild", build_blink_cmp, { desc = "Build blink.cmp native matcher" })
plugins.setup()
