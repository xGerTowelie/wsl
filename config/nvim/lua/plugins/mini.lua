return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.ai').setup({ n_lines = 500 })
        require('mini.surround').setup()
        require('mini.jump2d').setup({
            mappings = {
                start_jumping = '<leader>j',
            },
        })

        local statusline = require('mini.statusline')
        statusline.setup({ use_icons = vim.g.have_nerd_font })
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return '%2l:%-2v'
        end
        local wk = require('which-key')
        wk.register({
            ['<leader>j'] = { "<cmd>lua require('mini.jump2d').start()<CR>", '[J]ump' },
        })
    end,
}
