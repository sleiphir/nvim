-- Tell LSP servers about the completion capabilities provided by blink.cmp.
-- Done before servers are enabled so every server picks it up via the '*' config.
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Configure Vim diagnostics
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
	float = {
		style = "minimal",
		border = "none",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

-- LSP keymaps (Neovim already provides grr/gri/grn/gra/K/[d/]d by default;
-- these add the author's preferred shorter bindings on top).
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf, remap = false }
		local set = vim.keymap.set

		-- Disable inlay hints (virtual text for param/type names)
		vim.lsp.inlay_hint.enable(false)

		set("n", "gd", vim.lsp.buf.definition, opts)
		set("n", "gi", vim.lsp.buf.implementation, opts)
		set("n", "gr", vim.lsp.buf.references, opts)
		set("n", "gt", vim.lsp.buf.type_definition, opts)
		set("n", "g.", vim.lsp.buf.code_action, opts)
		set("n", "K", vim.lsp.buf.hover, opts)
		set("n", "[d", function()
			vim.diagnostic.jump({ count = 1 })
		end, opts)
		set("n", "]d", function()
			vim.diagnostic.jump({ count = -1 })
		end, opts)
		set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})
