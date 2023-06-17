return {
	--Autocompletion
  {'hrsh7th/nvim-cmp', lazy = true},
  {'neovim/nvim-lspconfig', lazy = true},
  {'hrsh7th/cmp-nvim-lsp', lazy = true},
  {'hrsh7th/cmp-buffer', lazy = false},
  {'hrsh7th/cmp-path', lazy = false},
  {'hrsh7th/cmp-cmdline', lazy = false},
  {'saadparwaiz1/cmp_luasnip', lazy = false},
  {'L3MON4D3/LuaSnip', lazy = true}, --for snippets
  -- for additional features like outline, hovering docs and what not
  {"glepnir/lspsaga.nvim", event = "LspAttach", dependencies = {{"nvim-tree/nvim-web-devicons"}, {"nvim-treesitter/nvim-treesitter"}}}, 
  {"folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons"}, --for summarising elements in the code
  {"williamboman/mason.nvim"}, --portable server manager 
  {"nvim-lua/plenary.nvim", lazy = true},
  --for showing windows in neovim
  {'akinsho/bufferline.nvim', commit = "b337fd393cef2e3679689d220e2628722c20ddcb", dependencies = 'nvim-tree/nvim-web-devicons', lazy = true},
  --Fuzzy Finding
  {'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = 'nvim-lua/plenary.nvim', lazy = true},
  {'CRAG666/code_runner.nvim', dependencies = 'nvim-lua/plenary.nvim', lazy = true}, -- for running a single file quickly
  'goolord/alpha-nvim', --Showing dashboard
  'lewis6991/impatient.nvim', --Speeding up neovim
  {'Civitasv/cmake-tools.nvim', lazy = true}, --Manage a cmake project
  {'lewis6991/gitsigns.nvim', lazy = true }, --OOBE git
  'rcarriga/nvim-notify', --Show notifications
  --File explorer
  {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim",}},
  --for showing up neovim on Discord Rich Presence
  {'andweeb/presence.nvim', lazy = true},
  {'nvim-lualine/lualine.nvim', lazy = true}, --statusline
  {'windwp/nvim-autopairs', lazy = true}, --quickly put curly braces, brackets on both sides
  {"Shatur/neovim-session-manager", lazy = true}, --for managing sessions
  --Themes to be used in neovim
  {"catppuccin/nvim", name = "catppuccin", lazy = true},
  {"folke/tokyonight.nvim", lazy = true},
  {"EdenEast/nightfox.nvim", lazy = true},
  {'numToStr/Comment.nvim', lazy = true}, --Commenting out line easily
  'mrjones2014/smart-splits.nvim', --managing windows and resize them as needed
  {'famiu/bufdelete.nvim', lazy = true}, --for deleting buffers effectively
  {"nvim-telescope/telescope-project.nvim", lazy = true}, --for managing projects easily
  {"p00f/nvim-ts-rainbow", lazy = true}, --uhh, for cool braces?
  {"nvim-treesitter/nvim-treesitter", lazy = true}, --for syntax highlighting
	--for debugging
  {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"}, lazy = true},
}
