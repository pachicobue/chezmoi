local api = vim.api
api.nvim_set_hl(0, "YankHighlight", { bg = "#553311" })
api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 500 })
    end,
})

local create_cmd = vim.api.nvim_create_user_command
create_cmd("W", "noautocmd w", {})
