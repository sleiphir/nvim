return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				sql = { "sqlfmt" },
				bash = { "shfmt" },
				go = { "gofumpt", "goimports" },
				html = { "biome", "prettier" },
				yaml = { "prettier" },
				json = { "jq" },
				css = { "prettier" },
				javascript = { "biome", "prettier" },
				typescript = { "biome" },
				["*"] = { "codespell", "trim_whitespace" },
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
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		-- Add keybinding for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
