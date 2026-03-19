return {
    on_attach = {
        vim.keymap.set('n', '<leader>ch', '<cmd>LspClangdSwitchSourceHeader<cr>', { desc = 'Switch between source / header' }),
    },
}
