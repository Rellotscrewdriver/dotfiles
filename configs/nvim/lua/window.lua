-- local c = require("catppuccin.palettes").get_palette "mocha"
require('bufferline').setup {
  -- highlights = require("catppuccin.groups.integrations.bufferline").get {
  -- custom = {
    -- mocha = {
    --   buffer_selected = { fg = c.text, bg = c.base, bold = false, italic = false },
      -- tab_close = { fg = c.surface1, bg = c.mantle, bold = false, italic = false },
      -- close_button = { fg = c.surface1, bg = c.mantle, bold = false, italic = false },
      -- close_button_visible = { fg = c.surface1, bg = c.mantle, bold = false, italic = false },
      -- close_button_selected = { fg = c.text, bg = c.base, bold = false, italic = false },
      -- },
    -- },
  -- },
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    left_mouse_command = nil,    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    --name_formatter = function(buf)  -- buf contains:
          -- name                | str        | the basename of the active file
          -- path                | str        | the full path of the active file
          -- bufnr (buffer only) | int        | the number of the active buffer
          -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
          -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    --end,
		separator_style = "thin",
		max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "none",
    diagnostics_update_in_insert = false,
    offsets = {
            {
              text = 'File Explorer',
              filetype = 'neo-tree',
              highlight = 'PanelHeading',
              text_align = 'center',
              separator = true,
            },
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
}
