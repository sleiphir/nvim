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
				xml = { "xmlformatter" },
				svg = { "xmlformatter" },
				terraform = { "tfmt" },
				javascript = { "biome", "prettier" },
				javascriptreact = { "biome", "prettier" },
				typescript = { "biome", "prettier" },
				typescriptreact = { "biome", "prettier" },
				["*"] = { "trim_whitespace" },
			},
			formatters = {
				tfmt = {
					condition = function()
						return vim.bo.filetype == "terraform"
					end,
					command = "terraform",
					args = { "fmt", "$FILENAME" },
					stdin = false,
				},
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
