require('config.globals')
require('config.options')
require('config.keymaps')
require('autocmds.yank')

require('lazy_setup')

require('lazy').setup({
    { import = 'plugins' },
}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})

require('config.lsp')
