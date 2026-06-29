require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Boostrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "custom/plugins" }, {
	change_detection = {
		notify = false,
	},
})

-- Apply a colorscheme at startup; the BackgroundSync autocmd swaps it
-- automatically when the (system) background changes afterwards.
vim.cmd.colorscheme(vim.o.background == "light" and "github_light_default" or "vague")
