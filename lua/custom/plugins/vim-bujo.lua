return {
	"vuciv/vim-bujo",
	cmd = "Todo",
	config = function()
		vim.cmd [[
			let g:bujo#window_width = 100
		]]
	end,
}
