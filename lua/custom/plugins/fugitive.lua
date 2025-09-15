return {
	"tpope/vim-fugitive",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	keys = {
		{ "<leader>gd", "<cmd>Gvdiffsplit!<CR>" },
		{ "<leader>gS", "<cmd>Git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD),<CR>"},
	},
}
