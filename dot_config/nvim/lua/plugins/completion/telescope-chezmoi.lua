return {
    "xvzc/chezmoi.nvim",
    keys = {
        {
            "<leader>fc",
            function()
                local chezmoi = require("telescope").extensions.chezmoi
                chezmoi.find_files({})
            end,
            desc = "Find [C]hezmoi",
        },
    },
    config = function()
        require("chezmoi").setup({})
        require("telescope").load_extension("chezmoi")
    end,
}
