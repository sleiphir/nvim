return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("zenwritten")
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
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		init = function()
			vim.o.background = "dark"
			vim.cmd("colorscheme github_dark")
		end
	},
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.o.background = "light"
			-- vim.cmd("colorscheme gruvbox")
		end
	},
	{
		"EdenEast/nightfox.nvim",
		opts = {},
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd("colorscheme carbonfox")
		end
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd("colorscheme nord")
		end
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd("colorscheme nordic")
		end
	},
	{
		"thesimonho/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd.colorscheme("kanagawa-paper")
		end
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd.colorscheme("adwaita")
		end
	},
	{
		"HoNamDuong/hybrid.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd.colorscheme("hybrid")
		end
	},
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd.colorscheme("vague")
			-- set IblScope highlighting to #1C1C1C
			-- vim.api.nvim_set_hl(0, "IblScope", { fg = "#3f3f42" })
			-- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2a2a2b" })
			-- vim.o.cursorline = false
		end
	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd.colorscheme("ayu")
		end
	}
}
