return {
	"mason-org/mason-lspconfig.nvim",
	setup = {
		automatic_enable = false,
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("custom.lspconfig")
	end,
}
