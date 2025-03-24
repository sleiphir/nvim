return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>",      desc = "Decrement selection", mode = "x" },
		},
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "php", "twig" },
			},
			auto_install = true,
			indent = { enable = true },
			ensure_installed = { "lua", "vim", "vimdoc", "typescript", "javascript", "go", "c", "cpp", "rust", "zig", "html", "css" },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- Show context of the current function
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
		keys = {
			{
				"<leader>ut",
				function()
					local tsc = require("treesitter-context")
					tsc.toggle()
				end,
				desc = "Toggle Treesitter Context",
			},
		},
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

	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {},
	},
}
