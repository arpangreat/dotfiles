vim.loader.enable(true)

require("core.settings")
require("core.legacy")
require("core.mappings")
require("user.autocommands")
require("statusline")
require("configs.config")
require("configs.lsp")

pcall(vim.cmd.packadd, "nvim.undotree")
pcall(vim.cmd.packadd, "nvim.difftool")
require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = {
			default = "msg",
			[""] = "msg",
			empty = "cmd",
			bufwrite = "msg",
			confirm = "cmd",
			emsg = "pager",
			echo = "msg",
			echomsg = "msg",
			echoerr = "pager",
			completion = "cmd",
			list_cmd = "pager",
			lua_error = "pager",
			lua_print = "msg",
			progress = "msg",
			rpc_error = "pager",
			quickfix = "msg",
			search_cmd = "cmd",
			search_count = "cmd",
			shell_cmd = "pager",
			shell_err = "pager",
			shell_out = "pager",
			shell_ret = "msg",
			undo = "msg",
			verbose = "pager",
			wildlist = "cmd",
			wmsg = "msg",
			-- typed_cmd = "cmd",
		},
		dialog = { height = 0.5 },
		msg = { height = 0.3 },
		pager = { height = 0.5 },
	},
})
