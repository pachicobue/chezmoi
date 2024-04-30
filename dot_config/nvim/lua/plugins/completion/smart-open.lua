return {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
        require("telescope").load_extension("smart_open")
        local smartopen = require("telescope").extensions.smart_open
        vim.keymap.set("n", "<leader>ff", function()
            smartopen.smart_open({ cwd_only = true })
        end, { desc = "File [F]ind" })
        vim.keymap.set("n", "<leader>fr", function()
            smartopen.smart_open({ cwd_only = false })
        end, { desc = "File [R]ecent", noremap = true, silent = true })
    end,
    dependencies = {
        "kkharji/sqlite.lua",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
}
