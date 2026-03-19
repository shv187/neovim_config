vim.pack.add({
    'https://github.com/echasnovski/mini.nvim',
}, { confirm = false })

-- alt + hjkl - text movement
require('mini.move').setup()

-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()

-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup({ n_lines = 500 })

-- auto pairs ([{
require('mini.pairs').setup()
