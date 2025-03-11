local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"diff",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"toml",
			"typescript",
			"tsx",
			"vim",
			"vimdoc",
		},
		sync_install = false,
		auto_install = true,
		indent = { enable = true },
	})
end

return M
