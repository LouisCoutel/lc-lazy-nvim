return {"stevearc/conform.nvim", config = function ()
	require("conform").setup({
	formatters_by_ft = {
		json = {"biome"},
		javascript = {"biome"},
		typescript = {"biome"},
		python = {"ruff_fix","autopep8"},
			lua = {"stylua"},
			jinja = {"djlint"}
		}
	})
end}
