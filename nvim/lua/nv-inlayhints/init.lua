local default_config = {
	inlay_hints = {
		parameter_hints = {
			show = true,
			prefix = "<- ",
			separator = ", ",
			remove_colon_start = false,
			remove_colon_end = true,
		},
		type_hints = {
			-- type and other hints
			show = true,
			prefix = "",
			separator = ", ",
			remove_colon_start = false,
			remove_colon_end = false,
		},
		-- separator between types and parameter hints. Note that type hints are
		-- shown before parameter
		labels_separator = "  ",
		-- whether to align to the length of the longest line in the file
		max_len_align = false,
		-- padding from the left if max_len_align is true
		max_len_align_padding = 1,
		-- whether to align to the extreme right or not
		right_align = false,
		-- padding from the right if right_align is true
		right_align_padding = 7,
		-- highlight group
		highlight = "LspInlayHint",
	},
	debug_mode = false,
}

require("lsp-inlayhints").setup(default_config)
