require("supermaven-nvim").setup({
	disable_keymaps = true,
	disable_inline_completion = true,
	log_level = "info",
})

-- Supermaven on-demand configuration
local suggestion = require('supermaven-nvim.completion_preview')

local function on_demand_complete()
	vim.g.supermaven_inline_completion_enabled = true

	vim.schedule(function()
		if suggestion.has_suggestion() then
			suggestion.on_accept_suggestion()
		end

		vim.g.supermaven_inline_completion_enabled = false
	end)

	return ""
end

vim.keymap.set('i', '<C-t>', on_demand_complete, { expr = true, silent = true, desc = "On-demand Supermaven completion" })
