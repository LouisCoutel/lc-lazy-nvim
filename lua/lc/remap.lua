vim.g.mapleader = " "  
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s><C-q>", "<cmd>wq<cr><esc>")
vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", "<cmd>q<cr><esc>")
vim.keymap.set({"n","i"},"<C-q>!", "<cmd>q!<cr><esc>")
vim.keymap.set("i","<C-c>","<esc>")
