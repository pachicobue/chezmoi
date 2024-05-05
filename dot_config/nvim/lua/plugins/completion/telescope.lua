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
            "<leader>g",
            function()
                require("telescope.builtin").live_grep({})
            end,
            desc = "[G]rep",
        },
    },
    config = function()
        require("telescope").setup({})
    end,
}
