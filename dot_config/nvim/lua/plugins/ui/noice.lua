return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup({
                    timeout = 300,
                    level = 3,
                })
            end,
        },
    },
    config = function()
        require("noice").setup({})
    end,
}
