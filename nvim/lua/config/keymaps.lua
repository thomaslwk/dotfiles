-- Keymaps

-- Set jk for ESC
vim.keymap.set("i", "jk", "<Esc>")

-- Indentation
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
