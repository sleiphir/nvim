return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	config = function(_, opts)
		local lsp_zero = require("lsp-zero")
		local lspconfig = require("lspconfig")

		-- Autoload LSPs from ./config/*.lua files
		local servers = {}
		for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/lsp/config/*.lua", true)) do
			local lua_path = ft_path:gsub(".*/lua/(.+)%.lua", "%1")
			local module_path = lua_path:gsub('/', '.')
			local config = require(module_path)
			local name = module_path:match("%.([^%.]+)$")
			lspconfig[name].setup(config)
			table.insert(servers, name)
		end

		local ensure_installed = { "rust_analyzer", "zls" }
		ensure_installed = vim.list_extend(ensure_installed, servers)
		local automatic_installation = true
		local handlers = {
			lsp_zero.default_setup,
		}

		return {
			ensure_installed,
			automatic_installation,
			handlers,
		}
	end,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
