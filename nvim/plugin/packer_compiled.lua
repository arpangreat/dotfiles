-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/arpangreat/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/arpangreat/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/arpangreat/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/arpangreat/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/arpangreat/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  ["Vundle.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/Vundle.vim"
  },
  ale = {
    commands = { "ALEEnable" },
    config = { "vim.cmd[[ALEEnable]]" },
    loaded = false,
    needs_bufread = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/opt/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["cyclist.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/cyclist.vim"
  },
  ["dart-vim-plugin"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/dart-vim-plugin"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["daycula-vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/daycula-vim"
  },
  embark = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/embark"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  firenvim = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  fzf = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gocode = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/gocode/nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["gruvbuddy.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/gruvbuddy.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["nebulous.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nebulous.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim-yarp"
  },
  nvim_utils = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/nvim_utils"
  },
  ["oceanic-material"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/oceanic-material"
  },
  ["omnisharp-vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/omnisharp-vim"
  },
  onebuddy = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/onebuddy"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["orgmode.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["promptline.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/promptline.vim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["shades-of-purple.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/shades-of-purple.vim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  spacebuddy = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/spacebuddy"
  },
  sparkup = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/sparkup"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-z.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope-z.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmuxline.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/tmuxline.vim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-be-good"
  },
  ["vim-bujo"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-bujo"
  },
  ["vim-colors-xcode"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-colors-xcode"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-git"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-git"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-hug-neovim-rpc"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-hug-neovim-rpc"
  },
  ["vim-lsc"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-lsc"
  },
  ["vim-lsc-dart"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-lsc-dart"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snazzy"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-snazzy"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vimpeccable"
  },
  vimwiki = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["vn-night.nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/vn-night.nvim"
  },
  ["wal.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/wal.vim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  },
  ["zig.vim"] = {
    loaded = true,
    path = "/home/arpangreat/.local/share/nvim/site/pack/packer/start/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/home/arpangreat/.local/share/nvim/site/pack/packer/start/gocode/nvim"
time([[Runtimepath customization]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":MarkdownPreview") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":ALEEnable") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file ALEEnable lua require("packer.load")({'ale'}, { cmd = "ALEEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Dispatch") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Make") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Focus") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Start") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType c ++once lua require("packer.load")({'ale'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'ale'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'ale'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'ale'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'ale'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'ale'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'ale'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'ale'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'ale'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
