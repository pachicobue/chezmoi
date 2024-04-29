return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "L3MON4D3/LuaSnip",
            tag = "v2.3.0",
            run = "make install_jsregexp",
        },
        {
            "zbirenbaum/copilot-cmp",
            dependencies = {
                "zbirenbaum/copilot.lua",
                config = function()
                    require("copilot").setup({
                        suggestion = { enabled = false },
                        panel = { enabled = false },
                    })
                end,
            },
            config = true,
        },
    },
    config = function()
        -- See `:help cmp`
        local cmp = require("cmp")
        local compare = cmp.config.compare
        cmp.setup({
            completion = { completeopt = "menu,menuone,noinsert" },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                { name = "nvim_lsp", keyword_length = 2, priority = 10 },
                { name = "copilot", priority = 1 },
            },
            experimental = {
                ghost_text = true,
            },
            sorting = {
                priority_weight = 10,
                comparators = {
                    compare.exact,
                    compare.score,
                    compare.locality,
                    compare.length,
                    compare.recently_used,
                    compare.offset,
                    compare.order,
                },
            },
        })
    end,
}
