return {
	"yetone/avante.nvim",
	lazy = false,
	priority = 10,
	opts = {
		mappings = {
			submit = {
				insert = "<C-s>"
			}
		}
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	keys = {
		{ "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
		{ "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },
	}
}
