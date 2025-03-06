-- Auto insert mode on TermOpen
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			vim.cmd(":startinsert")
		end
	end
})

-- vim-bujo auto commit & push on save
vim.api.nvim_create_augroup("BujoGit", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "BujoGit",
	pattern = vim.fn.expand("$HOME") .. "/.cache/bujo/*",
	callback = function()
		local filepath = vim.api.nvim_buf_get_name(0)
		if filepath:match(vim.fn.expand("~/.cache/bujo/")) then
			vim.fn.jobstart({
				"sh", "-c", "cd ~/.cache/bujo && git add . && git commit -m 'Auto-update bujo files' && git push"
			}, {
				on_exit = function(_, code)
					if code == 0 then
						vim.schedule(function()
							vim.notify("Bujo files committed and pushed", vim.log.levels.INFO)
						end)
					else
						vim.schedule(function()
							vim.notify("Error syncing bujo files", vim.log.levels.ERROR)
						end)
					end
				end
			})
		end
	end,
})
