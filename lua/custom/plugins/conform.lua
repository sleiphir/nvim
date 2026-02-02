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
					args = "$FILENAME",
					stdin = false,
				},
			},
			format_on_save = {
				lsp_fallback = false,
				async = false,
				timeout_ms = 250,
			},
		})

		-- Add keybinding for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
				formatting_options = {
					formatters = {
						oxfmt = {
							condition = function()
								return vim.uv.fs_realpath(".oxfmtrc.json") ~= nil
							end,
							command = "oxlint",
							args = { "--fix-dangerously", "$FILENAME" },
							stdin = false,
						},
					},
				},
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
