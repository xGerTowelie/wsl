-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
    {
        'lewis6991/gitsigns.nvim',

        opts = {
            signs = {
                add = { text = '┃' },
                change = { text = '┃' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            signs_staged = {
                add = { text = '┃' },
                change = { text = '┃' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 400,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1,
            },
            on_attach = function(bufnr)
                local function map(mode, lhs, rhs, opts)
                    opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
                    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                end

                -- Navigation
                map('n', '<leader>g.', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
                map('n', '<leader>g,', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

                -- Actions
                map('n', '<leader>ghs', ':Gitsigns stage_hunk<CR>')
                map('v', '<leader>ghs', ':Gitsigns stage_hunk<CR>')
                map('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>')
                map('v', '<leader>ghr', ':Gitsigns reset_hunk<CR>')
                map('n', '<leader>ghS', '<cmd>Gitsigns stage_buffer<CR>')
                map('n', '<leader>ghu', '<cmd>Gitsigns undo_stage_hunk<CR>')
                map('n', '<leader>ghR', '<cmd>Gitsigns reset_buffer<CR>')
                map('n', '<leader>ghp', '<cmd>Gitsigns preview_hunk<CR>')
                map('n', '<leader>ghb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
                map('n', '<leader>gtb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
                map('n', '<leader>ghd', '<cmd>Gitsigns diffthis<CR>')
                map('n', '<leader>ghD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
                map('n', '<leader>gtd', '<cmd>Gitsigns toggle_deleted<CR>')

                -- Text object
                map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end,
        },
    },
}
