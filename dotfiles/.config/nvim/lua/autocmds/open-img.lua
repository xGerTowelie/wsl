vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.bmp' }, -- Match image file types
    callback = function(args)
        local file_path = vim.fn.expand('%:p') -- Get the absolute path of the file
        vim.fn.system('wslview ' .. vim.fn.shellescape(file_path)) -- Open in Windows default viewer
        vim.cmd('bdelete') -- Close the buffer to avoid showing cryptic content
    end,
})
