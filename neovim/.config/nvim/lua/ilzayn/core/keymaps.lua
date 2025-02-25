local function map(mode, lhs, rhs, opts)
  local default_opts = { noremap = true, silent = true }

  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("keep", opts or { }, default_opts))
end

-- remove <SPACE> keybinds because it's the leader
map({ "n", "v" }, " ", "<NOP>")

-- exit terminal
map("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "exit terminal mode" })

-- center
-- map("n", "<C-d>", "<C-d>zz")
-- map("n", "<C-u>", "<C-u>zz")
-- map("n", "n", "nzzzv")
-- map("n", "N", "Nzzzv")
-- map("n", "G", "Gzz")

-- delete char without yanking
map('n', 'x', '"_x')

-- easier save and write
map("n", "<leader>w", ":silent w<CR>", { desc = "[w]rite buffer" })
map("n", "<leader>W", ":silent w!<CR>", { desc = "force [W]rite buffer" })
map("n", "<leader>q", "<CMD>q<CR>", { desc = "[q]uit buffer" })
map("n", "<leader>Q", "<CMD>q!<CR>", { desc = "force [Q]uit buffer" })

-- split creation
map("n", "<leader>sh", "<CMD>wincmd v | wincmd h<CR>", { desc = "[s]plit left [h]" })
map("n", "<leader>sj", "<CMD>wincmd s<CR>", { desc = "[s]plit down [j]" })
map("n", "<leader>sk", "<CMD>wincmd s | wincmd k<CR>", { desc = "[s]plit up [k]" })
map("n", "<leader>sl", "<CMD>wincmd v<CR>", { desc = "[s]plit right [l]" })
map("n", "<leader>sx", "<CMD>close<CR>", { desc = "[s]plit e[x]it" })

-- split sizing
map("n", "<C-Left>", "<CMD>wincmd <<CR>", { desc = "resize [s]plit vertically smaller" })
map("n", "<C-Right>", "<CMD>wincmd ><CR>", { desc = "resize [s]plit vertically larger" })
map("n", "<C-Down>", "<CMD>wincmd -<CR>", { desc = "resize [s]plit horizontally smaller" })
map("n", "<C-Up>", "<CMD>wincmd +<CR>", { desc = "resize [s]plit horizontally larger" })
map("n", "<leader>se", "<C-w>=", { desc = "size [s]plits [e]qually" })

-- split movement
map("n", "<C-h>", "<CMD>wincmd h<CR>", { desc = "move to left split" })
map("n", "<C-j>", "<CMD>wincmd j<CR>", { desc = "move to bottom split" })
map("n", "<C-k>", "<CMD>wincmd k<CR>", { desc = "move to top split" })
map("n", "<C-l>", "<CMD>wincmd l<CR>", { desc = "move to right split" })

-- keep last yanked when overpasting
map("v", "p", "\"_dp")

-- better redo
map("n", "U", "<C-r>")

-- Insert 'n' lines below current line staying in normal mode
map(
  "n",
  "<leader>o",
  function() return "m`" .. vim.v.count .. "o<Esc>``" end,
  { desc = "insert 'n' lines below the cursor in normal mode", expr = true }
)

-- Insert 'n' lines above current line staying in normal mode
map(
  "n",
  "<leader>O",
  function() return "m`" .. vim.v.count .. "O<Esc>``" end,
  { desc = "insert 'n' lines above the cursor in normal mode", expr = true }
)

-- buffers
map("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "[b]uffer [n]ext" })
map("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "[b]uffer [p]revious" })
map("n", "<leader>bx", "<CMD>bdelete<CR>", { desc = "e[x]it buffer" })
map("n", "<leader>bX", "<CMD>bdelete!<CR>", { desc = "force e[X]it buffer" })

-- tab managment
map("n", "<leader>ta", "<CMD>tabnew<CR>", { desc = "add tab" })

map("n", "<leader>tr", function()
  require("ilzayn.core.ui.tabline").set_tab_name(0, vim.fn.input("Name Tab"))
end, { desc = "name tab" })

map("n", "<leader>tx", "<CMD>tabclose<CR>", { desc = "close current tab" })
map("n", "<leader>tX", "<CMD>tabclose!<CR>", { desc = "force close current tab" })
map("n", "<leader>to", "<CMD>tabonly<CR>", { desc = "close every tab but current one" })
map("n", "<leader>tO", "<CMD>tabonly!<CR>", { desc = "force close every tab but current one" })

map("n", "<leader>tn", "<CMD>tabnext<CR>", { desc = "go to next tab" })
map("n", "<leader>tp", "<CMD>tabprevious<CR>", { desc = "go to previous tab" })

map("n", "<leader>tmn", "<CMD>+tabmove<CR>", { desc = "move tab after next one" })
map("n", "<leader>tmp", "<CMD>-tabmove<CR>", { desc = "move tab before previous one" })
