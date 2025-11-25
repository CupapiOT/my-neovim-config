local g_keymap = vim.keymap.set -- "Global keymap."

-- Quit
g_keymap('n', '<leader>SQM', ':AutoSession save main<CR>:wqa<CR>', { desc = '[S]ession save as [m]ain, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQm', ':AutoSession save main2<CR>:wqa<CR>', { desc = '[S]ession save as [m]ain, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQC', ':AutoSession save config<CR>:wqa<CR>', { desc = '[S]ession save as [c]onfig, w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQL', ':AutoSession save learn<CR>:wqa<CR>', { desc = '[S]ession save as [l]earn, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQl', ':AutoSession save learn2<CR>:wqa<CR>', { desc = '[S]ession save as [l]earn2, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQT', ':AutoSession save tempdir<CR>:wqa<CR>', { desc = '[S]ession save as [t]empdir, then w[Q]a.', noremap = true, silent = true })
g_keymap('n', '<leader>SQ;', function()
  local session_name = vim.fn.input 'Session name to quit as: '

  if session_name ~= '' then
    vim.cmd('AutoSession save ' .. session_name)
    vim.cmd 'wqa'
  else
    print 'Session name cannot be empty.'
  end
end, { desc = '[S]ession save as ..., then write-[Q]uit-all.', noremap = true, silent = true })

-- Save
g_keymap('n', '<leader>SSM', ':AutoSession save main<CR>', { desc = '[S]ession [s]ave as [m]ain.', noremap = true, silent = true })
g_keymap('n', '<leader>SSm', ':AutoSession save main2<CR>', { desc = '[S]ession [s]ave as [m]ain2.', noremap = true, silent = true })
g_keymap('n', '<leader>SSC', ':AutoSession save config<CR>', { desc = '[S]ession [s]ave as [c]onfig.', noremap = true, silent = true })
g_keymap('n', '<leader>SSL', ':AutoSession save learn<CR>', { desc = '[S]ession [s]ave as [l]earn.', noremap = true, silent = true })
g_keymap('n', '<leader>SSl', ':AutoSession save learn2<CR>', { desc = '[S]ession [s]ave as [l]earn2.', noremap = true, silent = true })
g_keymap('n', '<leader>SST', ':AutoSession save tempdir<CR>', { desc = '[S]ession [s]ave as [t]empdir.', noremap = true, silent = true })
g_keymap('n', '<leader>SS;', ':AutoSession save ', { desc = '[S]ession [s]ave as...', noremap = true })
g_keymap('n', '<leader>SD', ':AutoSession delete ', { desc = '[S]ession [D]elete...', noremap = true })

-- Restore
g_keymap('n', '<leader>SRM', ':AutoSession restore main<CR>', { desc = '[S]ession [R]estore [m]ain.', noremap = true, silent = true })
g_keymap('n', '<leader>SRm', ':AutoSession restore main2<CR>', { desc = '[S]ession [R]estore [m]ain2.', noremap = true, silent = true })
g_keymap('n', '<leader>SRC', ':AutoSession restore config<CR>', { desc = '[S]ession [R]estore [c]onfig.', noremap = true, silent = true })
g_keymap('n', '<leader>SRL', ':AutoSession restore learn<CR>', { desc = '[S]ession [R]estore [l]earn.', noremap = true, silent = true })
g_keymap('n', '<leader>SRl', ':AutoSession restore learn2<CR>', { desc = '[S]ession [R]estore [l]earn2.', noremap = true, silent = true })
g_keymap('n', '<leader>SRT', ':AutoSession restore tempdir<CR>', { desc = '[S]ession [R]estore [t]empdir.', noremap = true, silent = true })

-- Other commands
g_keymap('n', '<leader>Ss', ':AutoSession search<CR>', { desc = '[S]ession [S]earch.', noremap = true, silent = true })
g_keymap('n', '<leader>SP', ':AutoSession purgeOrphaned<CR>', { desc = '[S]ession [P]urge orphaned.', noremap = true, silent = true })
