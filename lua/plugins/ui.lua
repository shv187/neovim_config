--
-- File Tree
--
vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    {
        src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
        version = vim.version.range('3'),
    },
}, { confirm = false })

require('neo-tree').setup({
    close_if_last_window = true,
    popup_border_style = '',
    filesystem = {
        window = {
            mappings = {
                ['\\'] = 'close_window',
            },
        },
    },
})
vim.keymap.set('n', '\\', '<Cmd>Neotree reveal left<CR>')

--
-- TODO Highlighting
--
vim.pack.add({ 'https://github.com/folke/todo-comments.nvim' }, { confirm = false })
require('todo-comments').setup({ signs = false })

--
-- Yank Highlighting
--
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

--
-- Lua Line
--
vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim', 'https://github.com/nvim-tree/nvim-web-devicons' }, { confirm = false })
require('lualine').setup({
    options = {
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype', 'lsp_status' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { 'neo-tree' },
})

require('vim._core.ui2').enable({})
