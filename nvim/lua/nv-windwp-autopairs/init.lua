require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	enable_check_bracket_line = false,
})

local Rule = require("nvim-autopairs.rule")
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")
local endwise = require("nvim-autopairs.ts-rule").endwise

npairs.setup({
	fast_wrap = {},
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add pair on that treesitter node
		javascript = { "template_string" },
		java = false, -- don't check treesitter on java
	},
})

require("nvim-treesitter.configs").setup({
	autopairs = { enable = true },
})

local ts_conds = require("nvim-autopairs.ts-conds")
local conds = require("nvim-autopairs.conds")

-- press % => %% is only inside comment or string
npairs.add_rules({
	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
	Rule("<?php", "?>", "php"):with_pair(ts_conds.is_not_ts_node({ "php_tag" })),
	Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
		:use_regex(true)
		:set_end_pair_length(2),
	Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
		:use_regex(true)
		:set_end_pair_length(2),
	Rule("=", "")
		:with_pair(conds.not_inside_quote())
		:with_pair(function(opts)
			local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
			if last_char:match("[%w%=%s]") then
				return true
			end
			return false
		end)
		:replace_endpair(function(opts)
			local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
			local next_char = opts.line:sub(opts.col, opts.col)
			next_char = next_char == " " and "" or " "
			if prev_2char:match("%w$") then
				return "<bs> =" .. next_char
			end
			if prev_2char:match("%=$") then
				return next_char
			end
			if prev_2char:match("=") then
				return "<bs><bs>=" .. next_char
			end
			return ""
		end)
		:set_end_pair_length(0)
		:with_move(conds.none())
		:with_del(conds.none()),
})

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""

MUtils.completion_confirm = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			require("completion").confirmCompletion()
			return npairs.esc("<c-y>")
		else
			vim.api.nvim_select_popupmenu_item(0, false, false, {})
			require("completion").confirmCompletion()
			return npairs.esc("<c-n><c-y>")
		end
	else
		return npairs.autopairs_cr()
	end
end

npairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

npairs.add_rules({
	Rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ "()", "[]", "{}" }, pair)
	end),
	Rule("( ", " )")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%)") ~= nil
		end)
		:use_key(")"),
	Rule("{ ", " }")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%}") ~= nil
		end)
		:use_key("}"),
	Rule("[ ", " ]")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%]") ~= nil
		end)
		:use_key("]"),
})

remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
