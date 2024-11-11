local cmp = require("cmp")
local defaults = require("cmp.config.default")()
local lspkind = require "lspkind"
require("custom.snippets")

cmp.setup({
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}, { "i", "c" }),
	}),
	-- Enable luasnip to handle snippet expansion for nvim-cmp
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer" },
	}),
	sorting = defaults.sorting,
	format = lspkind.cmp_format({
		mode = 'text_symbol', -- show only symbol annotations
		maxwidth = {
			-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			-- can also be a function to dynamically calculate max width such as
			-- menu = function() return math.floor(0.45 * vim.o.columns) end,
			menu = 50,          -- leading text (labelDetails)
			abbr = 50,          -- actual suggestion item
		},
		ellipsis_char = '...',  -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		show_labelDetails = true, -- show labelDetails in menu. Disabled by default

		-- The function below will be called before any actual modifications from lspkind
		-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		before = function(_, vim_item)
			return vim_item
		end
	})
})
