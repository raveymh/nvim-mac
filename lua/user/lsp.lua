return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set(
					"n",
					"gh",
					"<cmd>lua vim.lsp.buf.hover()<cr>",
					vim.tbl_extend("force", opts, { desc = "Go hover" })
				)
				vim.keymap.set(
					"n",
					"gl",
					"<cmd>lua vim.diagnostic.open_float()<cr>",
					vim.tbl_extend("force", opts, { desc = "Show diagnostics" })
				)
				vim.keymap.set(
					{ "i" },
					"<C-k>",
					"<cmd>lua vim.lsp.buf.signature_help()<cr>",
					vim.tbl_extend("force", opts, { desc = "Signature" })
				)
				vim.keymap.set(
					"n",
					"<Leader>la",
					"<cmd>lua vim.lsp.buf.code_action()<cr>",
					vim.tbl_extend("force", opts, { desc = "Code Action" })
				)
			end,
		})

		-- local lspconfig_defaults = require("lspconfig").util.default_config
		-- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
		-- 	"force",
		-- 	lspconfig_defaults.capabilities,
		-- 	require("cmp_nvim_lsp").default_capabilities()
		-- )

		-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		-- vim.lsp.handlers["textDocument/signatureHelp"] =
		-- 	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

		local lsp_zero = require("lsp-zero")
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensured_installed = { "lua_ls" },
			handlers = {
				function(server_name)
					local opts = {}
					opts.on_attach = function(client, bufnr)
						if client.supports_method("textDocument/inlayHint") then
							vim.lsp.inlay_hint.enable(true)
						end
					end

					local require_ok, settings = pcall(require, "user.lspsettings." .. server_name)
					if require_ok then
						opts = vim.tbl_deep_extend("force", settings, opts)
					end

					lsp_zero.client_config(opts)
					require("lspconfig")[server_name].setup({})
				end,
			},
		})

		require("lspconfig")["gdscript"].setup({
			name = "godot",
			cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
		})
	end,
}
