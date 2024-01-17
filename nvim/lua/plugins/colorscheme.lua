return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "storm",     -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true,  -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { bold = true },
        -- functions = { italic = true  },
        variables = { italic = true },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3,         -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = true,          -- dims inactive windows
      lualine_bold = true,          -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = colors.red
      end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param hl Highlights
      ---@param c ColorScheme
      on_highlights = function(hl, c)
        -- hl.CursorLineNr = { fg = c.purple }
        hl["@variable"] = { fg = c.red }
        hl.LspInlayHint = { bg = "#063540" }
        hl.WinBar = { bg = c.none }
      end,
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    opts = {
      transparent = true,  -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { bold = true },
        -- functions = { italic = true  },
        variables = { italic = true },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3,         -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = true,          -- dims inactive windows
      lualine_bold = true,          -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = colors.red
      end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param hl Highlights
      ---@param c ColorScheme
      on_highlights = function(hl, c)
        -- hl.CursorLineNr = { fg = c.purple }
        hl.LspInlayHint = { bg = c.base02 }
        hl["@variable"] = { fg = c.red100 }
        -- hl["lualine.themes.tokyonight.c"] = { bg = c.none }
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = { dark = "mocha" },
      transparent_background = true,
      term_colors = true,
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      styles = {
        comments = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        strings = { "italic" },
        variables = { "italic" },
        conditionals = { "italic" },
        loops = { "bold" },
        -- numbers = { "" },
        booleans = { "bold" },
        properties = { "bold" },
        types = { "bold" },
        operators = { "bold" },
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        cmp = true,
        gitgutter = true,
        gitsigns = true,
        telescope = { enabled = true, style = "nvchad", results_title = true },
        --[[ nvimtree = {
        enabled = true,
        show_root = true,
        }, ]]
        notify = true,
        neotree = true,
        neogit = true,
        navic = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        -- dashboard = true,
        -- barbar = true,
        -- bufferline = true,
        -- markdown = true,
        -- illuminate = true,
        noice = true,
        -- fidget = true,
        mason = true,
        semantic_tokens = true,
        treesitter_context = true,
        mini = true,
      },
      -- hop = true,
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.overlay1 },
          LineNr = { fg = colors.overlay1 },
          ["@variable"] = { fg = colors.maroon },
          -- ["@namespace"] = { fg = colors.pink },
          ["@field"] = { fg = colors.pink },
          -- CursorLine = { bg = colors.mantle },
          CursorLineNr = { fg = colors.sky },
        }
      end,
    },
  },
  {
    "akinsho/horizon.nvim",
    version = "*",
    priority = 1000,
    opts = {
      overrides = {
        colors = {
          Normal = { bg = "none" },
        },
      },
    },
  },
  {
    "ribru17/bamboo.nvim",
    priority = 1000,
    opts = {
      style = "vulgaris",                                    -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
      toggle_style_key = nil,                                -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
      toggle_style_list = { "vulgaris", "multiplex", "light" }, -- List of styles to toggle between
      transparent = true,                                    -- Show/hide background
      dim_inactive = true,                                   -- Dim inactive windows/buffers
      term_colors = true,                                    -- Change terminal color as per the selected theme style
      ending_tildes = false,                                 -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false,                          -- reverse item kind highlights in cmp menu

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        conditionals = "italic",
        keywords = "bold",
        functions = "italic,bold",
        namespaces = "italic",
        parameters = "bold",
        strings = "italic",
        variables = "italic",
      },

      -- Lualine options --
      lualine = {
        transparent = true, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {
        WinBar = { bg = "none" },
      }, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
}
