vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "i" }, "<C-a>", "<cmd>w<cr><esc>")
vim.keymap.set({ "n" }, "<C-a>", "<cmd>w<cr><esc>")
vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", "<cmd>q<cr><esc>")
vim.keymap.set({ "n", "i" }, "<C-q>!", "<cmd>q!<cr><esc>")
vim.keymap.set("i", "<C-c>", "<esc>")
