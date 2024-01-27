--  MODES
--  term mode = "t"
--  normal mode = "n"
--  insert mode = "i"
--  visual mode = "v"
--  command mode = "c"
--  visual block mode = "x"

vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true }

-- remap q to turn off recording feature
keymap.set("n", "q", "")

-- center vertically in insert mode
keymap.set("i", "zz", "<ESC>zzi")

-- delete text without saving to clipboard in vis mode
keymap.set("v", "x", '"_d')

-- move to beginning/end of line
keymap.set("i", "<C-d>", "<ESC>0i")
keymap.set("i", "<C-f>", "<ESC>$a")

-- scroll whole page left/right
keymap.set("n", "<leader><Right>", "zL")
keymap.set("n", "<leader><Left>", "zH")

-- save file
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("i", "<C-s>", "<ESC>:w<CR>i")

-- exit insert mode
keymap.set("i", "jh", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- move text up and down
keymap.set("n", "mu", ":m .-2<CR>")
keymap.set("n", "md", ":m .+1<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "qw", ":NvimTreeToggle<CR>") -- toggle file explorer

keymap.set("n", "˚", ":resize +4<CR>", opts) -- resize up using arrow
keymap.set("n", "∆", ":resize -4<CR>", opts) -- resize down using arrow
keymap.set("n", "˙", ":vertical resize +4<CR>", opts) -- resize left using arrow
keymap.set("n", "¬", ":vertical resize -4<CR>", opts) -- resize right using arrow
keymap.set("n", "µ", ":MaximizerToggle<CR>", opts) -- toggle split window maximization

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<S-t>", ":tabn<CR>") --  go to next tab

keymap.set("n", "<S-b>", ":bnext<CR>") --  next buffer
keymap.set("n", "bd", ":bd<CR>") --  delete current buffer
keymap.set("n", "dab", ":%bdelete<CR>") --  delete every single buffer
