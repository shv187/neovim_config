vim.g.have_nerd_font = true

-- spaces instead of tabs
vim.opt.expandtab = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true

-- highlight col@120 so we can see desired max line length
vim.opt.colorcolumn = '120'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.mouse = 'a'

vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

vim.opt.showmode = false

vim.opt.breakindent = true

vim.opt.winborder = 'rounded'

-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en', 'pl' }

vim.opt.numberwidth = 2

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.scrolloff = 10

vim.opt.confirm = true

vim.opt.undofile = true

-- folding
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- is it even needed?
vim.wo.foldtext = ''

vim.opt.fillchars = {
    fold = ' ',
    foldclose = '',
    foldopen = '',
    foldsep = ' ',
    foldinner = ' ',
}
