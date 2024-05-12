return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({})
        vim.keymap.set({ "n", "i" }, "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Tab" })
        vim.keymap.set({ "n", "i" }, "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Tab" })
        vim.keymap.set({ "n" }, "L", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Tab" })
        vim.keymap.set({ "n" }, "H", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Tab" })
    end,
}
