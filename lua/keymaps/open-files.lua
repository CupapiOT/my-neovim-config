local g_keymap = vim.keymap.set -- "Global keymap."

-- Opening files with specific apps/tools.
g_keymap('n', '<leader>ob', [[:!brave "$(wslpath -w "$(realpath '%')")"<CR>]], { desc = '[O]pen with [b]rave browser.', noremap = true, silent = true })
g_keymap('n', '<leader>oo', ':!./%.out<CR>', { desc = '[O]pen .[o]ut executable file.', noremap = true })
g_keymap('n', '<leader>op', ':!python3 %<CR>', { desc = '[O]pen with [p]ython3.', noremap = true, silent = true })
g_keymap('n', '<leader>otp', ':!python3 -m unittest -v %<CR>', { desc = '[O]pen [t]est (verbose) with [p]ython3.', noremap = true, silent = true })
g_keymap('n', '<leader>oj', ':!java %<<CR>', { desc = '[O]pen [j]ava program.', noremap = true, silent = true })
