local colors = {
	"catppuccin-mocha",
	"catppuccin-frappe",
	"catppuccin-macchiato",
	"tokyonight-moon",
	"tokyonight-storm",
	"tokyonight-night",
  "carbonfox",
	"duskfox",
	"nightfox",
	"terafox",
	"nordfox"
}
math.randomseed(os.time())

local c = colors[math.random(#colors, 1)]
local opt = vim.opt
local opto = vim.o

opt.number = true
opt.tabstop = 2
opt.showmode = false
opt.cmdheight = 1
opt.laststatus = 3
opt.shiftwidth = 2
opt.softtabstop = 2
opt.ttyfast = true
opt.cursorline = true
opt.termguicolors = true

local source_cmd = "colorschem " .. c 
vim.cmd(source_cmd)

opto.updatetime = 300
opto.incsearch = false
opto.signcolumn = 'yes'
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
