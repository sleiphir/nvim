-- Remove trailing whitespace on save
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--     group = vim.api.nvim_create_augroup("Default", {}),
--     pattern = "*",
--     command = [[%s/\s\+$//e]],
-- })

-- Go into insert mode when opening a terminal pane
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.cmd(":startinsert")
		end
	end
})

-- LSP Auto format on save
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	group = vim.api.nvim_create_augroup("Default", {}),
-- 	pattern = "*",
-- 	command = [[lua vim.lsp.buf.format()]],
-- })
