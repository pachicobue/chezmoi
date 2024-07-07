return {
    "kevinhwang91/nvim-bqf",
    config = function()
        require("bqf").setup({
            auto_enable = true,
            preview = {
                auto_preview = true,
            },
        })
    end,
}
