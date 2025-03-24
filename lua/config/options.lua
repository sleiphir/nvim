local opt = vim.opt

-- Better line number display
opt.number = true
opt.relativenumber = true

-- Use tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.smartindent = true

-- Highlight cursor line
-- opt.cursorline = true

-- Use line wrapping
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "> "

-- show partial result in preview window for :substitute
opt.inccommand = "split"

-- Better search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Split the other way around
opt.splitbelow = true
opt.splitright = true

-- prevent comment insertion when pressing 'o' on a commented line
opt.formatoptions:remove "o"

-- Prevent pause on long listing that don't fit inside the buffer
opt.more = false

-- Undo settings
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 100

-- Enable 24 bits colors
opt.termguicolors = true

-- Minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 12

-- List of characters
opt.list = true
opt.listchars = "tab:  ,extends:›,precedes:‹,nbsp:·,trail:·"

-- System wide clipboard
opt.clipboard = "unnamedplus"
