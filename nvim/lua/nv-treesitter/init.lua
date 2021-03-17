require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}


require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}

require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
