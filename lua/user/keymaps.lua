local opts = { noremap = true, silent = true }

-- leader key
vim.keymap.set("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- quit
vim.keymap.set("n", "<Leader>q", "<Esc>:q!<CR>", vim.tbl_extend("force", opts, { desc = "Quit" }))

-- center search
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

-- quick Search
vim.keymap.set(
	{ "n" },
	"gs",
	"/<C-R>=expand('<cword>')<CR><CR>",
	vim.tbl_extend("force", opts, { desc = "Search word" })
)

-- keep pasting
vim.keymap.set("x", "p", [["_dP]])

-- keep indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- go start/end of line
vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", opts)
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", opts)
vim.keymap.set({ "n", "o", "x" }, "<s-j>", "<C-d>", opts)
vim.keymap.set({ "n", "o", "x" }, "<s-k>", "<C-u>", opts)

-- go next/prev indent
vim.keymap.set({ "n", "o", "x" }, "<C-n>", "}", opts)
vim.keymap.set({ "n", "o", "x" }, "<C-p>", "{", opts)

-- go matching
vim.keymap.set({ "n", "o", "x" }, "mm", "%", vim.tbl_extend("force", opts, { desc = "Go matching char" }))

-- find
vim.keymap.set({ "n", "x" }, "<D-f>", "/", opts)

-- save
vim.keymap.set({ "n", "i" }, "<D-s>", "<Esc><cmd>w<CR>", opts)

-- vim.keymap.set({ "n", "v", "x", "o" }, "q", "<Nop>") -- stop macro
vim.keymap.set({ "n", "v", "x" }, "+", "<C-a>", opts)
vim.keymap.set({ "n", "v", "x" }, "_", "<C-x>", opts)

vim.keymap.set("n", "<BS>", ":b#<CR>", { silent = true })

-- mousemenu
vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
vim.cmd([[:amenu 10.120 mousemenu.-sep- *]])

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set({ "n", "x" }, "gx", "gx", { desc = "Go to Link" })
