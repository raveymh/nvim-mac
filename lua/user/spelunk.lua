return {
	"EvWilson/spelunk.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- For window drawing utilities
	},

	config = function()
		require("spelunk").setup({
			enable_persist = true,
		})
	end,
}
