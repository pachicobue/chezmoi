return {
    "rapan931/lasterisk.nvim",
    keys = {
        {
            "*",
            mode = { "n", "x" },
            function()
                require("lasterisk").search({ is_whole = false })
            end,
        },
        {
            "g*",
            mode = { "n", "x" },
            function()
                require("lasterisk").search()
            end,
        },
    },
}
