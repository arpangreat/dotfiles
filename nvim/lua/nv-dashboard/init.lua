-- vim.g.dashboard_custom_header = {
--     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠁⠀⠀⠀⠀⠀⠀⠈⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣇⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⢀⣀⣤⣤⣤⣤⣀⡀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣔⢿⡿⠟⠛⠛⠻⢿⡿⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣷⣤⣀⡀⢀⣀⣤⣾⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀ ',
--     '⠀⠀⢠⣾⣿⡿⠿⠿⠿⣿⣿⣿⣿⡿⠏⠻⢿⣿⣿⣿⣿⠿⠿⠿⢿⣿⣷⡀⠀⠀ ',
--     '⠀⢠⡿⠋⠁⠀⠀⢸⣿⡇⠉⠻⣿⠇⠀⠀⠸⣿⡿⠋⢰⣿⡇⠀⠀⠈⠙⢿⡄⠀ ',
--     '⠀⡿⠁⠀⠀⠀⠀⠘⣿⣷⡀⠀⠰⣿⣶⣶⣿⡎⠀⢀⣾⣿⠇⠀⠀⠀⠀⠈⢿⠀ ',
--     '⠀⡇⠀⠀⠀⠀⠀⠀⠹⣿⣷⣄⠀⣿⣿⣿⣿⠀⣠⣾⣿⠏⠀⠀⠀⠀⠀⠀⢸⠀ ',
--     '⠀⠁⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⢇⣿⣿⣿⣿⡸⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠀ ',
--     '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
--     '⠀⠀⠀⠐⢤⣀⣀⢀⣀⣠⣴⣿⣿⠿⠋⠙⠿⣿⣿⣦⣄⣀⠀⠀⣀⡠⠂⠀⠀⠀ ',
--     '⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠉⠀⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀ ',
-- }
vim.g.dashboard_custom_header = {
'',
'░█████╗░██████╗░██████╗░░█████╗░███╗░░██╗░██████╗░██████╗░███████╗░█████╗░████████╗',
'██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔══██╗██╔════╝██╔══██╗╚══██╔══╝',
'███████║██████╔╝██████╔╝███████║██╔██╗██║██║░░██╗░██████╔╝█████╗░░███████║░░░██║░░░',
'██╔══██║██╔══██╗██╔═══╝░██╔══██║██║╚████║██║░░╚██╗██╔══██╗██╔══╝░░██╔══██║░░░██║░░░',
'██║░░██║██║░░██║██║░░░░░██║░░██║██║░╚███║╚██████╔╝██║░░██║███████╗██║░░██║░░░██║░░░',
'╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░░░╚═╝░░░',
'',
}
-- vim.g.dashboard_preview_command = 'cat'
-- vim.g.dashboard_preview_pipeline = 'lolcat'
-- vim.g.dashboard_preview_file = '~/dotfiles/nvim/ascii-files/arpangreat-cool2.cat'
-- vim.g.dashboard_preview_file_height = 8
-- vim.g.dashboard_preview_file_width = 90



vim.cmd("let g:indentLine_fileTypeExclude = ['dashboard']")

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {' Find File        :SPC t f'}, command = 'Telescope find_files'},
    b = {description = {' Recently Used Files  :SPC f h'}, command = 'Telescope oldfiles'},
    c = {description = {' Load Last Session  :SPC s l'}, command = 'SessionLoad'},
    d = {description = {' Find Word          :SPC f a'}, command = 'Telescope live_grep'},
    e = {description = {' Marks              :SPC f b'}, command = 'Telescope marks'},
	-- f = {description = {'𝓝𝓿𝓲𝓶 Nvim Configuration :SPC t r c'}, command = ' Telescope configuration'}
	f = {description = {' Nvim Configuration :SPC t r c'}, command = ' Telescope configuration'}
}

vim.g.dashboard_custom_footer = {'https://github.com/arpangreat/'}
