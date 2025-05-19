return {
	"pmizio/typescript-tools.nvim",
	event = { "BufReadPost *.ts,*.tsx,*.js,*.jsx", "BufNewFile *.ts,*.tsx,*.js,*.jsx" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },

	config = function()
		require("typescript-tools").setup({
			settings = {
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "none",
					includeInlayVariableTypeHints = false,
					includeInlayFunctionLikeReturnTypeHints = false,
				},
				tsserver_format_options = {
					tabSize = 4,
					indentSize = 4,
					convertTabsToSpaces = false,
					semicolons = "insert",
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.ts,*.tsx",
			callback = function()
				vim.cmd("TSToolsOrganizeImports")
			end,
		})

		vim.keymap.set(
			"n",
			"<Leader>lr",
			"<cmd>TSToolsFileReferences<CR>",
			{ noremap = true, silent = true, desc = "File References" }
		)
		vim.keymap.set(
			"n",
			"<Leader>lR",
			"<cmd>TSToolsRenameFile<CR>",
			{ noremap = true, silent = true, desc = "Rename file" }
		)
		vim.keymap.set(
			"n",
			"<Leader>ld",
			"<cmd>TSToolsGoToSourceDefinition<CR>",
			{ noremap = true, silent = true, desc = "Go to Source Definition" }
		)
		vim.keymap.set(
			"n",
			"<Leader>lf",
			"<cmd>TSToolsFixAl<CR>",
			{ noremap = true, silent = true, desc = "Fix all errors" }
		)
		vim.keymap.set(
			"n",
			"<Leader>li",
			"<cmd>TSToolsAddMissingImports<CR>",
			{ noremap = true, silent = true, desc = "Add missing imports" }
		)
		vim.keymap.set(
			"n",
			"<Leader>lo",
			"<cmd>TSToolsOrganizeImports<CR>",
			{ noremap = true, silent = true, desc = "Organize imports" }
		)
	end,
}
