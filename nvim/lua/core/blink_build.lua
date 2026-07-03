local M = {}

local build_required = false
local build_scheduled = false
local initialized = false

function M.build()
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

function M.run_if_required()
	build_scheduled = false
	if not build_required then
		return
	end

	build_required = false
	vim.cmd.packadd("blink.lib")
	vim.cmd.packadd("blink.cmp")
	M.build()
end

function M.setup()
	if initialized then
		return
	end
	initialized = true

	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
				return
			end

			local name = ev.data.spec.name
			if name ~= "blink.lib" and name ~= "blink.cmp" then
				return
			end

			build_required = true
			if not build_scheduled then
				build_scheduled = true
				vim.schedule(M.run_if_required)
			end
		end,
	})

	vim.api.nvim_create_user_command("BlinkCmpBuild", M.build, {
		desc = "Build blink.cmp native matcher",
	})
end

return M
