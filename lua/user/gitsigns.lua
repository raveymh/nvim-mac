return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",

	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signcolumn = true,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- normal mode
			map("n", "<leader>gr", gitsigns.reset_buffer, { desc = "Reset buffer" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
			map("n", "<leader>gD", gitsigns.diffthis, { desc = "Diff against index" })
			map("n", "<leader>gd", function()
				gitsigns.diffthis("@")
			end, { desc = "Diff against last commit" })
			-- Toggles
			map("n", "<leader>ux", gitsigns.toggle_deleted, { desc = "Deleted" })
			map("n", "<leader>ug", gitsigns.toggle_signs, { desc = "Gitsigns" })
		end,
	},
}
