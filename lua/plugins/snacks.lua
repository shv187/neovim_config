vim.pack.add({
    'https://github.com/folke/snacks.nvim',
}, { confirm = false })

require('snacks').setup({
    picker = {},
    dashboard = {
        sections = {
            { section = 'header' },
            { section = 'keys', gap = 1, padding = 1 },
            { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = { 2, 2 } },
            { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 2 },
        },
    },
    indent = {},
})
