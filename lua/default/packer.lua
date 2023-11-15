vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- gF but better (and real)
    use "wsdjeg/vim-fetch"

    -- terminal in neovim which already exists but is pretty bad and this one is better
    use { "akinsho/toggleterm.nvim", tag = '*' }

    -- find everything, maybe too much
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- easy mode
    use("stevearc/conform.nvim")
    use { 'stevearc/dressing.nvim' }
    use("rafamadriz/friendly-snippets")
    use({ 'echasnovski/mini.nvim', branch = 'stable' })
    use("ThePrimeagen/refactoring.nvim")

    -- theme stuff
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use("rebelot/kanagawa.nvim")
    use("felipeagc/fleet-theme-nvim")
    use("lukas-reineke/indent-blankline.nvim")

    -- do I need this ?
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = true,
            }
        end
    })

    -- I'm not a netrw fan
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end
    }
    use("nvim-treesitter/nvim-treesitter-context");
    use("nvim-treesitter/playground")

    -- versionning
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- important
    use("folke/zen-mode.nvim")
    use("eandrju/cellular-automaton.nvim")

    -- AI stuff
    use("github/copilot.vim")
    use {
        "Bryley/neoai.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
        }
    }

    -- making neovim actually usable
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },

            -- Colors
            { "folke/lsp-colors.nvim" },
        }
    }
end)
