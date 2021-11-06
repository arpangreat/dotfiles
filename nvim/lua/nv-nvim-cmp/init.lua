--[[ local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end ]]

local lspkind = require('lspkind')
local luasnip = require("luasnip")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      --[[ if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "") ]]
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    --[[ ["<S-Tab>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }), ]]
  },

  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:None,FloatBorder:NormalFloat",
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'treesitter' },
    { name = 'nvim_lua' },
    { name = 'cmp_git' },
    { name = 'npm' }
    -- { name = 'vsnip' }
  }),

   -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  }),

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "ﲳ",
        nvim_lua = "",
        treesitter = "",
        path = "ﱮ",
        buffer = "﬘",
        luasnip = "",
        spell = "暈",
      })[entry.source.name]
      return vim_item
    end
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}

require("cmp_git").setup({
    -- defaults
    filetypes = { "gitcommit" },
    remotes = { "upstream", "origin" }, -- in order of most to least prioritized
    git = {
        commits = {
            limit = 100,
        },
    },
    github = {
        issues = {
            filter = "all", -- assigned, created, mentioned, subscribed, all, repos
            limit = 100,
            state = "open", -- open, closed, all
        },
        mentions = {
            limit = 100,
        },
        pull_requests = {
            limit = 100,
            state = "open", -- open, closed, merged, all
        },
    },
    gitlab = {
        issues = {
            limit = 100,
            state = "opened", -- opened, closed, all
        },
        mentions = {
            limit = 100,
        },
        merge_requests = {
            limit = 100,
            state = "opened", -- opened, closed, locked, merged
        },
    },
})

-- you need setup cmp first put this after cmp.setup()
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done() )
