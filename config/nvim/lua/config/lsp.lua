vim.cmd([[
  augroup FileTypeCLSToProgress
    autocmd!
    autocmd BufRead,BufNewFile *.cls set filetype=progress
  augroup END
]])

require('lspconfig').openedge_ls.setup({
    oe_jar_path = '/home/marcel/openedge/lsp.jar',
    dlc = '11.7:/mnt/c/Progress/DLC117-x32,12.2:/mnt/c/Progress/DLC122-x64', -- Version number and OpenEdge root directory (colon separator)
    debug = true, -- Set to true for debug logging
    trace = true, -- Set to true for trace logging (REALLY verbose)
    filetypes = { 'progress' },
})

require('lspconfig').tsserver.setup({})
require('lspconfig').tailwindcss.setup({})
require('lspconfig').eslint.setup({})

local lspconfig = require('lspconfig')
local lombok_jar_path = '/home/marcel/.m2/repository/org/projectlombok/lombok/1.18.30/lombok-1.18.30.jar'
lspconfig.jdtls.setup({
    cmd = {
        'java',
        '-javaagent:' .. lombok_jar_path,
        '-Xbootclasspath/a:' .. lombok_jar_path,
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
        '-jar',
        vim.fn.glob('/home/marcel/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration',
        '/home/marcel/.local/share/nvim/mason/packages/jdtls/config_linux',
        '-data',
        '/home/marcel/.cache/jdtls/workspace',
    },
    root_dir = function(fname)
        return require('lspconfig.util').find_git_ancestor(fname) or vim.fn.getcwd()
    end,
})
