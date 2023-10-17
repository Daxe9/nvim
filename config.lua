-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- nvim tree panel position
lvim.builtin.nvimtree.setup.view.side = "left"
-- For expanding directory when navigating
lvim.builtin.nvimtree.setup.hijack_directories.enable = true
-- Enable panel width resizing
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true

-- Transparent window
lvim.transparent_window = true
-- Cpp stuff
local opts = {
    cmd = {
        "clangd",
        "--offset-encoding=utf-16"
    }
}
require("lvim.lsp.manager").setup("clangd", opts)

-----------MAPPINGS-----------------

lvim.keys.normal_mode["<A-h>"] = ":bp<CR>"
lvim.keys.normal_mode["<A-l>"] = ":bn<CR>"

-----------SETTINGS-----------------

local o = vim.opt

o.number = true
o.relativenumber = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.clipboard = "unnamedplus"
o.completeopt = "menu,menuone,noselect"

o.encoding = "UTF-16"

o.scrolloff = 8

o.updatetime = 50
o.hidden = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true


------------PLUGINS----------------

lvim.plugins = {
    {
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			-- copilot assume mapped
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_no_tab_map = true
            -- disable copilot for cpp
            vim.g.copilot_disable_filetypes = {"cpp"}
    end,
	},
	{
		"hrsh7th/cmp-copilot",
		config = function()
			lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
			table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
		end,
	},

}

------------------------------------
