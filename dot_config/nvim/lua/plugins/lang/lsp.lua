return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim",
        "nvimdev/lspsaga.nvim",
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
                map("<leader>lr", "<Cmd>Lspsaga rename<CR>", "LSP [R]ename")

                vim.api.nvim_create_autocmd("BufWritePre", {
                    pattern = { "*.rs", "*.py" },
                    callback = function()
                        vim.lsp.buf.format({
                            buffer = event.buf,
                            filter = function(f_client)
                                return f_client.name ~= "null-ls"
                            end,
                            async = false,
                        })
                    end,
                })
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
        lspconfig.rust_analyzer.setup({
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                    },
                },
            },
        })
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
