return {
    "ahmedkhalf/project.nvim",
    keys = {
        {
            "<leader>fp",
            function()
                local projects = require("telescope").extensions.projects
                projects.projects({})
            end,
            desc = "Find [P]roject",
        },
    },
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern", "lsp" },
            patterns = { ".git", ".project", ".project.nvim" },
            silent_chdir = true,
            show_hidden = true,
        })
        require("telescope").load_extension("projects")
    end,
}
