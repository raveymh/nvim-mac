return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },

	config = function()
		require("typescript-tools").setup({
			settings = {
				tsserver_format_options = {
					tabSize = 4,
					indentSize = 4,
					convertTabsToSpaces = false,
					semicolons = "insert",
				},
			},
		})
	end,
}
