vim.pack.add({
    { src = 'https://github.com/catppuccin/nvim.git', name = 'catppuccin' },
    { src = 'https://github.com/vague2k/vague.nvim', name = 'vague' },
    { src = 'https://github.com/luisiacc/gruvbox-baby', name = 'gruvbox-baby' },
    { src = 'https://github.com/rebelot/kanagawa.nvim', name = 'kanagawa' },
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },
    { src = 'https://github.com/folke/tokyonight.nvim', name = 'tokyonight' },
    { src = 'https://github.com/ellisonleao/gruvbox.nvim', name = 'gruvbox' },
    { src = 'https://github.com/Mofiqul/vscode.nvim', name = 'vscode' },
    { src = 'https://github.com/sainnhe/sonokai', name = 'sonokai' },
    { src = 'https://github.com/projekt0n/github-nvim-theme', name = 'github' },
    { src = 'https://github.com/EdenEast/nightfox.nvim', name = 'nightfox' },
    { src = 'https://github.com/projekt0n/github-nvim-theme', name = 'github' },
    { src = 'https://github.com/slugbyte/lackluster.nvim', name = 'lackluster' },
    { src = 'https://github.com/wtfox/jellybeans.nvim', name = 'jellybeans' },
    { src = 'https://github.com/sainnhe/gruvbox-material', name = 'gruvbox-material' },
    { src = 'https://github.com/thesimonho/kanagawa-paper.nvim', name = 'kanagawa-paper' },
    { src = 'https://github.com/webhooked/kanso.nvim', name = 'kanso' },
}, { confirm = false })

local kanagawa_style = { italic = false, bold = false }
require('kanagawa').setup({
    commentStyle = kanagawa_style,
    functionStyle = kanagawa_style,
    keywordStyle = kanagawa_style,
    statementStyle = kanagawa_style,
    typeStyle = kanagawa_style,

    dimInactive = true,

    overrides = function(colors) -- add/modify highlights
        local theme = colors.theme

        local makeDiagnosticColor = function(color)
            local c = require('kanagawa.lib.color')
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end

        return {
            BlinkCmpMenu = { bg = 'none' },
            BlinkCmpDoc = { bg = 'none' },
            BlinkCmpMenuBorder = { bg = 'none' },
            BlinkCmpDocBorder = { bg = 'none' },

            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
    end,
})

if _G.is_nixos then
    vim.cmd.colorscheme('gruvbox')
else
    vim.cmd.colorscheme('kanagawa')
end
