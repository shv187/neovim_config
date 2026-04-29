--
-- Better Terminal
--
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('term_start', { clear = true }),
    pattern = '*',
    callback = function()
        vim.wo.relativenumber = false
        vim.wo.number = false

        vim.cmd('startinsert')
    end,
})

--
-- Resize all windows on neovim resize
--
vim.api.nvim_create_autocmd('VimResized', {
    group = vim.api.nvim_create_augroup('win_autoresize', { clear = true }),
    desc = 'autoresize windows on resizing operation',
    command = 'wincmd =',
})
