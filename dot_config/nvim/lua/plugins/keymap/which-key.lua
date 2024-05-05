return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        local wk = require("which-key")
        wk.register({
            f = { name = "[F]ind" },
            t = { name = "[T]oggle" },
            l = { name = "[L]sp" },
        }, { prefix = "<leader>" })
    end,
}
