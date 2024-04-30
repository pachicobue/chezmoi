return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "rcarriga/nvim-notify",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        {
            "danielfalk/smart-open.nvim",
            branch = "0.2.x",
            dependencies = { "kkharji/sqlite.lua" },
        },
        { "jvgrootveld/telescope-zoxide" },
        {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup({
                    detection_methods = { "pattern", "lsp" },
                    patterns = { ".git", ".project", ".project.nvim" },
                    silent_chdir = true,
                    show_hidden = true,
                })
            end,
        },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "notify")
        pcall(require("telescope").load_extension, "projects")
        pcall(require("telescope").load_extension, "smart_open")
        pcall(require("telescope").load_extension, "zoxide")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fg", function()
            builtin.live_grep({})
        end, { desc = "File [G]rep" })

        local notify = require("telescope").extensions.notify
        vim.keymap.set("n", "<leader>fn", function()
            notify.notify({})
        end, { desc = "File [N]otify" })

        local projects = require("telescope").extensions.projects
        vim.keymap.set("n", "<leader>fp", function()
            projects.projects({})
        end, { desc = "File [P]roject" })

        local smartopen = require("telescope").extensions.smart_open
        vim.keymap.set("n", "<leader>ff", function()
            smartopen.smart_open({ cwd_only = true })
        end, { desc = "File [F]ind" })
        vim.keymap.set("n", "<leader>fr", function()
            smartopen.smart_open({ cwd_only = false })
        end, { desc = "File [R]ecent" })

        local zoxide = require("telescope").extensions.zoxide
        vim.keymap.set("n", "<leader>fz", function()
            zoxide.list({})
        end, { desc = "File [Z]oxide" })
    end,
}
