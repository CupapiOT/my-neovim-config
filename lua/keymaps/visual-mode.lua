local g_keymap = vim.keymap.set -- "Global keymap."

g_keymap('x', 'D', 'ygP', { desc = '[D]uplicate selected region.', noremap = true, silent = true })

-- The same as `sa` in visual mode.
g_keymap('x', 'S', ':<C-U>lua MiniSurround.add("visual")<CR>', { desc = '[S]urround add.', noremap = true, silent = true })
