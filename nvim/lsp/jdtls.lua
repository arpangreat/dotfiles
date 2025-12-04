---@type vim.lsp.Config

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

return {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Xms512m",
		"-Xmx2g",
		"-Xlog:disable",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		launcher_jar,
		"-configuration",
		jdtls_path .. "/config_linux",
		"-data",
		vim.fn.expand("~/.cache/jdtls-workspace/java-learning"),
	},
	filetypes = { "java" },
	root_markers = { "settings.gradle.kts", "settings.gradle", ".git" },
	settings = {
		java = {
			autobuild = { enabled = true },
			import = {
				gradle = { enabled = true },
			},
		},
	},
	init_options = { bundles = {} },
}
