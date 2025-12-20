local g_keymap = vim.keymap.set -- "Global keymap."

-- Refresh screen (redraw).
g_keymap('n', '<M-r>', ':mode<CR>', { desc = '[R]efresh the screen.', noremap = true, silent = true })

-- Trigger vim-sleuth manually to fix tabs being 8 spaces.
g_keymap('n', '<M-s>', ':Sleuth<CR>', { desc = 'Trigger vim-[S]leuth', noremap = true, silent = true })

-- Line-wrap toggle.
g_keymap('n', '<M-z>', ':set wrap!<CR>:set linebreak<CR>', { desc = 'Toggle word wrap.', noremap = true, silent = true })
