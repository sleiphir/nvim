return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		enabled = false,
		debounce = 100,
		indent = { char = "▏", tab_char = "▏" },
		scope = { show_start = false },
		whitespace = { highlight = { "Whitespace", "NonText" } },
	},
}
