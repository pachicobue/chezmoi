return {
    {
        "cocopon/iceberg.vim",
        enabled = true,
        lazy = false,
        config = function()
            vim.cmd([[colorscheme iceberg]])
            vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
            vim.cmd([[hi Comment gui=italic]])
        end,
    },
}
