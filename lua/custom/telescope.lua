local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
}

-- fzf-native is compiled (build = "make") but only takes effect once loaded.
telescope.load_extension("fzf")
-- Route vim.ui.select through Telescope (replaces dressing.nvim).
telescope.load_extension("ui-select")

local builtin = require "telescope.builtin"
local set = vim.keymap.set

set("n", "<C-p>", builtin.find_files)
set("n", "<leader>fb", builtin.current_buffer_fuzzy_find)
set("n", "<leader>fg", builtin.git_commits)
set("n", "<leader>fh", builtin.help_tags)
set("n", "<leader>p", function() builtin.live_grep { no_ignore = true } end)
set("n", "g/", function()
	builtin.find_files({ follow = true, no_ignore = true, hidden = true, file_ignore_patterns = { '.git,node_modules' } })
end)
set("n", "<leader>fa", function()
	builtin.find_files({ follow = true, no_ignore = true, hidden = true, file_ignore_patterns = { '.git,node_modules' } })
end)
set("n", "<leader>ff", function() builtin.find_files({ follow = true, no_ignore = true, hidden = true }) end)
set("n", "<leader>fm", function() builtin.treesitter({ symbols = "method" }) end)
