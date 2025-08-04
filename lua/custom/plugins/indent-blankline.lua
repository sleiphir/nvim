return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		vim.api.nvim_set_hl(0, "IblIndentLightGray", { fg = "#eae6d9" })
		vim.api.nvim_set_hl(0, "IblIndentScopeLightGray", { fg = "#dfd9cc" })

		require("ibl").setup({
			debounce = 100,
			indent = {
				char = "▏",
				tab_char = "▏",
				highlight = { "IblIndentLightGray" },
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
				highlight = { "IblIndentLightGray", "IblIndentScopeLightGray" },
			},
		})
	end,
}
