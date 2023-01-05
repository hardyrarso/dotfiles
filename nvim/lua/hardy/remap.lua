-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.mapleader = " "

-- Open file exploer
vim.keymap.set("n", "<leader>pv", function ()
   vim.cmd('NvimTreeToggle')
end)

-- disable ex mode
vim.keymap.set("n", "q:", "<Nop>")
vim.keymap.set("n", "Q",  "<nop>")

-- remap half page jump to center cursor
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- map <C-n> :set rnu!<CR>

-- nicer delete
vim.keymap.set("i", "<C-d>", "<Del>")
vim.keymap.set("i", "<Nul>", "<C-n>")

-- easier file save and exit
vim.keymap.set("i", "<leader>;", "<Esc>")
vim.keymap.set("i", "<leader>;q", "<Esc>:q<CR>")
vim.keymap.set("i", "<leader>;w", "<Esc>:w<CR>")
vim.keymap.set("i", "<leader>;wq", "<Esc>:wq<CR>")
vim.keymap.set("i", "<leader>wqa", "<Esc>:wqa<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>wqa", ":wqa<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("n", "<silent>,,", ":nohlsearch<CR>")

-- do not jump after searching for word undor cursor
vim.keymap.set("n", "*", "*``")

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
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- awesome remap to replace selected text
vim.keymap.set("v", "<leader>r", "y:%s/\\<<C-r>\\>/<C-r>/gI<Left><Left><Left>")

-- Language maps
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        -- lmao this works! But there should be a better way of doing this
        -- by directly calling the plugin function vs calling it via a normal
        -- mode command. This is the best I can do for now
        vim.keymap.set("n", "<leader>gtf", function ()
            vim.cmd('GoTestFunc')
        end)
    end
})
