local functions = require('functions')
-- See `:help vim.keymap.set()`

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Floating Neotree
vim.keymap.set('n', '<leader>o', '<cmd>Neotree float toggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rw', functions.replaceWord, { silent = true, desc = '[r]eplace [w]ord' })
vim.keymap.set('n', '<leader>cb', '<cmd>w | bd<CR>', { silent = true, desc = '[c]lose [b]uff' })

-- Paragraph jump focus places cursor in center
vim.keymap.set('n', '}', '}zz', { noremap = true, silent = true })
vim.keymap.set('n', '{', '{zz', { noremap = true, silent = true })

