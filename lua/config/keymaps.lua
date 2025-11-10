local set = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

-- Open file explorer
set("n", "<leader>e", "<cmd>:Oil<CR>")

-- Use same behavior for <C-c> as <Esc>
set("i", "<C-c>", "<Esc>")

-- Keep things centered
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "<C-j>", "<cmd>cnext<CR>zz")
set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- Copy to system clipboard
set({ "n", "v" }, "<leader>y", [["+y]])

-- Escape terminal mode
set("t", "<Esc>", "<C-\\><C-n>")

-- Delete buffer
set("n", "<leader>bd", "<cmd>bd<CR>")

-- Thanks to Mr. Primeagen
set({ "n", "v" }, "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Replace all occurences of word
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move lines around in visual mode
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Move between windows with actual arrow keys
set("n", "<Left>", "<C-w>h")
set("n", "<Down>", "<C-w>j")
set("n", "<Up>", "<C-w>k")
set("n", "<Right>", "<C-w>l")

-- Duplicate line
-- set("n", "<leader>d", "mzyyp`zj")
