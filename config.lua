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

-- Telescope Binding
lvim.keys.normal_mode["<C-F>"] = "<CMD>Telescope find_files<CR>";
lvim.keys.normal_mode["<F2>"] = "<CMD>lua vim.lsp.buf.rename()<CR>";

-- Telescope ignore directories
lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "node_modules/.*",
    ".idea/.*",
    ".git/.*",
    -- Rust 
    "target/.*"
}

-- Theme 
lvim.colorscheme = "rose-pine"

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

lvim.keys.normal_mode["<A-S-h>"] = ":bp<CR>"
lvim.keys.normal_mode["<A-S-l>"] = ":bn<CR>"

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

o.scrolloff = 8

o.updatetime = 50
o.hidden = true

o.hlsearch = false
o.incsearch = true

o.background = "dark"
o.termguicolors = true


------------PLUGINS----------------

lvim.plugins = {
    {
        "sainnhe/everforest"
    },
    {
        "sainnhe/gruvbox-material"
    },
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}

-------------COPILOT----------------

local ok, copilot = pcall(require, "copilot")
if not ok then 
    return
end

copilot.setup {
    suggestion = {
        keymap = {
            accept = "<C-Y>",
            next = "<C-J>",
            prev = "<C-K>",
        }
    }
}

local opts = { 
    noremap = true,
    silent = true,
}

vim.api.nvim_set_keymap("n", "<C-S>", "<CMD>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

------------------------------------
