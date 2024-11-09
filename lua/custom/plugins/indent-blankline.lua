return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		debounce = 100,
		indent = {
			char = "▏",
			tab_char = "▏",
			highlight = { "VertSplit" },
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			highlight = "LineNr",
		},
	},
}
