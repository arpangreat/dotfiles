return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "ray-x/cmp-treesitter",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "dmitmel/cmp-cmdline-history",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    { "tzachar/cmp-tabnine", build = "./install.sh" },
    { "L3MON4D3/LuaSnip" },
    "rafamadriz/friendly-snippets",
    { "ollykel/v-vim" },
    "rust-lang/rust.vim",
    "ziglang/zig.vim",
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    local neotab = require("neotab")
    local types = { "?", "@" }

    cmp.setup({
      snippet = {
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body)
          require("luasnip").lsp_expand(args.body)
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
          select = false,
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
          if luasnip.expand_or_jumpable(1) then
            luasnip.expand_or_jump(1)
          else
            neotab.tabout()
          end
        end),
      }),

      window = {
        documentation = {
          -- border = cmp.config.window.bordered(),
          -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          border = "single",
          -- winhighlight = "NormalFloat:None,FloatBorder:NormalFloat",
          winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },

        completion = {
          border = "single",
          winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "treesitter" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "cmp_tabnine" },
        { name = "nvim_lsp_signature_help" },
      }),

      -- Use buffer source for `/`.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline_history" },
        }),
      }),

      -- Use cmdline & path source for ':'.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }, {
          { name = "cmdline_history" },
        }),
      }),

      cmp.setup.cmdline(types, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline_history" },
        }),
      }),

      --[[ formatting = {
      format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      vim_item.menu = ({
      nvim_lsp = "[LSP]",
      nvim_lua = "[LUA]",
      treesitter = "",
      path = "[PATH]",
      buffer = "﬘",
      luasnip = "[SNIP]",
      spell = "暈",
      cmp_tabnine = "",
      })[entry.source.name]
      return vim_item
      end,
      }, ]]

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },

      experimental = {
        ghost_text = true,
      },

      sorting = {
        comparators = {
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })

    -- you need setup cmp first put this after cmp.setup()
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

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

    require("luasnip/loaders/from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
  end,
}
