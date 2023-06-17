local present, alpha = pcall(require, "alpha")
if not present then
  return "Alpha has an error"
end

local header = {
  type = "text",
  val = {
[[            ██████╗ ███████╗██╗     ██╗      ██████╗ ████████╗██╗ ███████╗            ]],
[[            ██╔══██╗██╔════╝██║     ██║     ██╔═══██╗╚══██╔══╝╚█║ ██╔════╝            ]],
[[            ██████╔╝█████╗  ██║     ██║     ██║   ██║   ██║    ╚╝ ███████╗            ]],
[[            ██╔══██╗██╔══╝  ██║     ██║     ██║   ██║   ██║       ╚════██║            ]],
[[            ██║  ██║███████╗███████╗███████╗╚██████╔╝   ██║       ███████║            ]],
[[            ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝    ╚═╝       ╚══════╝            ]],
[[███████╗ ██████╗██████╗ ███████╗██╗    ██╗██████╗ ██████╗ ██╗██╗   ██╗███████╗██████╗ ]],
[[██╔════╝██╔════╝██╔══██╗██╔════╝██║    ██║██╔══██╗██╔══██╗██║██║   ██║██╔════╝██╔══██╗]],
[[███████╗██║     ██████╔╝█████╗  ██║ █╗ ██║██║  ██║██████╔╝██║██║   ██║█████╗  ██████╔╝]],
[[╚════██║██║     ██╔══██╗██╔══╝  ██║███╗██║██║  ██║██╔══██╗██║╚██╗ ██╔╝██╔══╝  ██╔══██╗]],
[[███████║╚██████╗██║  ██║███████╗╚███╔███╔╝██████╔╝██║  ██║██║ ╚████╔╝ ███████╗██║  ██║]],
[[╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝]],
  },
  opts = {
    position = "center",
    hl = "Function",
  },
}

local function getGreeting(name)
  local tableTime = os.date("*t")
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = "  Sleep well",
    [2] = "  Good morning",
    [3] = "  Good afternoon",
    [4] = "  Good evening",
    [5] = "望 Good night",
  }
  local greetingIndex = 0
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end
  return greetingsTable[greetingIndex] .. ", " .. name
end

vim.notify = require("notify")(getGreeting("Rellot's Screwdriver"), "info", {title = "Greetings", stages = "slide", render = "minimal"})

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 6,
    width = 19,
    align_shortcut = "right",
    hl_shortcut = "Number",
    hl = "Function",
  }
  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end
  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("s", "  Restore                         ", ":SessionManager load_last_session<CR>"),
    button("r", "  Recents                         ", ":Telescope oldfiles<CR>"),
    button("f", "  Search                          ", ":Telescope find_files<CR>"),
    button("e", "  Create                          ", ":ene <BAR> startinsert<CR>"),
    button("w", "  Projects                        ", "<cmd>lua require'telescope'.extensions.project.project{}<CR>"),
    button("p", "  Update                          ", ":Lazy update<CR>"),
    button("s", "  Settings                        " , ":e ~/.config/nvim/<CR>"),
    button("q", "  Quit                            ", ":qa!<CR>"),
  },
  opts = {
    position = "center",
    spacing = 1,
  },
}

local function stats()
    -- Number of plugins
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    local plugins_text = " v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "  "
      .. datetime
    return plugins_text .. "\n"
end

local function plugstats()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms" .. "\n"
end

local Stats = {
  type = "text",
  val = stats,
  opts = {
    position = "center",
    hl = "Function",
  },
}


local Plugstats = {
  type = "text",
  val = plugstats,
  opts = {
    position = "center",
    hl = "Function",
  },
}

local section = {
  header = header,
  buttons = buttons,
  footer = Stats,
  stats = Plugstats,
}

local opts = {
  layout = {
    { type = "padding", val = 1 },
    section.header,
    { type = "padding", val = 1 },
    section.footer,
    { type = "padding", val = 2 },
    section.buttons,
    { type = "padding", val = 1 },
    section.stats,
  },
  opts = {
    margin = 44,
  },
}

alpha.setup(opts)

