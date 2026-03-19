vim.pack.add({ 'http://github.com/stevearc/conform.nvim' }, { confirm = false })

local conform = require('conform')
conform.setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        python = { 'ruff_format' },
    },
    format_on_save = function(bufnr)
        local disabled_filetypes = { c = true, cpp = true }

        if disabled_filetypes[vim.bo[bufnr].filetype] then
            return nil
        else
            return {
                timeout_ms = 500,
                lsp_format = 'fallback',
            }
        end
    end,
})

vim.keymap.set('n', '<leader>f', function()
    conform.format({ async = true })
end, { desc = 'Format file' })
