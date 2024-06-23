local default = {
    theme = 'dropdown',
    layout = {
        width = 0.75,
        height = 0.35,
        prompt_position = 'bottom',
        preview_cutoff = 1,
    },
}

local default_pickers = {
    'helptags',
    'keymaps',
    'find_files',
    'builtin',
    'grep_string',
    'live_grep',
    'diagnostics',
    'buffers',
}

local function current_buffer()
    return require('telescope.builtin').live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    })
end

return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
        local telescope = require('telescope')
        local themes = require('telescope.themes')

        local options = {
            extensions = {
                ['ui-select'] = {
                    themes.get_dropdown(),
                },
            },
            pickers = {},
        }

        for _, picker_name in ipairs(default_pickers) do
            options.pickers[picker_name] = {
                theme = default.theme,
                layout_config = default.layout,
            }
        end

        telescope.setup(options)

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')

        -- NOTE: sorted by usage frequency
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch [W]ord' })
        vim.keymap.set('n', '<leader>sa', builtin.live_grep, { desc = '[S]earch [A]ll' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>s/', current_buffer, { desc = '[S]earch [/] in Open Files' })
    end,
}
