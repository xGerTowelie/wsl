vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*.excalidraw.md', -- Target Obsidian's Markdown files
    callback = function()
        -- Read the file content
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local json_data = nil

        -- Find the `compressed-json` block
        local in_json_block = false
        for _, line in ipairs(lines) do
            if line:find('```compressed%-json') then
                in_json_block = true
            elseif line:find('```') and in_json_block then
                in_json_block = false
            elseif in_json_block then
                json_data = (json_data or '') .. line
            end
        end

        -- If JSON data exists, open it in the browser
        if json_data then
            print('json exist')
            local url = 'https://excalidraw.com/#json=' .. vim.fn.shellescape(json_data)
            vim.fn.system('wslview ' .. url) -- Use `wslview` to open the URL
            vim.cmd('bdelete') -- Close the buffer to avoid editing the source
        end
    end,
})
