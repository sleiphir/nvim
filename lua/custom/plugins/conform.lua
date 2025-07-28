return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "go" },
				html = { "biome", "html-lsp" },
				yaml = { "prettier" },
				javascript = { "biome" },
				javascriptreact = { "biome" },
				markdown = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				["*"] = { "trim_whitespace" },
			},
			formatters = {
				biome = {
					condition = function()
						return vim.uv.fs_realpath("biome.json") ~= nil
					end,
					command = "biome",
					args = {
						"check",
						"--fix",
						"--unsafe",
						"$FILENAME",
					},
					stdin = false,
				}
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
