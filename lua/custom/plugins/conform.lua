return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "go" },
				html = { "biome", "html-lsp", "eslint" },
				yaml = { "prettier" },
				css = { "eslint" },
				javascript = { "biome", "eslint" },
				javascriptreact = { "biome", "eslint" },
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

		-- Add keybinding for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
			vim.lsp.buf.format()
			-- require("conform").format({
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 1000,
			-- })
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
