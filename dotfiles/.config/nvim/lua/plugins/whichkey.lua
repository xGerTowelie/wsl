return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'modern',
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            presets = {
                operators = false, -- adds help for operators like d, y, ...
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = false, -- bindings for folds, spelling and others prefixed with z
                g = false, -- bindings for prefixed with g
            },
        },
        win = {
            no_overlap = true,
            width = 200,
            height = { min = 20, max = 55 },
            row = math.huge,
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = false,
            zindex = 1000,
        },
        layout = {
            width = { min = 20 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
        },
        keys = {
            scroll_down = '<c-j>', -- binding to scroll down inside the popup
            scroll_up = '<c-k>', -- binding to scroll up inside the popup
        },
        sort = { 'group', 'order', 'local', 'alphanum', 'mod' },
        expand = 15, -- expand groups when <= n mappings
        icons = {
            mappings = false,
        },
        show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Local Keymaps',
        },
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>g', group = '[G]it' },
        { '<leader>g_', hidden = true },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>t_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
    },
}
