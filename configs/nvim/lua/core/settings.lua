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

local source_cmd = "colorscheme catppuccin-mocha"
vim.cmd(source_cmd)

opto.updatetime = 300
opto.incsearch = false
opto.signcolumn = 'yes'
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
