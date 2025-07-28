return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme('zenwritten')
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
			-- vim.cmd("colorscheme lackluster-mint")
		end
	},
	{
		'comfysage/evergarden',
		opts = {},
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme evergarden-winter")
			-- vim.cmd("hi Normal guibg=NONE")
		end
	},
	{
		"felipeagc/fleet-theme-nvim",
		opts = {},
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme fleet")
		end
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme github_dark_default")
			-- vim.cmd("hi Normal guibg=NONE")
		end
	},
	{
		'ellisonleao/gruvbox.nvim',
		opts = {},
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme gruvbox")
		end
	},
	{
		'EdenEast/nightfox.nvim',
		opts = {},
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd("colorscheme carbonfox")
		end
	},
	{
		'nyoom-engineering/oxocarbon.nvim',
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme oxocarbon")
		end
	},
}
