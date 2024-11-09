return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	lazy = false,
	version = false,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-lua/plenary.nvim" },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	},
	config = function()
		require("custom.telescope")
	end,
}
