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

local builtin = require "telescope.builtin"
local set = vim.keymap.set

set("n", "<C-p>", builtin.find_files)
set("n", "<leader>fb", builtin.current_buffer_fuzzy_find)
set("n", "<leader>fg", builtin.git_commits)
set("n", "<leader>fh", builtin.help_tags)
set("n", "<leader>p", function() builtin.live_grep { no_ignore = true } end)
set("n", "<leader>fa", function()
	builtin.find_files({ follow = true, no_ignore = true, hidden = true, file_ignore_patterns = { '.git,node_modules' } })
end)
set("n", "<leader>ff", function() builtin.find_files({ follow = true, no_ignore = true, hidden = true }) end)
set("n", "<leader>fm", function() builtin.treesitter({ symbols = "method" }) end)
