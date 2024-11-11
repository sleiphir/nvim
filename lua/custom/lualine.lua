local branch_name = vim.fn.system("cat .git/HEAD | sed 's/.*\\///' | tr -d '\n'")

local function branch()
	if branch_name ~= "" then
		return branch_name .. ' '
	else
		return ""
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 20,
			tabline = 20,
			winbar = 20,
		}
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = {},
		lualine_z = { "location" }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})
