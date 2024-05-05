return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            messages = {
                enabled = true,
                view = "mini",
            },
            notify = {
                enabled = true,
                view = "mini",
            },
        })
    end,
}
