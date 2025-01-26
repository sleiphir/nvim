return {
	{
		"mellow-theme/mellow.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme mellow")
		end
	},
	{
		"kvrohit/rasmus.nvim",
		priority = 1000,
		init = function()
			vim.g.rasmus_transparent = true
			vim.g.rasmus_italic_comments = false
			vim.cmd("colorscheme rasmus")
		end
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			tweak_syntax = {
				comment = "#5a5a5a",
			},
		},
		init = function()
			-- vim.cmd("colorscheme lackluster-night")
		end
	},
	{
		'comfysage/evergarden',
		opts = {},
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme evergarden")
		end
	}
}
