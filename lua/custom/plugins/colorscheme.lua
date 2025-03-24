return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			-- vim.g.zenbones_darken_comments = 45
			vim.cmd.colorscheme('zenwritten')
			-- Set transparent background and disable cursorline
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		end
	},
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
			-- vim.g.rasmus_transparent = true
			-- vim.g.rasmus_italic_comments = false
			-- vim.cmd("colorscheme rasmus")
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
