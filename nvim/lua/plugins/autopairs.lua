return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
        require('nvim-autopairs').setup({})

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        if autopairs_on_function_select then
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    end,
}
