vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*"},
    desc = "Auto-format on save",
    callback = function(args)
		require("conform").format({ bufnr = args.buf})
    end,
})
