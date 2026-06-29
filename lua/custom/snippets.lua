local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})

-- Load filetype snippets (lua/custom/snippets/<ft>.lua).
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
	loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
