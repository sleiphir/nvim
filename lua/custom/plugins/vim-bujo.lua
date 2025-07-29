return {
	"vuciv/vim-bujo",
	cmd = "Todo",
	config = function()
		vim.cmd [[
			let g:bujo#window_width = 100
		]]
	end,
	keys = {
		{ "<leader>t", "<cmd>Todo<CR>", desc = "Open Todo list" },
	},
}
