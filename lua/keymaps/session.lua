local g_keymap = vim.keymap.set -- "Global keymap."

-- Quit
g_keymap('n', '<leader>SQM', ':SessionSave main<CR>:wqa<CR>', { desc = '[S]ession save as [m]ain, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQm', ':SessionSave main2<CR>:wqa<CR>', { desc = '[S]ession save as [m]ain, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQC', ':SessionSave config<CR>:wqa<CR>', { desc = '[S]ession save as [c]onfig, w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQL', ':SessionSave learn<CR>:wqa<CR>', { desc = '[S]ession save as [l]earn, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQl', ':SessionSave learn2<CR>:wqa<CR>', { desc = '[S]ession save as [l]earn2, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQT', ':SessionSave tempdir<CR>:wqa<CR>', { desc = '[S]ession save as [t]empdir, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQ;', function()
  -- Prompt user for a session name
  local session_name = vim.fn.input 'Session name to quit as: '

  if session_name ~= '' then
    vim.cmd('SessionSave ' .. session_name)
    vim.cmd 'wqa'
  else
    print 'Session name cannot be empty.'
  end
end, { desc = '[S]ession save as ..., then write-[Q]uit-all.', noremap = true, silent = true })

-- Save
g_keymap('n', '<leader>SSM', ':SessionSave main<CR>', { desc = '[S]ession [s]ave as [m]ain.', noremap = true, silent = true })
g_keymap('n', '<leader>SSm', ':SessionSave main2<CR>', { desc = '[S]ession [s]ave as [m]ain2.', noremap = true, silent = true })
g_keymap('n', '<leader>SSC', ':SessionSave config<CR>', { desc = '[S]ession [s]ave as [c]onfig.', noremap = true, silent = true })
g_keymap('n', '<leader>SSL', ':SessionSave learn<CR>', { desc = '[S]ession [s]ave as [l]earn.', noremap = true, silent = true })
g_keymap('n', '<leader>SSl', ':SessionSave learn2<CR>', { desc = '[S]ession [s]ave as [l]earn2.', noremap = true, silent = true })
g_keymap('n', '<leader>SST', ':SessionSave tempdir<CR>', { desc = '[S]ession [s]ave as [t]empdir.', noremap = true, silent = true })
g_keymap('n', '<leader>SS;', ':SessionSave ', { desc = '[S]ession [s]ave as...', noremap = true, silent = true })
g_keymap('n', '<leader>SD', ':SessionDelete ', { desc = '[S]ession [D]elete...', noremap = true, silent = true })

-- Restore
g_keymap('n', '<leader>SRM', ':SessionRestore main<CR>', { desc = '[S]ession [R]estore [m]ain.', noremap = true, silent = true })
g_keymap('n', '<leader>SRm', ':SessionRestore main2<CR>', { desc = '[S]ession [R]estore [m]ain2.', noremap = true, silent = true })
g_keymap('n', '<leader>SRC', ':SessionRestore config<CR>', { desc = '[S]ession [R]estore [c]onfig.', noremap = true, silent = true })
g_keymap('n', '<leader>SRL', ':SessionRestore learn<CR>', { desc = '[S]ession [R]estore [l]earn.', noremap = true, silent = true })
g_keymap('n', '<leader>SRl', ':SessionRestore learn2<CR>', { desc = '[S]ession [R]estore [l]earn2.', noremap = true, silent = true })
g_keymap('n', '<leader>SRT', ':SessionRestore tempdir<CR>', { desc = '[S]ession [R]estore [t]empdir.', noremap = true, silent = true })

-- Other commands
g_keymap('n', '<leader>Ss', ':SessionSearch<CR>', { desc = '[S]ession [S]earch.', noremap = true, silent = true })
g_keymap('n', '<leader>SA', ':SessionToggleAutoSave<CR>', { desc = '[S]ession toggle [A]utosave.', noremap = true, silent = true })
g_keymap('n', '<leader>SP', ':SessionPurgeOrphaned<CR>', { desc = '[S]ession [P]urge orphaned.', noremap = true, silent = true })
-- g_keymap('n', '<leader>SW', ':wqa<CR>', { desc = '[S]ession not-save, just [W]rite-quit-all.', noremap = true, silent = true })
-- g_keymap('n', '<leader>Sw', ':wq<CR>', { desc = '[S]ession not-save, just [w]rite-quit current buffer.', noremap = true, silent = true })
-- g_keymap('n', '<leader>S!', ':qa!<CR>', { desc = '[S]ession not-save, just quit-all-[!] without saving.', noremap = true, silent = true })
