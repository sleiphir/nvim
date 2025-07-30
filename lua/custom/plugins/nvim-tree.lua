return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		view = {
			side = "right",
			width = 45,
		},
	},
	keys = {
		{ "<leader>E", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
	},
}
