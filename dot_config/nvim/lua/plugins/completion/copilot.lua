return {
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
}
