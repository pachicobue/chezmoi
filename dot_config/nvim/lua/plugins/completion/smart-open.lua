return {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
        "kkharji/sqlite.lua",
        "nvim-telescope/telescope-fzy-native.nvim",
    },
    keys = {
        {
            "<leader>fr",
            function()
                local smartopen = require("telescope").extensions.smart_open
                smartopen.smart_open({ cwd_only = true })
            end,
            desc = "Find [R]ecent",
        },
    },
    config = function()
        require("telescope").load_extension("smart_open")
    end,
}
