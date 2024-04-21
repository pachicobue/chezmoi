return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        local Terminal = require("toggleterm.terminal").Terminal
        local common = Terminal:new({
            direction = "horizontal",
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

        function ToggleCommonTerm()
            common:toggle()
        end

        function ToggleLazygitTerm()
            lazygit:toggle()
        end

        vim.keymap.set("n", "<leader>tt", "<Cmd>lua ToggleCommonTerm()<CR>", { desc = "Toggle [T]erminal" })
        vim.keymap.set("n", "<leader>tg", "<Cmd>lua ToggleLazygitTerm()<CR>", { desc = "Toggle [G]it" })
    end,
}
