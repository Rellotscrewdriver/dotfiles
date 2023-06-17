local keymap = vim.keymap.set

-- Swtiching between buffers
keymap("n", "<S-h>", ":bprevious<CR>")
keymap("n", "<S-l>", ":bnext<CR>")

-- See all the buffers
keymap("n", "b", ":Telescope buffers<CR>")
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>")

-- Delele buffers without screwing my layout for the nth time
keymap("n", "fd", ":lua require('bufdelete').bufdelete(0, true)<CR>")

-- See the projects
keymap("n", "<F2>" ,":lua require'telescope'.extensions.project.project{}<CR>")

-- Close a window/split
keymap("n", "<leader>q", ":q!<CR>")

-- Moving between windows
keymap('n', '<C-h>', require('smart-splits').move_cursor_left)
keymap('n', '<C-j>', require('smart-splits').move_cursor_down)
keymap('n', '<C-k>', require('smart-splits').move_cursor_up)
keymap('n', '<C-l>', require('smart-splits').move_cursor_right)

-- Resizing windows
keymap('n', '<C-Up>', require('smart-splits').resize_up)
keymap('n', '<C-Down>', require('smart-splits').resize_down)
keymap('n', '<C-Left>', require('smart-splits').resize_left)
keymap('n', '<C-Right>', require('smart-splits').resize_right)

--Find Files in a project
keymap("n", "<F3>", ":Telescope find_files<CR>")

--Find a string across the file 
keymap("n", "<F3>", ":Telescope grep_string<CR>")

--Show definitions in the current file
keymap("n", "<F3>", ":TroubleToggle workspace_diagnostics<CR>")

--Show references in the whole project
keymap("n", "<F4>", ":TroubleToggle lsp_references<CR>")

--Show definitions of an implementation
keymap("n", "<leader>l", ":TroubleToggle lsp_definitions<CR>")

--Run the single file quickly
keymap("n", "<F8>", ":RunCode<CR>")

-- Toggling lazygit instantly
keymap("n", "<leader>lg", ":Lspsaga term_toggle lazygit<CR>")

-- Toggling file explorer
keymap("n", "f", ":Neotree toggle<CR>")

-- See the git status inside neovim
keymap("n", "<C-g>", ":Neotree git_status<CR>")

-- closing all the windows
keymap("n", "qa", ":qa!<CR>")

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n","<leader>gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n","<F1>", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({"n", "t"}, "<leader>t", "<cmd>Lspsaga term_toggle<CR>")

-- debugging ui toggle  
keymap('n', '<F6>', function() require("dapui").toggle() end)

-- other debugging commands yet to be sorted
keymap('n', '<F7>', function() require('dap').terminate() end) 
keymap('n', '<F5>', function() require('dap').continue() end)
keymap('n', '<F10>', function() require('dap').step_over() end)
keymap('n', '<F9>', function() require('dap').step_into() end)
keymap('n', '<F12>', function() require('dap').step_out() end)
keymap('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap('n', '<Leader>B', function() require('dap').set_breakpoint() end)
keymap('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap('n', '<Leader>dl', function() require('dap').run_last() end)
keymap({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
keymap({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
keymap('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
keymap('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
