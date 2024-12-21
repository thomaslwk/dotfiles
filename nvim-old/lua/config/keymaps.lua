-- Keymaps
--  Set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set jk for ESC
vim.keymap.set("i", "jk", "<Esc>")

-- Clear search highlighting.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Close all open buffers.
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")

-- Switch between buffers with Shift+H and Shift+L
vim.api.nvim_set_keymap('n', '<S-H>', ':bprev<CR>', { noremap = true, silent = true }) -- Previous buffer
vim.api.nvim_set_keymap('n', '<S-L>', ':bnext<CR>', { noremap = true, silent = true }) -- Next buffer

-- Remap for easier pane navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Reselect visual selection after indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")
vim.keymap.set("v", "Y", "myY`y")

-- Easy insertion of a trailing ; or , from insert mode.
vim.keymap.set("i", ";;", "<Esc>A;<Esc>")
vim.keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Resize with arrows.
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
