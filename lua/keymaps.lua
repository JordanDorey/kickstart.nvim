local functions = require('functions')
-- See `:help vim.keymap.set()`

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Save file
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, desc = 'Save file' })

-- jj to esc
vim.keymap.set('i', 'jj', '<esc>', { silent = true })
vim.keymap.set('i', 'kk', '<esc>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, { noremap = true, desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })

-- Floating Neotree
vim.keymap.set('n', '<leader>n', '<cmd>Neotree reveal toggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rw', functions.replaceWord, { silent = true, desc = '[r]ename [w]ord' })
vim.keymap.set('n', '<leader>sw', functions.surroundMacro, { silent = true, desc = '[s]urrund [w]ord' })
vim.keymap.set('n', '<leader>fw', functions.grepCurrentWord, { silent = true, desc = '[f]ind [w]ord' })
vim.keymap.set('n', '<leader>ra', functions.findReplaceAllFiles, { silent = true, desc = 'find and replace all words' })
vim.keymap.set('n', '<leader>wl', functions.liveGrepList, { silent = true, desc = '[w]ord [l]ist' })
vim.keymap.set('n', '<leader>bd', '<cmd>w | bp | bd #<CR>', { silent = true, desc = '[b]uffer [d]elete' })

-- Paragraph jump focus places cursor in center
vim.keymap.set('n', '}', '}zz', { noremap = true, silent = true })
vim.keymap.set('n', '{', '{zz', { noremap = true, silent = true })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', 'gb', '<cmd>b#<CR>')

-- Window resize
vim.keymap.set('n', '<M-k>', "<cmd>resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<M-j>', "<cmd>resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<M-h>', "<cmd>vertical resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<M-l>', "<cmd>vertical resize +5<CR>", { noremap = true, silent = true })

--Buff split
vim.keymap.set('n', '<leader>bl', "<cmd>vs<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bj', "<cmd>sp<CR>", { noremap = true, silent = true })

-- Grep word
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { desc = '[F]ind [R]eferences' })

vim.keymap.set('n', '<leader>lg', '<cmd>Telescope live_grep only_sort_text=true<cr>')

-- Telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
	{ desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files, { desc = '[ ] Find files' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>bs', require('telescope.builtin').buffers, { desc = '[B]uffer [S]earch' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>se', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>jm', require('telescope.builtin').marks, { desc = '[J]ump [M]ark' })
vim.keymap.set('n', '<leader>km', require('telescope.builtin').keymaps, { desc = 'test' })

-- Debugger
-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F9>', require('dap').step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dq', require('dap').disconnect, { desc = 'Debug: Quit' })
vim.keymap.set('n', '<F7>', require('dapui').toggle, { desc = 'Debug: See last session result.' })
