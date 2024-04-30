return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "nvimdev/lspsaga.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons",
                {
                    "lewis6991/gitsigns.nvim",
                    config = true,
                },
            },
            config = function()
                require("lspsaga").setup({
                    symbol_in_winbar = {
                        enable = true,
                        hide_keyword = false,
                        folder_level = 1,
                    },
                    callhierarchy = {
                        layout = "float",
                    },
                    code_actions = {
                        show_server_name = true,
                        extend_gitsigns = true,
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
        },
        {
            "folke/neodev.nvim",
            config = true,
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                end
                map("<leader>ld", "<Cmd>Lspsaga peek_definition<CR>", "LSP [D]efinition")
                map("<leader>la", "<Cmd>Lspsaga code_action<CR>", "LSP [A]ction")
                map("<leader>le", "<Cmd>Lspsaga diagnostic_jump_next<CR>", "LSP [E]rror")
                map("<leader>lf", "<Cmd>Lspsaga finder<CR>", "LSP [F]inder")
                map("<leader>lh", "<Cmd>Lspsaga hover_doc<CR>", "LSP [H]over")
                map("<leader>ln", "<Cmd>Lspsaga rename<CR>", "LSP Re[N]ame")
            end,
        })

        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
            },
        })
        lspconfig.pyright.setup({})
        lspconfig.rust_analyzer.setup({})
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })
    end,
}
