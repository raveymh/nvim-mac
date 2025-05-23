local M = {
	"SmiteshP/nvim-navic",
	event = "BufReadPost",
}

function M.config()
	require("nvim-navic").setup({
		-- icons = icons.kind,
		highlight = true,
		lsp = {
			auto_attach = true,
		},
		click = true,

		depth_limit = 0,
		depth_limit_indicator = "..",
	})
end

return M
