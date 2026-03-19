--
-- Flash - first letters + label -> jump/select
--
vim.pack.add({
    'https://github.com/folke/flash.nvim',
}, { confirm = false })

vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
    require('flash').jump()
end, { desc = 'Flash' })

vim.keymap.set({ 'n', 'x', 'o' }, 'S', function()
    require('flash').treesitter()
end, { desc = 'Flash Treesitter' })
