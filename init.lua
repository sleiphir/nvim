require("config.options")
require("config.keymaps")

-- Boostrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

vim.cmd([[colorscheme mellow]])

-- Modify Comment highlight group to remove italics
vim.cmd([[hi Comment cterm=NONE gui=NONE]])
