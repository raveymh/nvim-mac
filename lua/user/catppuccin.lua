local M = {
	"catppuccin/nvim",
	event = "VimEnter",
	name = "catppuccin",
	priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = false, -- disables setting the background color.
		term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = {},
		},
		-- color_overrides = {
		-- 	mocha = {
		-- 		base = "#22222e",
		-- 		surface1 = "#4e5c68",
		-- 		text = "#dae0f7",
		-- 		lavender = "#aeb7fe",
		-- 		mauve = "#dda6f7",
		-- 		blue = "#80c4ff",
		-- 	},
		-- },
		integrations = {
			alpha = true,
			blink_cmp = true,
			dap = true,
			dashboard = true,
			gitsigns = true,
			mini = {
				enabled = true,
				indentscope_color = "surface2",
			},
			notify = true,
			snacks = true,
			treesitter = true,
			ufo = true,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
