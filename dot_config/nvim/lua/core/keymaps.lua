local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "x", '"_x"', opts)

keymap("i", "jj", "<Esc>", opts)
keymap("", "<S-h>", "^", opts)
keymap("", "<S-l>", "$", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "gj", "j", opts)
keymap("n", "gk", "k", opts)
