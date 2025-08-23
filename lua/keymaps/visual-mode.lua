local g_keymap = vim.keymap.set -- "Global keymap."

-- Visual-mode keymaps.
g_keymap('x', 'D', 'ygP', { desc = '[D]uplicate selected region.', noremap = true, silent = true })
