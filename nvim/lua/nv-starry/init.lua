vim.cmd([[
let starry_italic_comments=v:true
let starry_italic_string=v:true
let starry_italic_keywords=v:true
let starry_italic_functions=v:true
let starry_italic_variables=v:true
let starry_contrast=v:false
let starry_borders=v:false
let starry_disable_background=v:true
let starry_style_fix=v:true  "disable random loading
let starry_style="moonlight"  "load moonlight everytime or
let starry_darker_contrast=v:false
let starry_set_hl=v:false " Note: enable for nvim 0.6+, it is faster (loading time down to 4~6s from 7~11s), but it does
" not overwrite old values and may has some side effects
let starry_daylight_switch=v:false  "this allow using brighter color
" other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
colorscheme starry
]])
