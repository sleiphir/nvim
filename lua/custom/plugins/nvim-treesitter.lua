return {
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'main',
		lazy = false,
		build = ":TSUpdate",
	},
	-- Show context of the current function
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
		config = function(_, opts)
			require("treesitter-context").setup(opts)

			vim.cmd("hi TreesitterContext guibg=none")
			vim.cmd("hi TreesitterContextLineNumber guibg=none")
			vim.cmd("hi TreesitterContextBottom guibg=none")
		end,
	},
}
