local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

local servers = {}
-- Autoload LSPs from ./config/*.lua files
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/lsp/config/*.lua", true)) do
	local lua_path = ft_path:gsub(".*/lua/(.+)%.lua", "%1")
	local module_path = lua_path:gsub('/', '.')
	local config = require(module_path)
	local name = module_path:match("%.([^%.]+)$")
	lspconfig[name].setup(config)
	table.insert(servers, name)
end

-- Configure Vim diagnostic
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "none",
		source = "always",
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

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", "<leader><leader>", function() vim.lsp.buf.format() end, opts)
end)

-- Mason configuration
local ensure_installed = { "html", "rust_analyzer", "zls", "ts_ls" }
require("mason-lspconfig").setup({
	handlers = {
		lsp_zero.default_setup,
	},
	ensure_installed = vim.list_extend(ensure_installed, servers),
})
