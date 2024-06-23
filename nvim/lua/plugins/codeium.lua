local ai_mode = os.getenv('AI_MODE')

if ai_mode ~= '1' then
    return {}
end

return {
    'Exafunction/codeium.vim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'hrsh7th/nvim-cmp',
    },
    event = 'BufEnter',
    opts = {
        enable_chat = true,
    },
    config = function()
        vim.keymap.set('n', '<leader>cc', function()
            return vim.fn['codeium#Chat']()
        end, { expr = true, silent = true })

        vim.keymap.set('i', '<c-;>', function()
            return vim.fn['codeium#CycleCompletions'](1)
        end, { expr = true, silent = true })

        vim.keymap.set('i', '<c-,>', function()
            return vim.fn['codeium#CycleCompletions'](-1)
        end, { expr = true, silent = true })

        vim.keymap.set('i', '<c-x>', function()
            return vim.fn['codeium#Clear']()
        end, { expr = true, silent = true })
    end,
}
