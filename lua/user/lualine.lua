local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

function M.config()
	require("lualine").setup({
		options = {
			theme = "catppuccin",
			icons_enabled = true,
			ignore_focus = {},
			disabled_filetypes = {
				statusline = { "alpha", "lazygit" },
				winbar = {},
			},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "progress", "filetype" },
			lualine_z = { { "os.date('%I:%M %p')" } },
		},
		inactive_winbar = {},

		extensions = { "quickfix", "man", "fugitive", "mason", "oil", "trouble" },
	})
end

return M
