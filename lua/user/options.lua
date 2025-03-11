vim.loader.enable()
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone" } -- mostly just for cmp
vim.opt.cursorline = true -- highlight the current line
vim.opt.expandtab = false -- space/tab
vim.opt.hlsearch = false
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "   " }
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.o.mousescroll = "ver:3,hor:0" -- disable mouse horizontal scrolling
vim.opt.number = true -- set numbered lines
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.ruler = false
vim.opt.scrolloff = 15
vim.opt.shiftwidth = 4
vim.opt.shortmess:append("c")
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeout = true
vim.opt.timeoutlen = 690 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 200 -- faster completion (4000ms default)
vim.opt.wrap = false -- display lines as one long line
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
