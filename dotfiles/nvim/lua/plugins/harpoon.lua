return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd file' })
        vim.keymap.set('n', '<leader><leader>', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon' })
    end,
}
