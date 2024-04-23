return {"tpope/vim-fugitive",
	dependencies={
		"j-hui/fidget.nvim",
		"rcarriga/nvim-notify"},
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gap", "<cmd>Git add --patch<cr>")
		vim.keymap.set("n", "<leader>glo", "<cmd>Git log --oneline<cr>")
		vim.keymap.set("n", "<leader>ggr", "<cmd>Git log --oneline --graph<cr")
		vim.keymap.set("n", "<leader>gP", function ()
			if vim.fn.confirm("Pull and rebase ?", "&yes\n&No") == 1 then
				vim.cmd({"Git pull --rebase"})
			end
		end)

		vim.keymap.set("n", "<leader>gPm", function ()
			if vim.fn.confirm("Pull and merge ?", "&yes\n&No") == 1 then
				vim.cmd({"pull --rebase=false"})
			end
		end)

		vim.keymap.set("n","<leader>gc", "<cmd>Git commit<cr>")

		vim.keymap.set("n", "<leader>gp", function ()
			if vim.fn.confirm("Push ?", "&yes\n&No") == 1 then
				vim.cmd("Git push")
			end
		end)

	end,
}
