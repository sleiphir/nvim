return {
	"mfussenegger/nvim-dap",
	lazy = false,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- These are nvim-dap adapter names, not Mason package names.
			ensure_installed = { "delve", "js", "python" },
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		require("nvim-dap-virtual-text").setup({})
		dapui.setup()

		-- vscode-js-debug is installed by Mason as `js-debug-adapter`.
		-- It supports Node, JavaScript and TypeScript source maps.
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "127.0.0.1",
			port = "${port}",
			executable = {
				command = "js-debug-adapter",
				args = { "${port}" },
			},
		}

		local node_configurations = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch current file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
				skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to Node process",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}

		for _, filetype in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
			dap.configurations[filetype] = node_configurations
		end

		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticSignInfo", linehl = "Visual" })

		dap.listeners.after.event_initialized.dapui_config = dapui.open
		dap.listeners.before.event_terminated.dapui_config = dapui.close
		dap.listeners.before.event_exited.dapui_config = dapui.close

		local map = vim.keymap.set
		map("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
		map("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
		map("n", "<F10>", dap.step_over, { desc = "Debug: Step over" })
		map("n", "<F11>", dap.step_into, { desc = "Debug: Step into" })
		map("n", "<S-F11>", dap.step_out, { desc = "Debug: Step out" })
		map("n", "<leader>dc", dap.continue, { desc = "Debug: Continue" })
		map("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
		map("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
		map("n", "<leader>dx", function()
			dap.terminate()
			dapui.close()
		end, { desc = "Debug: Terminate" })
	end,
}
