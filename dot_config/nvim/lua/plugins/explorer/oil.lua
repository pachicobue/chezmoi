return {
    "stevearc/oil.nvim",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>te",
            function()
                local cd = vim.fn.expand("%:p:h")
                require("oil").open_float(cd)
            end,
            desc = "Toggle [E]xplorer",
        },
    },
    opts = {
        keymaps = {
            ["<CR>"] = "actions.select",
            ["-"] = "actions.parent",
            ["q"] = "actions.close",
            ["<Esc>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["<space>"] = "actions.open_cwd",
            ["g."] = "actions.toggle_hidden",
        },
        view_options = {
            show_hidden = true,
        },
        use_default_keymaps = false,
    },
    config = function(_, opts)
        require("oil").setup(opts)
    end,
}
