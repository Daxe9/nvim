local o = vim.opt
local g = vim.g

o.nu = true
o.relativenumber = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.clipboard = "unnamedplus"
o.completeopt = "menu,menuone,noselect"

o.encoding = "UTF-8"

o.scrolloff = 8

o.updatetime = 50
o.hidden = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

g.copilot_no_tab_map = true
g.copilot_assume_mapped = true

-- wrap
o.wrap = false

-- airline theme
g.airline_theme = "base16_ocean"

