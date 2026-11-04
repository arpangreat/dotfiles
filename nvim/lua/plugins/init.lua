local vim_pack = require("vim-pack")

local modules = {
	"tokyonight",
	"autopairs",
	"blink",
	"conform",
	"fzf",
	"mini",
	"mason",
	"neotab",
	"tmux",
	"treesitter",
	"trouble",
	"whichkey",
	"videre",
}

local all_specs = {}

local function add_specs(target)
	if not target then
		return
	end
	if target.spec then
		table.insert(all_specs, target.spec)
	elseif target.specs then
		for _, s in ipairs(target.specs) do
			table.insert(all_specs, s)
		end
	elseif target.src then
		table.insert(all_specs, target)
	elseif type(target) == "table" and target[1] then
		for _, s in ipairs(target) do
			table.insert(all_specs, s)
		end
	end
end

for _, name in ipairs(modules) do
	local mod = require("plugins." .. name)
	add_specs(mod)
end

vim_pack.add(all_specs)
