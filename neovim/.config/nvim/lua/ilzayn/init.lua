-- REQUIREMENTS --
-- 
-- git
-- curl
-- ripgrep
-- cmake
-- npm
-- bash

vim.loader.enable()
-- vim.cmd.language("en_US")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.g.colorscheme = "ayu"
vim.g.colorscheme = "kanagawa"

require("ilzayn.core")
require("ilzayn.lazy")
