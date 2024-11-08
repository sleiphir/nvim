local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.smartindent = true
opt.cursorline = true

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "> "

opt.inccommand = "split"

opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

opt.splitbelow = true
opt.splitright = true

opt.formatoptions:remove "o"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.termguicolors = true

opt.scrolloff = 8
opt.updatetime = 100
opt.list = true
opt.listchars = "tab:  ,extends:›,precedes:‹,nbsp:·,trail:·"

opt.clipboard = "unnamedplus"

opt.more = false
