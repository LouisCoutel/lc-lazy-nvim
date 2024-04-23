return {"stevearc/conform.nvim", config = function ()
	require("conform").setup({
	formatters_by_ft = {
		json = {"biome"},
		javascript = {"biome"},
		typescript = {"biome"},
		python = {"autopep8"},
		}
	})
end}
