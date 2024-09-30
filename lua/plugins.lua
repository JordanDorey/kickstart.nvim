-- Installs lazy if not installed
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	require('plugins.lspconfig'),
	require('plugins.tokyonight'),
	require('plugins.lualine'),
	require('plugins.telescope'),
	require('plugins.treesitter'),
	require('plugins.neo-tree'),
	require('plugins.autoformat'),
	require('plugins.debug'),
	require('plugins.cmp'),
	require('plugins.luasnip'),
	require('plugins.cmp_luasnip'),
	require('plugins.auto_pairs'),
	require('plugins.vim_sleuth'),
	require('plugins.git_signs'),
	require('plugins.lazydev'),
	require('plugins.nvim_lsp'),
	{ "rafamadriz/friendly-snippets" },
	{ 'numToStr/Comment.nvim' },
	{ 'tpope/vim-fugitive' },
	{ "typicode/bg.nvim",            lazy = false },
	{ 'windwp/nvim-autopairs',       event = "InsertEnter" },
	{ 'Bilal2453/luvit-meta',        lazy = true },
}, {})
