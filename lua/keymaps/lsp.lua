local g_keymap = vim.keymap.set -- "Global keymap."

-- LSP keymaps
g_keymap('n', '<leader>li', ':LspInstall ', { desc = '[L]SP [i]nstall for...' })
g_keymap('n', '<leader>lI', ':LspInfo<CR>', { desc = '[L]SP show [I]nfo.', noremap = true, silent = true })
g_keymap('n', '<leader>ls', ':LspStart<CR>', { desc = '[L]SP [s]tart.', noremap = true, silent = true })
g_keymap('n', '<leader>lS', ':LspStop<CR>', { desc = '[L]SP [S]top.', noremap = true, silent = true })
g_keymap('n', '<leader>lr', ':LspRestart<CR>', { desc = '[L]SP [R]estart.', noremap = true, silent = true })
g_keymap('n', '<leader>lo', ':Mason<CR>', { desc = '[O]pen Mason.', noremap = true, silent = true })
