return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({})
        local Terminal = require("toggleterm.terminal").Terminal
        local common = Terminal:new({
            direction = "float",
            hidden = true,
        })
        local lazygit = Terminal:new({
            cmd = "lazygit",
            direction = "float",
            hidden = true,
            on_open = function(term)
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<Cmd>close<CR>", { noremap = true, silent = true })
            end,
        })

        vim.keymap.set({ "n", "i", "t" }, "<C-t>", function()
            common:toggle()
        end)
        vim.keymap.set({ "n", "i", "t" }, "<C-g>", function()
            lazygit:toggle()
        end)
    end,
}
