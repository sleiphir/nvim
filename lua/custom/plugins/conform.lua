return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				html = { "biome", "html-lsp" },
				json = { "biome" },
				yaml = { "yamlls" },
				javascript = { "biome" },
				javascriptreact = { "biome" },
				markdown = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				["*"] = { "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {
				biome = {
					condition = function()
						return vim.uv.fs_realpath("biome.json") ~= nil end,
				},
			},
		})
	end,
}
