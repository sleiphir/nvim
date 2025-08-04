local lsp_zero = require("lsp-zero")

-- Configure Vim diagnostic
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "none",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

-- Lsp icons
lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = ""
})

-- Keybindings
lsp_zero.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	lsp_zero.default_keymaps({ buffer = bufnr })
	-- Disable inlay hints (virtual text for variable types and name of function parameters)
	vim.lsp.inlay_hint.enable(false)

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", "g.", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)
