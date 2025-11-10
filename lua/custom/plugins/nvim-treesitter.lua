return {
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate" },
	-- Show context of the current function
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
		config = function(_, opts)
			require("treesitter-context").setup(opts)

			-- Set transparent background for TreesitterContext highlight groups
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.cmd("hi TreesitterContext guibg=none")
					vim.cmd("hi TreesitterContextLineNumber guibg=none")
					vim.cmd("hi TreesitterContextBottom guibg=none")
				end,
			})

			-- Apply immediately
			vim.cmd("hi TreesitterContext guibg=none")
			vim.cmd("hi TreesitterContextLineNumber guibg=none")
			vim.cmd("hi TreesitterContextBottom guibg=none")
		end,
	},
}
