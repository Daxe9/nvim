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

km.set("v", "<C-p>", ":lua findTextAndHighlight()<CR>")


function findTextAndHighlight()

    local vstart = vim.fn.getpos("'<")

    local vend = vim.fn.getpos("'>")

    local line_start = vstart[3]
    local line_end = vend[3]

    -- or use api.nvim_buf_get_lines
    local line_text = vim.fn.getline(line_start,line_end)


    local bufnr = vim.api.nvim_win_get_buf(0)
    local start = vim.fn.getpos('v') -- [bufnum, lnum, col, off]
    local _end = vim.fn.getpos('.') -- [bufnum, lnum, col, off]
    -- return {
        --   bufnr = bufnr,
        --   mode = vim.fn.mode(),
        --   pos = { start[2], start[3], _end[2], _end[3] },
        -- }

    print(line_text)

end
