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
				-- Enable completion triggered by typing
				-- client.server_capabilities.completionProvider = true -- This is usually enabled by default

				local bufmap = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true })
				end

				-- Standard LSP keymaps
				bufmap('n', 'K', vim.lsp.buf.hover)
				bufmap('n', 'gd', vim.lsp.buf.definition)
				bufmap('n', 'gD', vim.lsp.buf.declaration)
				bufmap('n', 'gi', vim.lsp.buf.implementation)
				bufmap('n', 'gr', vim.lsp.buf.references)
				bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
				bufmap('n', '<leader>rn', vim.lsp.buf.rename)
			end,
		})

		-- This ensures gopls is installed automatically by mason
		require('mason-lspconfig').setup_handlers {
			function(server_name) -- Default handler
				lspconfig[server_name].setup {
					capabilities = capabilities,
				}
			end,
			['gopls'] = function()
				-- The gopls setup is already defined above,
				-- so we can leave this empty to avoid overriding it.
			end,
		}
	end,
}
