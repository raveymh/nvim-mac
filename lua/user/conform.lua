return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua", lsp_format = "fallback" }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end
}
