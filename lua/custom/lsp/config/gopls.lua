return {
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	on_attach = function(_, bufnr)
		-- Format document on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})

		-- run the current go file in a vertical split terminal pane
		vim.keymap.set("n", "<leader><CR>", "<cmd>vsplit term://go run %<CR>")

		-- Auto organize imports on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
				for _, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
						else
							vim.lsp.buf.execute_command(r.command)
						end
					end
				end
			end,
		})
	end,
}
