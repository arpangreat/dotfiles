return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { bold = true },
        -- functions = { italic = true  },
        variables = { italic = true, bold = true },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = true, -- dims inactive windows
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

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
        hl.variable = { fg = c.magenta }
        hl.CursorLineNr = { fg = c.purple }
      end,
    }
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
        numbers = { "italic" },
        booleans = { "italic" },
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
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        dashboard = true,
        barbar = true,
        -- bufferline = true,
        -- markdown = true,
        ts_rainbow = true,
        ts_rainbow2 = true,
        illuminate = true,
        noice = true,
        fidget = true,
        mason = true,
        semantic_tokens = true,
        treesitter_context = true,
      },
      -- hop = true,
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.overlay1 },
          LineNr = { fg = colors.overlay1 },
          -- CursorLine = { bg = colors.mantle },
          CursorLineNr = { fg = colors.sky },
          DiagnosticVirtualTextError = { bg = colors.none },
          DiagnosticVirtualTextWarn = { bg = colors.none },
          DiagnosticVirtualTextInfo = { bg = colors.none },
          DiagnosticVirtualTextHint = { bg = colors.none },
        }
      end,
    }
  },
}
