-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = functionV()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
