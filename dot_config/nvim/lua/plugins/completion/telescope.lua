return {
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        -- Useful for getting pretty icons, but requires a Nerd Font.
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        -- Enable Telescope extensions if they are installed
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "File [F]ind" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "File [R]ecent" })
        vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "LSP [D]efinitions" })
        vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "LSP [R]eferences" })
        vim.keymap.set("n", "<leader>le", builtin.diagnostics, { desc = "LSP [E]rrors" })
    end,
}
