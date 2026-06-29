local mason_lspconfig = require("mason-lspconfig")

local disabled_lsps = { "tsgo", "vtsls" }

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
	if not vim.tbl_contains(disabled_lsps, server_name) then
		vim.lsp.enable(server_name)
	end
end
