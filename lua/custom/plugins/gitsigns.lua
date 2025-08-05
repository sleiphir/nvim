return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	opts = {
		current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = true,
        virt_text_priority = 100,
        use_focus = true,
      },
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
	},
	keys = {
		{ "[h",          "<cmd>Gitsigns next_hunk<CR>",    desc = "Next Hunk" },
		{ "]h",          "<cmd>Gitsigns prev_hunk<CR>",    desc = "Prev Hunk" },
		{ "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>",   desc = "Reset Hunk" },
		{ "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
		{ "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview Hunk" },
		{
			"<leader>ghb",
			function()
				package.loaded.gitsigns.blame_line({ full = true })
			end,
			desc = "Blame Line"
		},
	},
}
