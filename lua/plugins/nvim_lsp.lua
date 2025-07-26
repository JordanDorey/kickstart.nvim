return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim', config = true }, -- Must be loaded before dependants
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		{ 'j-hui/fidget.nvim',       opts = {} },

		-- Autocompletion integration
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		-- This gets the capabilities required by nvim-cmp
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- Get the lspconfig plugin
		local lspconfig = require('lspconfig')

		-- Configure gopls
		lspconfig.gopls.setup({
			-- Pass the capabilities from nvim-cmp
			capabilities = capabilities,

			-- Custom settings for gopls
			settings = {
				gopls = {
					-- Additional filetypes for gopls to attach to
					gofumpt = true,
					staticcheck = true,
					analyses = {
						unusedparams = true,
					},
				},
			},

			-- Keymaps and other on_attach logic
			on_attach = function(client, bufnr)
				print("LSP is now active!")
				local telescope = require('telescope.builtin')
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
				vim.keymap.set('n', 'gd', telescope.lsp_definitions, {})
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
				vim.keymap.set('n', 'gi', telescope.lsp_implementations, {})
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
			end,
		})

		-- -- This ensures gopls is installed automatically by mason
		require('mason-lspconfig').setup {
			function(server_name) -- Default handler
				lspconfig[server_name].setup {
					capabilities = capabilities,
				}
			end,
		}
	end,
}
