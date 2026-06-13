local g_keymap = vim.keymap.set -- "Global keymap."
require 'custom.plugins.term-toggle'

--Make commands.
g_keymap('n', '<leader>mm', KeymapCommand 'make', { desc = '[M]ake.', noremap = true })
g_keymap('n', '<leader>ma', KeymapCommand 'make all', { desc = '[M]ake [a]ll.', noremap = true })
g_keymap('n', '<leader>mr', KeymapCommand 'make run', { desc = '[M]ake [r]un.', noremap = true })
g_keymap('n', '<leader>mb', KeymapCommand 'make build', { desc = '[M]ake [b]uild.', noremap = true })
g_keymap('n', '<leader>md', KeymapCommand 'make debug', { desc = '[M]ake [d]ebug.', noremap = true })
g_keymap('n', '<leader>mc', KeymapCommand 'make clean', { desc = '[M]ake [c]lean.', noremap = true })
g_keymap('n', '<leader>mv', KeymapCommand 'make V=1', { desc = '[M]ake [v]erbose.', noremap = true })
g_keymap('n', '<leader>mt', KeymapCommand 'make test', { desc = '[M]ake [t]est.', noremap = true })
g_keymap('n', '<leader>m;', KeymapCommand('make ', false), { desc = '[M]ake ...', noremap = true })
