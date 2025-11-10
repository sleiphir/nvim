local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- Dap Virtual Text
dap_virtual_text.setup({
	enabled = true,
})

mason_dap.setup({
	ensure_installed = { "cppdbg", "js" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
		["js"] = function(config)
			-- custom handler for js-debug-adapter
			config.adapters = {
				type = "server",
				host = "127.0.0.1",
				port = config.port,
			}
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

-- JS/TS debug adapter
dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = 9229, -- default debug port for Node.js
	executable = {
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}"
		},
	}
}

-- Configurations for Next.js (Node.js)
dap.configurations.javascript = {
	{
		name = "Launch Next.js",
		type = "pwa-node",
		request = "launch",
		-- Path to your Next.js entry point
		program = "${workspaceFolder}/node_modules/next/dist/bin/next",
		args = { "dev" }, -- start in dev mode
		cwd = "${workspaceFolder}",
		runtimeArgs = { "--inspect-brk" },
		sourceMaps = true,
		console = "integratedTerminal",
		internalConsoleOptions = "neverOpen",
	},
}

-- For TypeScript (if your project uses TS)
dap.configurations.typescript = dap.configurations.javascript

-- DAP UI

ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Type" })
vim.fn.sign_define("DapBreakpointCondition", { text = "󰨮", texthl = "Question" })

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end
