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
        { "nvim-telescope/telescope-frecency.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "debugloop/telescope-undo.nvim" },
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
        pcall(require("telescope").load_extension, "frecency")
        pcall(require("telescope").load_extension, "undo")
        pcall(require("telescope").load_extension, "notify")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "File [F]ind" })
        vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope frecency<CR>", { desc = "File [R]ecent" })
        vim.keymap.set("n", "<leader>fu", "<Cmd>Telescope undo<CR>", { desc = "File [U]ndo" })
        vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "LSP [D]efinitions" })
        vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "LSP [R]eferences" })
        vim.keymap.set("n", "<leader>le", builtin.diagnostics, { desc = "LSP [E]rrors" })
    end,
}
