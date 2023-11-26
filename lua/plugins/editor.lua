return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { },
        keys = {
            { '<leader>wk', '<cmd>WhichKey<CR>', desc = 'Show key mappings' },
        },
    },
    { 'wsdjeg/vim-fetch', event = "VeryLazy" },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'eandrju/cellular-automaton.nvim',
        event = "VeryLazy",
        keys = {
            { '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>', desc = 'Make it rain' },
        },
    },
}
