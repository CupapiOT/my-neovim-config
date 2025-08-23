local g_keymap = vim.keymap.set -- "Global keymap."

-- Code fold keymaps (Flipping two keymaps to make more mnemonic sense.)
g_keymap('n', 'za', 'zf', { desc = '[A]dd fold.', noremap = true, silent = true })
g_keymap('n', 'zf', 'za', { desc = 'Toggle [f]old under cursor.', noremap = true, silent = true })
g_keymap('n', 'zF', 'zA', { desc = 'Toggle all [F]olds under cursor.', noremap = true, silent = true })
