return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		CustomOilBar = function()
			local path = vim.fn.expand "%"
			path = path:gsub("oil://", "")
			return "  " .. vim.fn.fnamemodify(path, ":.")
		end

		require("oil").setup {
			delete_to_trash = true,
			columns = { "icon" },
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-p>"] = false,
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == ".git" or name == ".."
				end,
			},
			win_options = {
				statusline = "%{v:lua.CustomOilBar()}",
			},
		}
	end,
}
