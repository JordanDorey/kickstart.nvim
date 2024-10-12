return {
	-- Colour Theme
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require('tokyonight').setup { style = 'storm'
		}
		require('tokyonight').load()
	end,
}
