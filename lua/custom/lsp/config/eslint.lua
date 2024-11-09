return {
	on_attach = function(_, bufnr)
		-- Auto format with eslint fix all
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
}
