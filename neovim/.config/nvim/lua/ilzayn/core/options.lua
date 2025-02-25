-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.o.foldlevel = 99
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.opt.foldtext = ""


vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false
vim.opt.linebreak = false

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.virtualedit = "block"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.cmdheight = 0
vim.opt.shortmess = "WltToOCF"

vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.fillchars = { eob = " ", }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
