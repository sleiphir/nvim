return {
	"tpope/vim-fugitive",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	keys = {
		{ "<leader>gd", "<cmd>Gvdiffsplit!<CR>" },
		{ "<leader>gl", "<cmd>Git blame -w -C -C -C<CR>" },
		{ "<leader>gS", "<cmd>Git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD),<CR>"},
		{ "<leader>gbs", "<cmd>Git bisect start<CR>" },
		{ "<leader>gbg", "<cmd>Git bisect good<CR>" },
		{ "<leader>gbb", "<cmd>Git bisect bad<CR>" },
		{ "<leader>gbr", "<cmd>Git bisect reset<CR>" },
	},
}
