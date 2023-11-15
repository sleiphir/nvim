require("toggleterm").setup()

-- floating terminal
vim.keymap.set("n", "<leader>\\", "<cmd>ToggleTerm direction=float<CR>")
