return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	version = false,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("custom.telescope")
	end,
}
