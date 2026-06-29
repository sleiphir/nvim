return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				sql = { "sqlfmt" },
				bash = { "shfmt" },
				go = { "gofumpt", "goimports" },
				html = { "oxfmt" },
				yaml = { "oxfmt" },
				json = { "oxfmt" },
				css = { "oxfmt" },
				xml = { "xmlformatter" },
				svg = { "xmlformatter" },
				vue = { "oxfmt" },
				markdown = { "oxfmt" },
				terraform = { "tfmt" },
				javascript = { "oxfmt" },
				javascriptreact = { "oxfmt" },
				typescript = { "oxfmt" },
				typescriptreact = { "oxfmt" },
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
				oxfmt = {
					condition = function()
						return vim.uv.fs_realpath(".oxfmtrc.json") ~= nil
					end,
					command = "oxfmt",
					args = { "$FILENAME" },
					stdin = false,
				},
			},
			format_on_save = {
				-- Fall back to LSP formatting when no configured formatter runs
				-- (e.g. oxfmt opts out because there is no .oxfmtrc.json).
				lsp_format = "fallback",
				async = false,
				timeout_ms = 2000,
			},
		})

		-- Add keybinding for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
			require("conform").format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
