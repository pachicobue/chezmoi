return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local npair = require("nvim-autopairs")
        npair.setup({
            check_ts = true,
            enable_check_bracket_line = true,
            fast_wrap = {},
        })
    end,
}
