return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        local Terminal = require("toggleterm.terminal").Terminal
        local common = Terminal:new({
            direction = "float",
            hidden = true,
        })
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            hidden = true,
            on_open = function(term)
                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<Cmd>close<CR>", { noremap = true, silent = true })
            end,
        })

        vim.keymap.set("n", "<leader>tt", function()
            common:toggle()
        end, { desc = "Toggle [T]erminal" })
        vim.keymap.set("n", "<leader>tg", function()
            lazygit:toggle()
        end, { desc = "Toggle [G]it" })
    end,
}
