require('rose-pine').setup({
    disable_background = true
})

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.api.nvim_set_hl(0, "diffAdd", { bg = "#5bb899" })
    vim.api.nvim_set_hl(0, "diffDelete", { bg = "#db6c6c" })
end

ColorMyPencils()
