vim.pack.add({
    'https://github.com/vyfor/cord.nvim',
}, { confirm = false })

require('cord').setup({
    plugins = {
        'cord.plugins.diagnostics', -- Enable the diagnostics plugin

        ['cord.plugins.diagnostics'] = { -- Configure diagnostics plugin
            scope = 'workspace', -- Set scope to 'workspace' instead of default 'buffer'
            severity = vim.diagnostic.severity.WARN, -- Show warnings and above
        },

        'cord.plugins.persistent_timer',
        ['cord.plugins.persistent_timer'] = {
            scope = 'workspace', -- 'workspace', 'file', 'filetype', or 'global'
            mode = 'all', -- 'all', 'active', or 'idle'
            file = vim.fn.stdpath('data') .. '/cord/plugins/persistent_timer/data.json', -- Path to the timer data file
            save_on = { 'exit', 'focus_change', 'periodic' }, -- Events that trigger a save
            save_interval = 30, -- Interval in seconds for periodic saves
        },
    },
})
