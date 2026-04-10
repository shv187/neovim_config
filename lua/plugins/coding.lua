--
-- Treesitter
--
vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' } }, { confirm = false })

require('nvim-treesitter.configs').setup({
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

--
-- LazyDev
--
vim.pack.add({ 'http://github.com/folke/lazydev.nvim' }, { confirm = false })

require('lazydev').setup({
    library = {
        { path = 'snacks.nvim', words = { 'Snacks' } },
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
})

--
-- Blink
--
vim.pack.add({
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('1.*'),
    },
}, { confirm = false })

require('blink.cmp').setup({
    keymap = {
        preset = 'default',
    },

    cmdline = {
        enabled = true,
        keymap = { preset = 'inherit' },
        completion = {
            menu = {
                auto_show = function(_)
                    return vim.fn.getcmdtype() == ':'
                end,
            },
        },
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = {
                border = 'rounded',
            },
        },
        menu = {
            border = 'rounded',
            draw = { gap = 2 },
        },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
            lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
            cmdline = {
                min_keyword_length = function(ctx)
                    if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
                        return 3
                    end
                    return 0
                end,
            },
        },
    },

    fuzzy = {
        implementation = 'rust',
    },

    signature = { enabled = true },
})

--
-- Mason
--
vim.pack.add({
    -- lsp
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'http://github.com/neovim/nvim-lspconfig' },
}, { confirm = false })

local language_servers = {
    'lua_ls',
    'clangd',
    'pyrefly',
}

local formatters = {
    'stylua',
    'clang-format',
    'ruff',
}

local linters = {
    -- todo
}

require('mason').setup()

if not _G.is_nixos then
    local tools_to_install = {}

    for _, tool in ipairs(language_servers) do
        table.insert(tools_to_install, tool)
    end

    for _, tool in ipairs(formatters) do
        table.insert(tools_to_install, tool)
    end

    for _, tool in ipairs(linters) do
        table.insert(tools_to_install, tool)
    end

    require('mason-tool-installer').setup({
        ensure_installed = tools_to_install,
        auto_update = true,
        run_on_start = true,
    })
end

--
-- LSP Configs
--
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true), -- add vim to lua_ls runtime path (recognizes `vim` global)
            },
        },
    },
})

vim.lsp.config('clangd', {
    cmd = {
        'clangd',
        '-j=4',
        '--background-index',
        '--header-insertion=never',
        '--completion-style=detailed',
    },
})

-- vim.diagnostic.config({ virtual_text = true })

local sev = vim.diagnostic.severity

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    update_in_insert = false,
    float = {
        border = 'rounded',
        source = true,
    },
    signs = {
        text = {
            [sev.ERROR] = 'E',
            [sev.WARN] = 'W',
            [sev.INFO] = 'I',
            [sev.HINT] = 'H',
        },
    },
})

vim.lsp.inlay_hint.enable = true
vim.lsp.inline_completion.enable()

vim.lsp.enable(language_servers)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client then
            vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { buffer = ev.buf, desc = 'vim.lsp.buf.definition()' })

            vim.keymap.set('n', 'grs', Snacks.picker.lsp_symbols, { desc = 'Pick [s]ymbols' })

            vim.keymap.set('n', 'grr', Snacks.picker.lsp_references, { desc = 'Pick [r]eference' })
        end
    end,
})

--
-- Keybinds visualization
--
vim.pack.add({ 'https://github.com/folke/which-key.nvim' }, { confirm = false })

require('which-key').setup({
    spec = {
        { '<leader>s', group = '[S]earch', icon = { icon = '', color = 'green' } },
    },
})
--

--
-- Folding
--
vim.pack.add({ 'https://github.com/kevinhwang91/promise-async', 'https://github.com/kevinhwang91/nvim-ufo' }, { confirm = false })

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup()
--

-- TODO: Allow building on <leader>b
-- or smth, i want also a build->run cmd
