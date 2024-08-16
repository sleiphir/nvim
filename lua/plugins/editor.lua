return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics<CR>",                                                  desc = "Trouble Workspace Diagnostics" },
			{ "<leader>xl", "<cmd>Trouble loclist<CR>",                                                      desc = "Trouble Loclist" },
			{ "<leader>xq", "<cmd>Trouble quickfix<CR>",                                                     desc = "Trouble Quickfix" },
			{ "<leader>xt", "<cmd>Trouble lsp_references<CR>",                                               desc = "Trouble LSP References" },
			{ "<leader>xj", function() require("trouble").next({ skip_groups = true, jump = true }) end,     desc = "Trouble Next" },
			{ "<leader>xk", function() require("trouble").previous({ skip_groups = true, jump = true }) end, desc = "Trouble Previous" },
		},
	},
	{ "wsdjeg/vim-fetch",           event = "VeryLazy" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"eandrju/cellular-automaton.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" },
		},
	},
}
