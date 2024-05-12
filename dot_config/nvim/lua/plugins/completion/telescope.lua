return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "ahmedkhalf/project.nvim",
        "xvzc/chezmoi.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep({})
            end,
            desc = "Find [G]rep",
        },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({})
            end,
            desc = "Find [F]ile",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers({})
            end,
            desc = "Find [B]uffer",
        },
    },
    config = function()
        require("telescope").setup({})
    end,
}
