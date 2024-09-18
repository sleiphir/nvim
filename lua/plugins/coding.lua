return {
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = "make install_jsregexp",
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		init = function()
			local ls = require('luasnip')
			ls.setup({
				enable_autosnippets = true,
			})
		end
	},
	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
		},
		opts = function()
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			local cmp_format = require("lsp-zero").cmp_format()
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-CR>"] = function(fallback)
						cmp.abort()
						fallback()
					end,
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				sorting = defaults.sorting,
				formatting = cmp_format,
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require 'lsp_signature'.setup(opts) end,
		keys = {
			{ "<C-k>", function() vim.lsp.buf.signature_help() end, desc = "Toggle Signature Help" },
		},
	},
	-- Supermaven (copilot)
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	-- GitHub Copilot
	-- { "github/copilot.vim" },
	-- Comment
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
		config = function()
			require("Comment").setup()
		end
	},
	-- Surround
	{ "tpope/vim-surround",   event = "BufRead", },
	-- Unimpaired
	{ "tpope/vim-unimpaired", event = "BufRead", },
}
