local functionVs = require('functionVs')
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
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Floating Neotree
vim.keymap.set('n', '<leader>n', '<cmd>Neotree reveal toggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rw', functionVs.replaceWord, { silent = true, desc = '[r]name [w]ord' })
vim.keymap.set('n', '<leader>sw', functionVs.surroundMacro, { silent = true, desc = '[r]name [w]ord' })
vim.keymap.set('n', '<C-n>', functionVs.findNextInstance, { silent = true, desc = 'next instance' })
vim.keymap.set('n', '<leader>fw', functionVs.grepCurrentWord, { silent = true, desc = 'next instance' })
vim.keymap.set('n', '<leader>rW', functionVs.findReplaceAllFiles, { silent = true, desc = 'find and replace all words' })
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
vim.keymap.set('n', '<leader>/', functionV()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffer Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>jm', require('telescope.builtin').marks, { desc = '[J]ump [M]ark' })


-- Harpoon
vim.keymap.set("n", "<leader>a", functionV() require("harpoon"):list():add() end)
vim.keymap.set("n", "<leader>o", functionV() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

vim.keymap.set("n", "<leader>1", functionV() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<leader>2", functionV() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<leader>3", functionV() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<leader>4", functionV() require("harpoon"):list():select(4) end)
vim.keymap.set("n", "<leader>5", functionV() require("harpoon"):list():select(5) end)
vim.keymap.set("n", "<leader>6", functionV() require("harpoon"):list():select(6) end)
vim.keymap.set("n", "<leader>7", functionV() require("harpoon"):list():select(7) end)
vim.keymap.set("n", "<leader>8", functionV() require("harpoon"):list():select(8) end)
vim.keymap.set("n", "<leader>9", functionV() require("harpoon"):list():select(9) end)


-- Toggle previous & next buffers stored within require("harpoon") list
vim.keymap.set("n", "<Tab>", functionV() require("harpoon"):list():prev() end)
vim.keymap.set("n", "<S-Tab>", functionV() require("harpoon"):list():next() end)

-- Debugger
-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F9>', require('dap').step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dq', require('dap').disconnect, { desc = 'Debug: Quit' })
vim.keymap.set('n', '<F7>', require('dapui').toggle, { desc = 'Debug: See last session result.' })
