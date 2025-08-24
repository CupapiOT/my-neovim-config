local g_keymap = vim.keymap.set -- "Global keymap."

-- Open vim-dadbod-ui
g_keymap('n', '<leader>db', ':tabnew<CR>:DBUI<CR>', { desc = 'Open [DB]UI in new tab.', noremap = true, silent = true })
