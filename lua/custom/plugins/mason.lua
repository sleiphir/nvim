return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	version = false,
	build = ":MasonUpdate",
	opts = {},
	keys = {
		{ "<leader>cm", "<cmd>Mason<cr>", desc = "Open Mason" },
	},
}
