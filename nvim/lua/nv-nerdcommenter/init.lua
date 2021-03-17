-- Add spaces after comment delimiters by default
vim.cmd('let g:NERDSpaceDelims = 1')

-- Use compact syntax for prettified multi-line comments
vim.cmd('let g:NERDCompactSexyComs = 1')

-- Align line-wise comment delimiters flush left instead of following code indentation
vim.cmd("let g:NERDDefaultAlign = 'left'")

-- Set a language to use its alternate delimiters by default
vim.cmd('let g:NERDAltDelims_java = 1')

-- Add your own custom formats or override the defaults
vim.cmd("let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }")

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.cmd('let g:NERDCommentEmptyLines = 1')

-- Enable trimming of trailing whitespace when uncommenting
vim.cmd('let g:NERDTrimTrailingWhitespace = 1')

-- Enable NERDCommenterToggle to check all selected lines is commented or not 
vim.cmd('let g:NERDToggleCheckAllLines = 1')
