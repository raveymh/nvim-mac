local M = {
    "stevearc/oil.nvim"
}

function M.config()
    require("oil").setup({
        float = {
            max_height = 21,
            max_width = 69,
        }
    })
    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
end

return M
