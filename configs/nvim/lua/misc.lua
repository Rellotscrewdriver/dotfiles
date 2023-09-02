--very few lines of config or just one line of calling setup usually end up here 
vim.notify = require("notify")

require("notify").setup{
  stages = "slide",
  render = "compact",
  fps = 120,
}

require('Comment').setup()

require('smart-splits').setup()

require('nvim-autopairs').setup()

require("mason").setup({
ui = {
  -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
  border = "single",
  icons = {
    package_installed = "✓",
    package_pending = "➜",
    package_uninstalled = "✗"
  },
},
})

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

impatient.enable_profile()

require("themery").setup({
  themes = {"catppuccin-mocha", "catppuccin-frappe", "catppuccin-macchiato", "tokyonight-moon", "tokyonight-storm","tokyonight-night", "carbonfox", "duskfox", "nightfox", "terafox", "nordfox"
}, -- Your list of installed colorschemes
  themeConfigFile = "~/.config/nvim/lua/session.lua", -- Described below
  livePreview = true, -- Apply theme while browsing. Default to true.
})
