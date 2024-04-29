return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        {
            "L3MON4D3/LuaSnip",
            tag = "v2.3.0",
            run = "make install_jsregexp",
        },
        "onsails/lspkind.nvim",
        {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            config = function()
                require("copilot").setup({
                    panel = {
                        enable = false,
                    },
                    suggestion = {
                        enabled = false,
                    },
                    server_opts_overrides = {
                        trace = "verbose",
                        settings = {
                            advanced = {
                                listCount = 1,
                                inlineSuggestCount = 1,
                            },
                        },
                    },
                })
            end,
        },
        {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup()
            end,
        },
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.select_next_item(),
                ["<S-Tab>"] = cmp.select_prev_item(),
            }),
            sources = {
                { name = "nvim_lsp",                group_index = 2 },
                { name = "nvim_lsp_signature_help", group_index = 2 },
                { name = "luasnip",                 group_index = 2 },
                { name = "copilot",                 group_index = 2 },
            },
            experimental = {
                ghost_text = true,
            },
            formatting = {
                expandable_indicator = true,
                fields = { "kind", "abbr", "menu" },
                format = require("lspkind").cmp_format({
                    mode = "symbol",
                    max_width = 50,
                    preset = "codicons",
                    symbol_map = { Copilot = "" },
                }),
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        })
    end,
}
