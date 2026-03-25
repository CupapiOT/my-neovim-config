local g_keymap = vim.keymap.set -- "Global keymap."

-- Lazygit Toggle
g_keymap('n', '<leader>g', ':LazyGit<CR>', { desc = 'Toggle lazy[g]it.', noremap = true, silent = true })

-- Undotree Toggle
g_keymap('n', '<leader>tu', ':UndotreeToggle<CR>', { desc = '[T]oggle [u]ndotree.', noremap = true, silent = true })
