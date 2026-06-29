return {
	"saghen/blink.cmp",
	version = "1.*", -- use a release tag so the prebuilt fuzzy matcher is downloaded
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	},
	config = function()
		-- Load LuaSnip + custom snippets
		require("custom.snippets")

		require("blink.cmp").setup({
			snippets = { preset = "luasnip" },
			keymap = {
				preset = "default", -- <C-n>/<C-p> select, <C-e> hide, <C-u>/<C-d> scroll docs
				["<CR>"] = { "accept", "fallback" },
			},
			completion = {
				documentation = { auto_show = true },
				menu = {
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "source_name" },
						},
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "lazydev" },
				providers = {
					lazydev = {
						name = "lazydev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- show lazydev completions above LSP
					},
				},
			},
		})
	end,
}
