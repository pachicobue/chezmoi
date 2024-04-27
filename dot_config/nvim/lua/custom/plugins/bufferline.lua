return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            vim.keymap.set("n", "gt", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true }),
            vim.keymap.set("n", "gT", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true }),
            vim.keymap.set("n", "<C-Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true }),
            vim.keymap.set("n", "<C-S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true }),
        })
    end,
}
