return {
    -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        require("which-key").setup()

        -- Document existing key chains
        require("which-key").register({
            ["<leader>f"] = { name = "[F]ile", _ = "which_key_ignore" },
            ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
            ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
        })
        vim.keymap.set("n", "<leader>fs", "<Cmd>:w<CR>")
        vim.keymap.set("n", "<leader>fd", "<Cmd>:bd<CR>")
    end,
}
