return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},
	config = function()
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['jj'] = require('telescope.actions').close,
					},
				},
				layout = 'bottom',
				layout_strategies = 'vertical',
				layout_config = {
					horizontal = {
						width = 0.6,
						height = 0.7,
						prompt_position = "bottom",
						preview_cutoff = 20,
						preview_width = 0.80,
					},
				},
				sorting_strategy = "ascending",
				path_display = { "smart" },
				winblend = 10,
			}
		}

		-- Enable telescope fzf native, if installed
		pcall(require('telescope').load_extension, 'fzf')
	end
}
