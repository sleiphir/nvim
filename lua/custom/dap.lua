local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

-- Dap Virtual Text
dap_virtual_text.setup({
	enabled = true,
})

dap.set_log_level("DEBUG")

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
	port = "${port}",
	executable = {
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}

-- Configurations for Node.js
dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		address = "localhost",
		port = 9229,
		cwd = "${workspaceFolder}",
		restart = true,
	},
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
}

-- For TypeScript
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
