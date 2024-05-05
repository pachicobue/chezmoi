return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local header = {
            type = "text",
            val = {
                [[███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
                [[████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
                [[██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
                [[██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
                [[██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
                [[╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
            },
            opts = {
                position = "center",
                hl = "Type",
            },
        }
        local dashboard = require("alpha.themes.dashboard")
        local buttons = {
            type = "group",
            val = {
                dashboard.button("p", " " .. " Projects", ":Telescope projects<CR>"),
                dashboard.button("c", " " .. " Chezmoi", ":Telescope chezmoi find_files<CR>"),
            },
            opts = {
                hl = "AlphaButtons",
                hl_shortcut = "AlphaShortcut",
            },
        }
        local lazy = require("lazy")
        local package_stats = {
            name = "lazy",
            loaded = lazy.stats().loaded,
            count = lazy.stats().count,
            time = lazy.stats().startuptime,
        }
        local profile = {
            type = "text",
            val = {
                "",
                "Startuptime: " .. package_stats.time .. " ms",
                "Plugins: " .. package_stats.loaded .. " loaded / " .. package_stats.count .. " installed",
            },
            opts = {
                position = "center",
                hl = "Type",
            },
        }

        require("alpha").setup({
            layout = {
                { type = "padding", val = 2 },
                { type = "padding", val = 2 },
                header,
                { type = "padding", val = 2 },
                profile,
                { type = "padding", val = 2 },
                buttons,
                { type = "padding", val = 2 },
            },
        })
    end,
}
