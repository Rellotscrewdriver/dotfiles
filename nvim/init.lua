local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
 defaults = { lazy = true },
 install = { missing = true, colorscheme = { "catppuccin-mocha" } },
 checker = { enabled = true, frequency = 2629800}, --checks for updates every month 
 ui = { border = "single" },
 change_detection = { notify = false },
 performance = {
	cache = {enabled = true},
  rtp = {
   disabled_plugins = {
   "gzip",
   "zip",
   "zipPlugin",
   "fzf",
   "tar",
   "tarPlugin",
   "getscript",
   "getscriptPlugin",
   "vimball",
   "vimballPlugin",
   "2html_plugin",
   "matchit",
   "matchparen",
   "logiPat",
   "rrhelper",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   },
  },
 },
})

require "plugins"
require "theme"
require "core.settings"
require "core.icons"
require "cmp.cmpaths"
require "cmp.server"
require "cmp.addcmpfeat"
require "cmp.other"
require "debugging"
require "cmake"
require "finder"
require "dashboard"
require "explorer"
require "window"
require "quickrun"
require "statusline"
require "discord"
require "git"
require "misc"
require "core.mappings"
require "core.autocommands"
