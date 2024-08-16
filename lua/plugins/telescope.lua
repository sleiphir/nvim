return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-lua/plenary.nvim" },
	},
	extensions = {
		fzf = {
			fuzzy = true,          -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		}
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup {
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close
					},
				},
			}
		}
	end,
	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<CR>",  desc = "Find files" },
		{
			"<leader>p",
			function() require("telescope.builtin").live_grep({ no_ignore = true }) end,
			desc = "Live Grep"
		},
		-- Search almost everything (except .git folder)
		{
			"<leader>fa",
			function() require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true, file_ignore_patterns = { '.git' } }) end,
			desc = "Find all files"
		},
		-- Search everything
		{
			"<leader>fl",
			function() require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true }) end,
			desc = "Find all files"
		},
		{ "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Find buffer" },
		{ "<leader>fc", "<cmd>Telescope git_commits<CR>", desc = "Find commits" },
	},
}
