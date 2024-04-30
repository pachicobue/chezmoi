return {
    -- Fuzzy Finder (files, lsp, etc)
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
        { "debugloop/telescope-undo.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        {
            "danielfalk/smart-open.nvim",
            branch = "0.2.x",
            dependencies = { "kkharji/sqlite.lua" },
        },
        { "nvim-telescope/telescope-project.nvim" },
        { "jvgrootveld/telescope-zoxide" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
                file_browser = {
                    hijack_netrw = true,
                    hidden = { file_browser = true, folder_browser = true },
                    mappings = {
                        ["i"] = {},
                        ["n"] = {},
                    },
                },
                zoxide = {
                    prompt_title = "[ Walking on the shoulders of TJ ]",
                    mappings = {
                        default = {
                            after_action = function(selection)
                                print("Update to (" .. selection.z_score .. ") " .. selection.path)
                            end,
                        },
                        ["<C-s>"] = {
                            before_action = function(selection)
                                print("before C-s")
                            end,
                            action = function(selection)
                                vim.cmd.edit(selection.path)
                            end,
                        },
                        -- Opens the selected entry in a new split
                        ["<C-q>"] = {
                            action = require("telescope._extensions.zoxide.utils").create_basic_command("split"),
                        },
                    },
                },
            },
        })
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "undo")
        pcall(require("telescope").load_extension, "notify")
        pcall(require("telescope").load_extension, "file_browser")
        pcall(require("telescope").load_extension, "project")
        pcall(require("telescope").load_extension, "zoxide")
        pcall(require("telescope").load_extension, "smart_open")

        vim.keymap.set("n", "<leader>fn", "<Cmd>Telescope notify<CR>", { desc = "File [N]otify" })
        vim.keymap.set("n", "<leader>fu", "<Cmd>Telescope undo<CR>", { desc = "File [U]ndo" })

        local filebrowser = require("telescope").extensions.file_browser
        vim.keymap.set("n", "<leader>fb", function()
            filebrowser.file_browser()
        end, { desc = "File [B]rowser" })

        local zoxide = require("telescope").extensions.zoxide
        vim.keymap.set("n", "<leader>fz", zoxide.list, { desc = "File [Z]oxide" })

        local project = require("telescope").extensions.project
        vim.keymap.set("n", "<leader>fp", function()
            project.project({})
        end, { desc = "File [P]roject" })

        local smartopen = require("telescope").extensions.smart_open
        vim.keymap.set("n", "<leader>ff", function()
            smartopen.smart_open({ cwd_only = true })
        end, { desc = "File [F]ind" })
        vim.keymap.set("n", "<leader>fr", function()
            smartopen.smart_open({ cwd_only = false })
        end, { desc = "File [R]ecent" })
    end,
}
