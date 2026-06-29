return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp", -- needed for get_lsp_capabilities() in custom.lsp.config
	},
	opts = {
		-- Auto-enable every Mason-installed server, except these which are
		-- installed but intentionally kept disabled.
		automatic_enable = {
			exclude = { "tsgo", "vtsls" },
		},
	},
	config = function(_, opts)
		-- Diagnostics, keymaps and capabilities must be set before servers enable.
		require("custom.lsp.config")
		require("mason-lspconfig").setup(opts)
	end,
}
