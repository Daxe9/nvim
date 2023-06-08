function get_selected_text()
    local mode = vim.fn.mode()

    if mode == "v" or mode == "V" then
        return vim.region()
    else 
        return nil
    end
    
end

function test() 
    local text = get_selected_text()

    print("Selected text: " .. (text or "None"))
end


function find_selected_text()
    local vstart = vim.fn.getpos("'<")

    local vend = vim.fn.getpos("'>")

    local line_start = vstart[3]
    local line_end = vend[3]

    -- or use api.nvim_buf_get_lines
    local line_text = vim.fn.getline(line_start,line_end)
    print(line_text)
end
