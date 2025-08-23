local g_keymap = vim.keymap.set -- "Global keymap."

-- Make commands.
g_keymap('n', '<leader>mm', ':!make<CR>', { desc = '[M]ake.', noremap = true })
g_keymap('n', '<leader>ma', ':!make all<CR>', { desc = '[M]ake [a]ll.', noremap = true })
g_keymap('n', '<leader>mr', ':!make run<CR>', { desc = '[M]ake [r]un.', noremap = true })
g_keymap('n', '<leader>mb', ':!make build<CR>', { desc = '[M]ake [b]uild.', noremap = true })
g_keymap('n', '<leader>mc', ':!make clean<CR>', { desc = '[M]ake [c]lean.', noremap = true })
g_keymap('n', '<leader>mv', ':!make V=1<CR>', { desc = '[M]ake [v]erbose.', noremap = true })
