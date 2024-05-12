return {
    "stevearc/oil.nvim",
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>e",
            function()
                local cd = vim.fn.expand("%:p:h")
                require("oil").open_float(cd)
            end,
            desc = "[E]xplorer",
        },
    },
    opts = {
        keymaps = {
            ["<CR>"] = "actions.select",
            ["q"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["g."] = "actions.toggle_hidden",
            ["g?"] = "actions.show_help",
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
