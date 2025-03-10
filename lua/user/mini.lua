return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 42 })
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },
				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },
				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },
				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },
				-- Window commands
				{ mode = "n", keys = "<C-w>" },
				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				{ mode = "n", keys = "<Leader>b", desc = "+Buffers" },
				{ mode = "n", keys = "<Leader>f", desc = "+Find" },
				{ mode = "n", keys = "<Leader>g", desc = "+Git" },
				{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
				{ mode = "n", keys = "<Leader>s", desc = "+Search" },
				{ mode = "n", keys = "<Leader>u", desc = "+Toggle" },
				{ mode = "n", keys = "<Leader>c", desc = "+Change" },
				{ mode = "n", keys = "<Leader>q", desc = "Quit" },
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
			window = {
				delay = 20,
				config = {
					width = "auto",
					border = "double",
				},
			},
		})
		require("mini.move").setup()
		require("mini.surround").setup()
		require("mini.icons").setup()
		require("mini.operators").setup({
			exchange = { prefix = "me" },
			multiply = { prefix = "mm" },
			replace = { prefix = "mr" },
			sort = { prefix = "mS" },
		})
		require("mini.pairs").setup()
		require("mini.splitjoin").setup({ mappings = { toggle = "ms" } })
		require("mini.indentscope").setup({
			draw = { animation = require("mini.indentscope").gen_animation.linear({ duration = 35, unit = "total" }) },
			options = { try_as_border = true },

			-- Disable for certain filetypes
			vim.api.nvim_create_autocmd({ "FileType" }, {
				desc = "Disable indentscope for certain filetypes",
				callback = function()
					local ignore_filetypes = { "dashboard", "alpha", "oil" }
					if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
						vim.b.miniindentscope_disable = true
					end
				end,
			}),
		})
	end,
}
