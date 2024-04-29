-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Install Plugins ]]
require("lazy").setup({
    spec = {
        -- Installer
        { "folke/lazy.nvim" },

        -- Subfolder
        { import = "plugins.keymap" },
        { import = "plugins.ui" },
        { import = "plugins.search" },
        { import = "plugins.editing" },
        { import = "plugins.explorer" },
        { import = "plugins.lang" },
        { import = "plugins.terminal" },
        { import = "plugins.completion" },
    },
})
