local M = {}

---@class PluginSpec
---@field src string GitHub repository in "owner/repository" form
---@field version? string|vim.VersionRange Git branch, tag, commit hash, or version range
---@field setup? false Skip automatic require/setup
---@field on_setup? fun() Run after the plugin has been loaded

---@param plugins PluginSpec[]
function M.add(plugins)
	local sources = {}
	for i, plugin in ipairs(plugins) do
		sources[i] = {
			src = "https://github.com/" .. plugin.src,
			version = plugin.version,
		}
	end

	vim.pack.add(sources)

	for _, plugin in ipairs(plugins) do
		if plugin.setup ~= false then
			local module_name = plugin.src:match(".+/(.+)"):gsub("%.nvim$", "")
			local mod = require(module_name)
			if type(mod.setup) == "function" then
				mod.setup({})
			end
		end

		if plugin.on_setup then
			local ok, err = pcall(plugin.on_setup)
			if not ok then
				vim.notify(("Plugin setup failed for %s: %s"):format(plugin.src, err), vim.log.levels.WARN)
			end
		end
	end
end

return M
