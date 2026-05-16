local g_keymap = vim.keymap.set -- "Global keymap."
require 'custom.plugins.term-toggle'

-- Make commands.
g_keymap('n', '<leader>mm', ':lua TermToggle(15)<CR>make<CR>', { desc = '[M]ake.', noremap = true })
g_keymap('n', '<leader>ma', ':lua TermToggle(15)<CR>make all<CR>', { desc = '[M]ake [a]ll.', noremap = true })
g_keymap('n', '<leader>mr', ':lua TermToggle(15)<CR>make run<CR>', { desc = '[M]ake [r]un.', noremap = true })
g_keymap('n', '<leader>mb', ':lua TermToggle(15)<CR>make build<CR>', { desc = '[M]ake [b]uild.', noremap = true })
g_keymap('n', '<leader>md', ':lua TermToggle(15)<CR>make debug<CR>', { desc = '[M]ake [b]uild.', noremap = true })
g_keymap('n', '<leader>mc', ':lua TermToggle(15)<CR>make clean<CR>', { desc = '[M]ake [c]lean.', noremap = true })
g_keymap('n', '<leader>mv', ':lua TermToggle(15)<CR>make V=1<CR>', { desc = '[M]ake [v]erbose.', noremap = true })
