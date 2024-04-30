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
                        enabled = true,
                        auto_trigger = true,
                        debounce = 50,
                    },
                })
            end,
        },
    },
    config = function()
        local cmp = require("cmp")
        local copilot = require("copilot.suggestion")
        local luasnip = require("luasnip")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif copilot.is_visible() then
                        copilot.accept()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp", group_index = 2, keyword_length = 4 },
                { name = "luasnip",  group_index = 1, keyword_length = 4 },
            },
            formatting = {
                expandable_indicator = true,
                fields = { "kind", "abbr", "menu" },
                format = require("lspkind").cmp_format({
                    mode = "symbol",
                    max_width = 50,
                    preset = "codicons",
                }),
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    cmp.config.compare.exact,
                },
            },
        })
        cmp.event:on("menu_opened", function()
            vim.api.nvim_buf_set_var(0, "copilot_suggestion_hidden", true)
            print(string.format("%s\n", vim.api.nvim_buf_get_var(0, "copilot_suggestion_hidden")))
        end)

        cmp.event:on("menu_closed", function()
            vim.api.nvim_buf_set_var(0, "copilot_suggestion_hidden", false)
            print(string.format("%s\n", vim.api.nvim_buf_get_var(0, "copilot_suggestion_hidden")))
        end)
    end,
}
