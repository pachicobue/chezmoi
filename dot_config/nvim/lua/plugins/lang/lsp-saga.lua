return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = {
                enable = true,
                show_file = false,
                hide_keyword = true,
                folder_level = 1,
            },
            callhierarchy = {
                layout = "float",
            },
            code_actions = {
                show_server_name = true,
            },
            finder = {
                keys = {
                    shuttle = "<leader>w",
                    toggle_or_open = "<CR>",
                },
            },
            lightbulb = {
                enabled = false,
            },
            rename = {
                keys = {
                    quit = "<Esc>",
                },
            },
        })
    end,
}
