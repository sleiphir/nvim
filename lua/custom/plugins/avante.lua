return {
	"yetone/avante.nvim",
	lazy = false,
	priority = 10,
	keys = {
		{ "<leader>an", "<cmd>AvanteChatNew<cr>", desc = "Avante New Chat" },
	},
	opts = {
		providers = {
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o",
				timeout = 60000,
				extra_request_body = {
					temperature = 0,
				},
				max_tokens = 8192,
			},
		},
		hints = { enabled = false },
		mappings = {
			submit = {
				insert = "<C-s>"
			}
		},
		behaviour = {
			auto_suggestions = false,
		},
		windows = {
			width = 45,
			sidebar_header = {
				enabled = false,
			},
			input = {
				prefix = "",
				height = 5,
			},
			ask = {
				floating = false,
				start_insert = true,
				border = "rounded",
				focus_on_apply = "ours",
			},
			edit = {
				border = "rounded",
				start_insert = true,
			},
		},
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
}
