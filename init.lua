require('misc.is_nixos')

vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')
require('keybinds')
require('plugins')
