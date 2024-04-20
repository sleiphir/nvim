vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.guicursor = "n-v-i-c-ci-ve-sm:block,r-cr-o:hor20"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16

vim.opt.updatetime = 100

vim.opt.list = false
vim.opt.listchars = "tab:» ,extends:›,precedes:‹,nbsp:·,trail:·"
