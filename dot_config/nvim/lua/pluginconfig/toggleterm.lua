return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        local Terminal = require("toggleterm.terminal").Terminal
        local common = Terminal:new({
            direction = "vertical",
            hidden = true,
            size = vim.o.columns * 0.5,
        })
        local tig = Terminal:new({
            cmd = "tig status",
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

        function ToggleTigTerm()
            tig:toggle()
        end

        vim.keymap.set("n", "<leader>tt", "<Cmd>lua ToggleCommonTerm()<CR>", { desc = "Toggle [T]erminal" })
        vim.keymap.set("n", "<leader>tg", "<Cmd>lua ToggleTigTerm()<CR>", { desc = "Toggle [G]it" })
    end,
}
