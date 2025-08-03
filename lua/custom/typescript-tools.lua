require("typescript-tools").setup {
	on_attach =
		function(client, _)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			-- run the current go file in a vertical split terminal pane
			vim.keymap.set("n", "<leader><CR>", "<cmd>vsplit term://npx tsx %<CR>")
			-- open the Go scratchpad
			vim.keymap.set("n", "<leader>q", "<cmd>e ~/personal/Node/test/main.ts<CR>")
		end,
	settings = {
		jsx_close_tag = {
			enable = true,
			filetypes = { "javascriptreact", "typescriptreact" },
		}
	},
	handlers = {
		["textDocument/publishDiagnostics"] = function(
			_,
			result,
			ctx,
			config
		)
			if result.diagnostics == nil then
				return
			end

			-- ignore some tsserver diagnostics
			local idx = 1
			while idx <= #result.diagnostics do
				local entry = result.diagnostics[idx]

				local formatter = require('format-ts-errors')[entry.code]
				entry.message = formatter and formatter(entry.message) or entry.message

				-- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
				if entry.code == 80001 then
					-- { message = "File is a CommonJS module; it may be converted to an ES module.", }
					table.remove(result.diagnostics, idx)
				else
					idx = idx + 1
				end
			end

			vim.lsp.diagnostic.on_publish_diagnostics(
				_,
				result,
				ctx,
				config
			)
		end,
	},
}
