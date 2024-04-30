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
        {
            "nvim-telescope/telescope-file-browser.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
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
            },
        })
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "undo")
        pcall(require("telescope").load_extension, "notify")
        pcall(require("telescope").load_extension, "file_browser")

        vim.keymap.set("n", "<leader>fn", "<Cmd>Telescope notify<CR>", { desc = "File [N]otify" })
        vim.keymap.set("n", "<leader>fu", "<Cmd>Telescope undo<CR>", { desc = "File [U]ndo" })
        vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>", { desc = "File [B]rowser" })
    end,
}
