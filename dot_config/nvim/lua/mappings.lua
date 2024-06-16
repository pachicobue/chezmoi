vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set({ "n", "v" }, "gj", "j")
vim.keymap.set({ "n", "v" }, "gk", "k")
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")
vim.keymap.set({ "n", "v" }, "<leader>h", "^")
vim.keymap.set({ "n", "v" }, "<leader>l", "$")
vim.keymap.set("n", ";", ":")

vim.keymap.set("i", "<C-CR>", "<C-o>o")
vim.keymap.set("i", "<C-S-CR>", "<C-o>O")
vim.keymap.set("i", "<C-a>", "<C-o>^")
vim.keymap.set("i", "<C-e>", "<C-o>$")
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>")
vim.keymap.set({ "n", "i" }, "<C-w>", "<Cmd>bd<CR>")

vim.keymap.set("n", "<leader>s", "<Cmd>w<CR>")
vim.keymap.set("n", "<leader>d", "<Cmd>bd<CR>")
