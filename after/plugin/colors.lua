function ColorMyPencils(color)
	color = color or "fleet"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
