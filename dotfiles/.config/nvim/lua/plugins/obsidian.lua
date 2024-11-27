return {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        'nvim-lua/plenary.nvim',

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        follow_url_func = function(url)
            print(url)
            vim.cmd(':!wslview "' .. url .. '"')
        end,
        workspaces = {
            {
                name = 'personal',
                path = '~/vaults/personal',
            },
            {
                name = 'work',
                path = '~/vaults/work',
            },
        },
        ui = {
            enable = false,
        },
    },
    keys = {
        { '<leader>ob', ':ObsidianBacklinks<CR>', desc = '[B]acklinks' },
        { '<leader>oc', ':ObsidianTOC<CR>', desc = '[C]urrent TOC' },
        { '<leader>ods', ':ObsidianDailies<CR>', desc = '[D]aily [S]earch' },
        { '<leader>odn', ':ObsidianToday<CR>', desc = '[D]aily [N]ew' },
        { '<leader>oe', ':ObsidianExtractNote<CR>', mode = { 'v' }, desc = '[E]xtract Note' },
        { '<leader>ol', ':ObsidianLinks<CR>', desc = '[L]inks' },
        { '<leader>onf', ':ObsidianNew<CR>', desc = '[N]ew [F]ile' },
        { '<leader>onl', ':ObsidianLinkNew<CR>', desc = '[N]ew [L]ink' },
        { '<leader>op', ':ObsidianPasteImg<CR>', desc = '[P]aste Image from clipboard' },
        { '<leader>ot', ':ObsidianTags<CR>', desc = '[T]ags' },
        { '<leader>oq', ':ObsidianQuickSwitch<CR>', desc = '[Q]uickswitch' },
        { '<leader>ow', ':ObsidianWorkspace<CR>', desc = '[W]orkspace' },
    },
}
