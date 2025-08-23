local g_keymap = vim.keymap.set -- "Global keymap."

-- Refactor Keymaps.
g_keymap('x', '<leader>re', ':Refactor extract ', { desc = '[R]efactor [e]xtract (will prompt).', noremap = true }) -- 'x' == visual mode
g_keymap('x', '<leader>rf', ':Refactor extract_to_file ', { desc = '[R]efactor [e]xtract to [f]ile (will prompt).', noremap = true })
--  Extract function supports only visual mode
g_keymap('x', '<leader>rv', ':Refactor extract_var ', { desc = '[R]efactor extract [v]ariable (will prompt).', noremap = true })
--  Extract variable supports only visual mode
g_keymap({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var ', { desc = '[R]efactor [i]nline variable (will prompt).' })
--  Inline func supports only normal mode
g_keymap('n', '<leader>rI', ':Refactor inline_func ', { desc = '[R]efactor [I]nline function (will prompt).', noremap = true })
g_keymap('n', '<leader>rbb', ':Refactor extract_block ', { desc = '[R]efactor extract [b]lock (will prompt).', noremap = true })
g_keymap('n', '<leader>rbf', ':Refactor extract_block_to_file ', { desc = '[R]efactor extract [b]lock to [f]ile (will prompt).', noremap = true })
