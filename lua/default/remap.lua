vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeFindFileToggle<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Keybindings for navigating tabs
vim.keymap.set("n", "<leader>.", function()
    vim.cmd("tabn")
end, {})
vim.keymap.set("n", "<Tab>", function()
    vim.cmd("tabn")
end, {})
vim.keymap.set("n", "<leader>,", function()
    vim.cmd("tabp")
end, {})
vim.keymap.set("n", "<leader>tc", function()
    vim.cmd("tabc")
end, {})
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd("tabnew")
end, {})
vim.keymap.set("n", "<leader><", function()
    vim.cmd("tabfirst")
end, {})
vim.keymap.set("n", "<leader>>", function()
    vim.cmd("tablast")
end, {})

-- Keybinding for deleting the current buffer using :bd
vim.keymap.set("n", "<leader>bd", function()
    vim.cmd("bd")
end, {})

-- Keybding for cycling through the list of buffers
vim.keymap.set("n", "<leader>bn", function()
    vim.cmd("bn")
end, {})
vim.keymap.set("n", "<leader>bp", function()
    vim.cmd("bp")
end, {})

-- Define a function to execute the appropriate program based on file type
vim.keymap.set("n", "<leader>/", function()
    local filetype = vim.bo.filetype
    local app = ""
    if filetype == "javascript" then
        app = "node"
    elseif filetype == "typescript" then
        app = "ts-node"
    elseif filetype == "lua" then
        app = "lua"
    elseif filetype == "python" then
        app = "python"
    elseif filetype == "rust" then
        app = "cargo run"
    elseif filetype == "go" then
        app = "go run"
    else
        print("Unsupported file type: " .. filetype)
        return
    end
    vim.cmd("terminal " .. app .. " %")
end, { noremap = true, silent = true })

