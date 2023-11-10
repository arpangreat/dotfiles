return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")
    local snip = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = require("luasnip.extras").rep
    local events = require("luasnip.util.events")
    local types = require("luasnip.util.types")

    -- Every unspecified option will be set to the default.
    ls.config.set_config({
      history = true,
      -- Update more often, :h events for more info.
      updateevents = "TextChanged,TextChangedI",
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "choiceNode", "Comment" } },
          },
        },
      },
      -- treesitter-hl has 100, use something higher (default is 200).
      ext_base_prio = 300,
      -- minimal increase in priority.
      ext_prio_increase = 1,
      enable_autosnippets = true,
    })

    ls.snippets = {
      lua = {
        snip({
          trig = "nvmap",
          name = "nvmap",
          dscr = "vim.keymap.set snippet",
        }, {
          t('vim.keymap.set("'),
          i(1, "n"),
          t('" , "'),
          i(2, "trigger"),
          t('" , "'),
          i(3, "command..."),
          t('" , { noremap = '),
          i(4, "true,"),
          t(" silent = "),
          i(5, "false,"),
          t(" expr = "),
          i(6, "false"),
          t(" })"),
          i(0),
        }),
      },
    }
  end,
}
