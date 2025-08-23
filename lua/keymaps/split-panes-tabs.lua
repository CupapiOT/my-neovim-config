local g_keymap = vim.keymap.set -- "Global keymap."

-- Keymaps to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
g_keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
g_keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
g_keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
g_keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keymaps to make split resizing easier.
g_keymap('n', '<C-w>+', '3<C-w>+', { noremap = true, silent = true })
g_keymap('n', '<C-w>-', '3<C-w>-', { noremap = true, silent = true })
g_keymap('n', '<C-w>>', '5<C-w>>', { noremap = true, silent = true })
g_keymap('n', '<C-w><', '5<C-w><', { noremap = true, silent = true })
--  Use CTRL+ALT+<hjkl> to in/decrease window size.
--  Use CTRL+ALT+E to equalize window size.
g_keymap('n', '<M-C-H>', '<C-w><', { desc = 'Decrease editor width.' })
g_keymap('n', '<M-C-L>', '<C-w>>', { desc = 'Increase editor width.' })
g_keymap('n', '<M-C-J>', '<C-w>-', { desc = 'Decrease editor height.' })
g_keymap('n', '<M-C-K>', '<C-w>+', { desc = 'Increase editor height.' })
g_keymap('n', '<M-C-E>', '<C-w>=', { desc = 'Equalize editor width and height.' })

-- Tabs
g_keymap('n', '<leader>tn', ':tabnew<CR>', { desc = '[T]ab [n]ew.', noremap = true, silent = true })
g_keymap('n', '<leader>tc', ':tabclose<CR>', { desc = '[T]ab [c]lose.', noremap = true, silent = true })
