
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
lvim.keys.visual_mode["<C-O>"] = "<CMD>lua Print_visual_selection()<CR>"

function Print_visual_selection()
    -- Get the current buffer number
    local bufnr = vim.api.nvim_get_current_buf()

    -- Get the start and end positions of the visual selection
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    local start_line, start_col = start_pos[2], start_pos[3]
    local end_line, end_col = end_pos[2], end_pos[3]

    -- Get the lines from the buffer
    local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)

    -- Variable to store the selected text
    local selected_text = ""

    -- Adjust the first and last lines to only include the selected portion
    if #lines == 0 then
        selected_text = ""
    elseif #lines == 1 then
        -- Single line selection
        selected_text = string.sub(lines[1], start_col, end_col)
    else
        -- Multi-line selection
        local selected_lines = {}
        selected_lines[1] = string.sub(lines[1], start_col)  -- First line from start_col
        selected_lines[#lines] = string.sub(lines[#lines], 1, end_col)  -- Last line to end_col

        -- Include all the middle lines as is
        for i = 2, #lines - 1 do
            selected_lines[i] = lines[i]
        end

        -- Join all selected lines into a single string
        selected_text = table.concat(selected_lines, "\n")
    end

    -- Print the selected text
    -- print(selected_text)
    local command = "/" .. selected_text

    vim.cmd.normal(command)

end

-- Telescope ignore directories
lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "node_modules/.*",
    ".idea/.*",
    ".git/.*",
    -- Rust 
    "target/.*"
}

-- vim.api.nvim_set_hl(0, "LineNr", { bg = nil })

-- Theme 
lvim.colorscheme = "kanagawa"
lvim.builtin.lualine.options.theme = "kanagawa"

-- Transparent window
lvim.transparent_window = true

-- Cpp stuff
-- local cpp_opts = { cmd = {
--         "clangd",
--         "--offset-encoding=utf-16"
--     }
-- }
-- local rust_opts = {
--     settings = {
--         checkOnSave = {
--             command = "clippy"
--         }
--     }
-- }

-- SQL File slow insert mode escape
vim.g.ftplugin_sql_omni_key = "<C-j>"

-- require("lvim.lsp.manager").setup("clangd", cpp_opts)
-- require("lvim.lsp.manager").setup("rust_analyzer", rust_opts)

-----------MAPPINGS-----------------

lvim.keys.normal_mode["<A-S-h>"] = ":bp<CR>"
lvim.keys.normal_mode["<A-S-l>"] = ":bn<CR>"

-----------SETTINGS-----------------

local o = vim.opt

o.number = true
o.wrap = true
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

------------PLUGINS----------------

lvim.plugins = {
    {
        "sainnhe/everforest"
    },
    {
        "sainnhe/gruvbox-material"
    },
    {
        "rebelot/kanagawa.nvim"
    },
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    -- },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end,
    -- },
}

-------------COPILOT----------------
-- local ok, copilot = pcall(require, "copilot")
-- if not ok then
--     return
-- end

-- copilot.setup {
--     suggestion = {
--         keymap = {
--             accept = "<C-Y>",
--             next = "<C-J>",
--             prev = "<C-K>",
--         }
--     }
-- }

-- local opts = { 
--     noremap = true,
--     silent = true,
-- }

-- vim.api.nvim_set_keymap("n", "<C-S>", "<CMD>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

------------------------------------
