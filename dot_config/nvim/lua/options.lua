-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.fn.has("clipboard") == 1 then
    vim.opt.clipboard = "unnamedplus,unnamed"
end

-- Display
vim.opt.ambiwidth = "single"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.fillchars = ""

-- System
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.jumpoptions = "stack"
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 200
vim.opt.ttimeoutlen = 200
vim.opt.whichwrap = "b,s,<,>,[,]"

-- File
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.undofile = true

-- Search
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
