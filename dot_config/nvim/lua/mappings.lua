vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set({ "n", "v" }, "gj", "j")
vim.keymap.set({ "n", "v" }, "gk", "k")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set("n", ";", ":")