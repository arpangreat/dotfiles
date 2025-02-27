return {
	"hrsh7th/nvim-cmp",
	-- branch = "perf",
	event = { "LspAttach", "CmdlineEnter" },
	enabled = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		{ "tzachar/cmp-tabnine", build = "./install.sh" },
	},
	config = function()
		-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		local neotab = require("neotab")
		-- local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
					-- luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				-- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				-- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),

				--[[ ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function()
        if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
        end
        end, { "i", "s" }), ]]
				["<Tab>"] = cmp.mapping(function()
					if vim.snippet.active({ direction = 1 }) then
						vim.snippet.jump(1)
					else
						neotab.tabout()
					end
				end),
				["<S-Tab>"] = cmp.mapping(function()
					if vim.snippet.active({ direction = -1 }) then
						vim.snippet.jump(-1)
					else
						neotab.tabout()
					end
				end),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "lazydev" },
				{ name = "path" },
				{ name = "cmp_tabnine" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
			}),

			-- Use buffer source for `/`.
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			}),

			-- Use cmdline & path source for ':'.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "fuzzy_path" },
				}, {
					{ name = "cmdline" },
				}),
			}),

			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),

				-- completion = {
				-- 	border = "single",
				-- 	col_offset = 0,
				-- 	scroll_bar = false,
				-- 	-- max_width = 100,
				-- },
			},

			completion = {
				completeopt = "menu,menuone,preview,noselect,popup",
			},

			-- view = {
			-- 	entries = { name = "custom", selection_order = "top_down" },
			-- },

			-- formatting = {
			-- 	format = function(entry, vim_item)
			-- 		vim_item.kind = require("lspkind").presets.default[vim_item.kind]
			-- 		vim_item.menu = ({
			-- 			nvim_lsp = "[LSP]",
			-- 			nvim_lua = "[LUA]",
			-- 			treesitter = "",
			-- 			path = "[PATH]",
			-- 			buffer = "﬘",
			-- 			luasnip = "[SNIP]",
			-- 			spell = "暈",
			-- 			cmp_tabnine = "",
			-- 		})[entry.source.name]
			-- 		return vim_item
			-- 	end,
			-- },

			-- --[[ formatting = {
			-- 	fields = { "kind", "abbr", "menu" },
			-- 	format = function(entry, vim_item)
			-- 		local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			-- 		local strings = vim.split(kind.kind, "%s", { trimempty = true })
			-- 		kind.kind = " " .. (strings[1] or "") .. " "
			-- 		kind.menu = "    (" .. (strings[2] or "") .. ")"

			-- 		return kind
			-- 	end,
			-- }, ]]
			formatting = {
				format = require("lspkind").cmp_format({
					expandable_indicator = true,
					mode = "symbol_text",
					max_width = 100,
					ellipsis_char = "...",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						-- luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[Latex]",
						treesitter = "[TREE]",
						tabnine = "[TABNINE]",
						path = "[PATH]",
						lazydev = "[LAZYDEV]",
					},
				}),
			},
			experimental = {
				ghost_text = true,
			},

			performance = {
				debounce = 1,
				throttle = 1,
				fetching_timeout = 1,
				max_view_entries = 100,
			},

			-- sorting = require("cmp.config.default").sorting,
		})

		-- you need setup cmp first put this after cmp.setup()
		-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

		local tabnine = require("cmp_tabnine.config")
		tabnine:setup({
			max_lines = 1000,
			max_num_results = 20,
			sort = true,
			run_on_every_keystroke = true,
			snippet_placeholder = "..",
			ignored_file_types = { -- default is not to ignore
				-- uncomment to ignore in lua:
				-- lua = true
			},
		})

		-- cmp.setup.filetype("blade", {
		-- 	enabled = false,
		-- })

		-- require("luasnip/loaders/from_vscode").lazy_load()
		-- require("luasnip.loaders.from_snipmate").lazy_load()
	end,
}
