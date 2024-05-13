return {
	"ecthelionvi/NeoColumn.nvim",
	config = function()
		require("NeoColumn").setup({
			custom_NeoColumn = {
				json = "60",
			},
		}, { NeoColumn = "100", always_on = true })
	end,
}
