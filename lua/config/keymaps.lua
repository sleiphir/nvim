vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", "<cmd>:Oil<CR>")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Keep things centered
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Escape terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>")

-- Thanks to Mr. Primeagen
vim.keymap.set({ "n", "v" }, "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move between windows with actual arrow keys
vim.keymap.set("n", "<Left>", "<C-w>h")
vim.keymap.set("n", "<Down>", "<C-w>j")
vim.keymap.set("n", "<Up>", "<C-w>k")
vim.keymap.set("n", "<Right>", "<C-w>l")

-- Duplicate line
vim.keymap.set("n", "<leader>d", "mzyyp`zj")

-- Open a new terminal pane
vim.keymap.set("n", "<leader>t", "<cmd>botright terminal<CR>")
-- Focus the terminal pane
vim.keymap.set("n", "<leader>f", function()
	local bufnr = vim.fn.bufnr("#")
	vim.api.nvim_set_current_buf(bufnr)
end)
