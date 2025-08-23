local g_keymap = vim.keymap.set -- "Global keymap."

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
g_keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
g_keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Replace-paste without losing clipboard contents.
g_keymap('x', '<leader>p', '"_dP')

-- Keymaps to make C-d and C-u, n and N easier to work with; for easier code scanning.
g_keymap('n', '<C-u>', '<C-u>zz', { desc = 'Make `<C-u>` center cursor.', noremap = true, silent = true })
g_keymap('n', '<C-d>', '<C-d>zz', { desc = 'Make `<C-d>` center cursor.', noremap = true, silent = true })
g_keymap('n', 'n', 'nzz', { desc = 'Make `n` center the cursor.', noremap = true, silent = true })
g_keymap('n', 'N', 'Nzz', { desc = 'Make `N` center the cursor.', noremap = true, silent = true })

-- Make it so `x`/`X` and bare `s` (in both normal and visual mode) outputs to
-- the underscore register so it doesn't interfere.
g_keymap({ 'n', 'x' }, 'x', '"_x', { desc = 'Delete character under cursor, outputs to blackhole register.' })
g_keymap({ 'n', 'x' }, 'x', '"_x', { desc = 'Delete character under cursor, outputs to blackhole register.' })
g_keymap({ 'n', 'x' }, 'X', '"_X', { desc = 'Delete character before cursor, outputs to blackhole register.' })
g_keymap({ 'n', 'x' }, 'X', '"_X', { desc = 'Delete character before cursor, outputs to blackhole register.' })
g_keymap({ 'n', 'x' }, 's', '"_s', { desc = '[S]ubstitute character under cursor, outputs to blackhole register.' })

-- `gy` for "Go to last `y`anked spot."
g_keymap('n', 'y', 'mYy', { desc = '[Y]ank with a mark.' })
g_keymap('n', 'gy', '`Y', { desc = '[G]o to last [y]ank spot.' })
