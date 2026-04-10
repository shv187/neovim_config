local map = vim.keymap.set

-- clear highlight on esc after searching
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- may not work in all terminals, otherwise <C-\><C-n>
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ctrl + hjkl to switch windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- yank to clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })

-- delete without trashing register
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without trashing register' })

-- replace occurences of word under cursor
-- map('n', '<leader>fr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Find and replace word under cursor' })

-- better block moving
map('v', '<', '<gv')
map('v', '>', '>gv')

-- select everything
vim.keymap.set('n', '<leader>va', 'gg<S-V>G', { desc = 'Select everything' })

-- update
local function update_plugins()
    vim.pack.update(nil, { force = true })
end

vim.keymap.set('n', '<leader>pu', update_plugins, { desc = 'Update plugins' })
