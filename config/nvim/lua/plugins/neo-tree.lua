-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '<leader>e', ':Neotree reveal<CR>', desc = '[E]xplorer' },
    },
    opts = {
        event_handlers = {
            {
                event = 'file_opened',
                handler = function(file_path)
                    require('neo-tree').close_all()
                end,
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    'node_modules',
                },
            },
            window = {
                mappings = {
                    ['<leader>e'] = 'close_window',
                },
            },
        },
    },
}
