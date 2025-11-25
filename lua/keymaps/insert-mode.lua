local g_keymap = vim.keymap.set -- "Global keymap."

-- Append symbols to the end of a line.
g_keymap('i', '<M-;>', '<Esc>mQA;<Esc>`Qa', { desc = 'Append [;] to the end of a line.', noremap = true, silent = true })
g_keymap('i', '<M-,>', '<Esc>mQA,<Esc>`Qa', { desc = 'Append [,] to the end of a line.', noremap = true, silent = true })

-- Go to the start/end of the line.
g_keymap('i', '<C-s>', '<C-o>I', { desc = 'Go to [s]tart (of the first character) of the current line.', noremap = true, silent = true })
g_keymap('i', '<C-e>', '<End>', { desc = 'Go to [e]nd of current line.', noremap = true, silent = true })

-- Delete character to the right (Works with autocomplete snippets as a fallback too!)
g_keymap('i', '<C-l>', '<Del>', { desc = 'Delete.', noremap = true, silent = true })
