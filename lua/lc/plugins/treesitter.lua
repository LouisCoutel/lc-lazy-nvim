return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"vimdoc",
				"bash",
				"markdown",
				"markdown_inline",
				"regex",
				"lua",
				"python",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"http",
				"json",
				"graphql"
			},

			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
