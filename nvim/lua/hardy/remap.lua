vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- disable ex mode
vim.keymap.set("n", "q:", "<Nop>")
vim.keymap.set("n", "Q",  "<nop>")

-- remap half page jump to center cursor
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- map <C-n> :set rnu!<CR>

-- insert mode mappings
vim.keymap.set("i", "<C-d>", "<Del>")
vim.keymap.set("i", "<Nul>", "<C-n>")
vim.keymap.set("i", "<leader>;", "<Esc>")
vim.keymap.set("i", "<leader>;q", "<Esc>:q<CR>")
vim.keymap.set("i", "<leader>;w", "<Esc>:w<CR>")
vim.keymap.set("i", "<leader>;wq", "<Esc>:wq<CR>")
vim.keymap.set("i", "<leader>wqa", "<Esc>:wqa<CR>")

-- normal mode mappings
-- vim.keymap.set("n", <silent> ,, :nohlsearch<CR>
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "*", "*``")
vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>wqa", ":wqa<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<C-t>", ":tabe ")
vim.keymap.set("n", "<leader>g", ":G<CR>")

-- genius remap to not overwrite buffer on paste and delete
vim.keymap.set("n", "<leader>d", "_d")
vim.keymap.set("v", "<leader>d", "_d")

vim.keymap.set("v", "<leader>p", "_dP")

-- keep cursor still when doing J
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor center when moving between search targets
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- awesome remap to move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- awesome remap to replace the word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- awesome remap to replace selected text
vim.keymap.set("v", "<leader>s", "y:%s/\\<<C-r>\\>/<C-r>/gI<Left><Left><Left>")
