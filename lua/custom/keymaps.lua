local functions = require('custom.functions')
-- See `:help vim.keymap.set()`

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Save file
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, desc = 'Save file' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Floating Neotree
vim.keymap.set('n', '<leader>o', '<cmd>Neotree float toggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rw', functions.replaceWord, { silent = true, desc = '[r]name [w]ord' })
vim.keymap.set('n', '<leader>cb', '<cmd>w | bd<CR>', { silent = true, desc = '[c]lose [b]uff' })

-- Paragraph jump focus places cursor in center
vim.keymap.set('n', '}', '}zz', { noremap = true, silent = true })
vim.keymap.set('n', '{', '{zz', { noremap = true, silent = true })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Window resize
vim.keymap.set('n', '<C-Up>', "<cmd>resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', "<cmd>resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
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
vim.keymap.set('n', '<leader>s/', functions.telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffer Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


-- Debugger
-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<leader>dc', require('dap').continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>do', require('dap').step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>de', require('dap').step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
	require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })
vim.keymap.set('n', '<leader>dq', require('dap').disconnect, { desc = 'Debug: Quit' })
vim.keymap.set('n', '<F7>', require('dapui').toggle, { desc = 'Debug: See last session result.' })
