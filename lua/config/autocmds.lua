-- Start treesitter highlighting for any filetype that has a parser installed.
-- pcall keeps it silent for filetypes without a parser.
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
		-- ftplugins reset formatoptions per buffer, so disable the 'o' (auto
		-- comment leader on o/O) flag here rather than globally in options.lua.
		vim.opt_local.formatoptions:remove("o")
	end,
})

local background_group = vim.api.nvim_create_augroup("BackgroundSync", { clear = true })

local function sync_background_colorscheme()
	local colorscheme = vim.o.background == "light" and "melange" or "vague"

	if vim.g.colors_name == colorscheme then
		return
	end

	vim.cmd.colorscheme(colorscheme)
end

vim.api.nvim_create_autocmd("OptionSet", {
	group = background_group,
	pattern = "background",
	callback = sync_background_colorscheme,
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
				"sh",
				"-c",
				"cd ~/.cache/bujo && git add . && git commit -m 'Auto-update bujo files' && git push",
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
				end,
			})
		end
	end,
})

-- Disable LSP in fugitive buffers. Detach just this buffer rather than
-- stopping the client, which would kill LSP for every other buffer too.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		if vim.api.nvim_buf_get_name(bufnr):match("^fugitive://") then
			vim.lsp.buf_detach_client(bufnr, args.data.client_id)
		end
	end,
})
