lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" echo nvim_treesitter#statusline(90)  " 90 can be any length
" module->expression_statement->call->identifier

