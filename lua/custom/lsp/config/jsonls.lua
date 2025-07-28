return {
	on_attach = function(_, bufnr)
		-- Format document on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				-- check that biome lsp is running
				local biome = vim.lsp.get_clients({ buffer = bufnr, name = "biome" })
				if #biome == 0 then
					vim.lsp.buf.format()
				else
					vim.lsp.buf.format({ filter = function(client) return client.name == "biome" end })
				end
			end,
		})
	end
}
