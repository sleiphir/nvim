return {
	on_attach = function(_, bufnr)
		-- Format document on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
		})
	end
}
