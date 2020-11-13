" Treesitter configs

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_current_scope = { enable = true },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = { enable = true },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
EOF




" lua <<EOF
" totally optional to use setup
" require('telescope').setup{
"   defaults = {
"     shorten_path = false -- currently the default value is true
"   }
" }
" EOF
"
" nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
" nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>

"
" <C-n>  <C-p> next | previous
" <Down> <Up>  next | previous
" j      k     next | previous (in normal mode)
" <CR>         go to file selection
"
" <C-x>        go to file selection as a split
" <C-v>        go to file selection as a vertical split
" <C-t>        go to a file in a new tab
"
" <C-u>        scroll up in preview window
" <C-d>        scroll down in preview window
"
" <C-c>        close telescope
" <Esc>        close telescope (in normal mode)

" -- Fuzzy find over git files in your directory
" require('telescope.builtin').git_files()
"
" -- Grep files as you type (requires rg currently)
" require('telescope.builtin').live_grep()
"
" -- Use builtin LSP to request references under cursor. Fuzzy find over results.
" require('telescope.builtin').lsp_references()
"
" -- Convert currently quickfixlist to telescope
" require('telescope.builtin').quickfix()
"
" -- Convert currently loclist to telescope
" require('telescope.builtin').loclist()

" Intregating with Base16-theme as of the terminal
