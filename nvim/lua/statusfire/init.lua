vim.opt.laststatus = 2
vim.api.nvim_exec(
	[[
function! StatuslineModeColor()
    let s:StatuslineMode=mode()
    if s:StatuslineMode == 'n'
      print("N")
    elseif s:StatuslineMode == 'i'
      print("I")
    endif
endfunc
]],
	true
)

vim.opt.statusline = vim.cmd("let &stl.='%{StatuslineModeColor(v:StatuslineMode)}'")
vim.opt.statusline = vim.opt.statusline + "buf:%n"
vim.opt.statusline = vim.opt.statusline + " <<"
vim.opt.statusline = vim.opt.statusline + " %t : %y"
vim.opt.statusline = vim.opt.statusline + " >>"
vim.opt.statusline = vim.opt.statusline + " %1* %F"
vim.opt.statusline = vim.opt.statusline + " %m"
vim.opt.statusline = vim.opt.statusline + "  "

vim.opt.statusline = vim.opt.statusline + " | "
vim.api.nvim_exec("set statusline+=%{get(b:,'gitsigns_status','')}", true)
vim.opt.statusline = vim.opt.statusline + " |"

vim.opt.statusline = vim.opt.statusline + "%="
vim.opt.statusline = vim.opt.statusline + " [|"
vim.opt.statusline = vim.opt.statusline + " %l:%c"
vim.opt.statusline = vim.opt.statusline + " |]"

vim.cmd("hi User1 ctermbg=blue ctermfg=red")
vim.cmd("hi User2 ctermbg=red ctermfg=blue")
vim.cmd("hi StatusLine ctermfg=black ctermbg=green")
vim.cmd("hi StatusLineTermNC ctermfg=green")
