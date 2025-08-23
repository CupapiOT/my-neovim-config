local g_keymap = vim.keymap.set -- "Global keymap."

-- Meta-key (lalt) keymaps.
--  Refresh screen (redraw).
g_keymap('n', '<M-r>', ':mode<CR>', { desc = '[R]efresh the screen.', noremap = true, silent = true })
--  Trigger vim-sleuth manually to fix tabs being 8 spaces.
g_keymap('n', '<M-s>', ':Sleuth<CR>', { desc = 'Trigger vim-[S]leuth', noremap = true, silent = true })
--  Line-wrap toggle.
g_keymap('n', '<M-z>', ':set wrap!<CR>', { desc = 'Toggle line wrap.', noremap = true, silent = true })
