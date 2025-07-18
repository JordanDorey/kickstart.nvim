-- Set highlight on search
vim.o.hlsearch = false

-- Line numbers
vim.wo.nu = true

-- Relative lines
vim.wo.rnu = true

-- Disable spell check
vim.o.spell = false

-- Enable mouse mode
vim.o.mouse = ''

-- Menu transparency
vim.o.pb = 50

vim.g.have_nerd_font = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Set tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 1000

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.cursorline = true

vim.opt.scrolloff = 10

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Neovide settings
vim.o.guifont = "FiraCode Nerd Font Mono:h11"
vim.opt.linespace = 5
vim.g.neovide_padding_top = 20
vim.g.neovide_padding_bottom = 20
vim.g.neovide_padding_right = 20
vim.g.neovide_padding_left = 20
