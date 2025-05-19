local excluded = {
	"node_modules/",
	"bower_components/",
	"dist/",
	".git/",
	".gitlab/",
	"build/",
	"temp/",
	"library/",
	"target/",
	"local/",
	".local/",
	".cache/",
	"**/.DS_Store",

	"*.meta",
	"package-lock.json",
}
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	---@module "snacks"
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		dim = { enbaled = true },
		explorer = { enabled = true },
		image = { enabled = true },
		input = { enabled = true },
		layout = { enabled = true },
		lazygit = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		notify = { enabled = true },
		picker = {
			enabled = true,
			layout = { preset = "dropdown" },
			hidden = true,
			ignored = true,
			-- win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
			exclude = excluded,
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		styles = {
			notification = {
				-- wo = { wrap = true } -- Wrap notifications
			},
		},
		toggle = { enabled = true },
		util = { enabled = true },
		-- words = { enabled = true },
	},

	keys = {
		-- Top Pickers & Explorer
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer({ jump = { close = true }, layout = { layout = { position = "right" } } })
			end,
			desc = "Explorer",
		},
		-- find
		{
			"<D-p>",
			function()
				Snacks.picker.smart({})
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>bb",
			function()
				Snacks.picker.buffers({ layout = { preset = "select" }, focus = "list" })
			end,
			desc = "Buffers",
		},
		{
			"<D-b>",
			function()
				Snacks.picker.buffers({ layout = { preset = "select" }, focus = "list" })
			end,
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files({ focus = "list" })
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects({ focus = "list" })
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent({ focus = "list" })
			end,
			desc = "Recent",
		},
		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches({ focus = "list" })
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log({ focus = "list" })
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line({ focus = "list" })
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status({ focus = "list" })
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		-- Search
		{
			"<leader>sb",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics_buffer({ focus = "list" })
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics({ focus = "list" })
			end,
			desc = "Project Diagnostics",
		},
		{
			"<D-S-f>",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			'<leader>s"',
			function()
				Snacks.picker.registers({ focus = "list" })
			end,
			desc = "Registers",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history({ focus = "list" })
			end,
			desc = "Command History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands({ focus = "list" })
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics({ focus = "list" })
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>d",
			function()
				Snacks.picker.diagnostics_buffer({ focus = "list" })
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help({ focus = "list" })
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights({ focus = "list" })
			end,
			desc = "Highlights",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>s'",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>s?",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist({ focus = "list" })
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.colorschemes({ focus = "list" })
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>st",
			function()
				Snacks.picker.treesitter({ focus = "list" })
			end,
			desc = "Treesitter",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.resume({ focus = "list" })
			end,
			desc = "Resume",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions({ focus = "list" })
			end,
			desc = "Go to Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations({ focus = "list" })
			end,
			desc = "Go to Declaration",
		},
		{
			"gR",
			function()
				Snacks.picker.lsp_references({ focus = "list" })
			end,
			nowait = true,
			noremap = true,
			silent = true,
			desc = "References",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations({ focus = "list" })
			end,
			desc = "Go to Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions({ focus = "list" })
			end,
			desc = "Go to T[y]pe Definition",
		},
		{
			"<D-o>",
			function()
				Snacks.picker.lsp_symbols({ focus = "list" })
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols({ focus = "list" })
			end,
			desc = "LSP Workspace Symbols",
		},
		-- BufDelete
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete all other buffers",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete.all()
			end,
			desc = "Delete all buffers",
		},
		-- Other
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Zen Mode",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history({ focus = "list" })
			end,
			desc = "Notifications",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse({ focus = "list" })
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
	},

	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ul")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>uL")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
