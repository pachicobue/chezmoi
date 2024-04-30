return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {},
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            modules = { "highlight", "incremental_selection", "indent" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "+",
                    node_incremental = "+",
                    node_decremental = "-",
                },
            },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                    },
                },
            },
        })
    end,
}
