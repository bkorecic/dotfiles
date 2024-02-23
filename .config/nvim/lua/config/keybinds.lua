-- Set up key mappings for buffer navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Move current line or visual selection up
vim.api.nvim_set_keymap('n', '<C-k>', ":m-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-k>', ":m-2<CR>gv=gv", { noremap = true, silent = true })

-- Move current line or visual selection down
vim.api.nvim_set_keymap('n', '<C-j>', ":m+<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-j>', ":m+<CR>gv=gv", { noremap = true, silent = true })
