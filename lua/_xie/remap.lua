vim.g.mapleader = " "
local km = vim.keymap

km.set("n", "<leader>pv", vim.cmd.Ex)

-- toggle nvimtree with f3
km.set("n", "<F3>", vim.cmd.NvimTreeToggle)

-- move selected paragraph
km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '<-2<CR>gv=gv")

-- clipboard
km.set("v", "y", '\"+y')
km.set("v", "p", '\"+p')

-- page moving
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")


-- function FindTextAndHighlight()
--     local selectedText = vim.get_visual_selection()

--     if selectedText == "" then
--         return
--     end
    
--     -- highlight all the occurrences of the selected text 
--     vim.cmd("nohlsearch")

    
    
--     -- color = color or "rose-pine"
--     -- vim.cmd.colorscheme(color)

--     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
