return {
	-- Colour Theme
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = functionV()
		require('tokyonight').setup { style = 'storm'
		}
		require('tokyonight').load()
	end,
}
