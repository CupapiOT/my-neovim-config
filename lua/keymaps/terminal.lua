local g_keymap = vim.keymap.set -- "Global keymap."
require 'custom.plugins.term-toggle'

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
g_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Term Toggle Keymaps
g_keymap('n', '<M-t>', ':lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from normal mode.', noremap = true, silent = true })
g_keymap('i', '<M-t>', '<Esc>:lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from insert mode.', noremap = true, silent = true })
g_keymap('t', '<M-t>', '<C-\\><C-n>:lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from terminal mode.', noremap = true, silent = true })
g_keymap('t', '<C-j>', '<C-\\><C-n><C-w><C-k>', { desc = 'Goes up one window.', noremap = true, silent = true })
