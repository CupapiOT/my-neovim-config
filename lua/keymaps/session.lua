local g_keymap = vim.keymap.set -- "Global keymap."

---register_autosession_keymap
---@param session_name string
---@param make_two_sessions boolean
function RegisterAutosessionKeymap(session_name, make_two_sessions)
  local name = string.lower(session_name)
  local first_letter = string.sub(name, 1, 1)
  local all_other_letters = string.sub(name, 2)
  local mnemonic = string.format('[%s]%s', first_letter, all_other_letters)

  local first_session_key = string.upper(first_letter)
  g_keymap(
    'n',
    '<leader>SQ' .. first_session_key,
    ':AutoSession save ' .. name .. '<CR>:wqa<CR>',
    { desc = '[S]ession Save as ' .. mnemonic .. ', then w[Q]a.', noremap = true, silent = true }
  )
  g_keymap(
    'n',
    '<leader>SS' .. first_session_key,
    ':AutoSession save ' .. name .. '<CR>',
    { desc = '[S]ession [S]ave as ' .. mnemonic .. '.', noremap = true, silent = true }
  )
  g_keymap(
    'n',
    '<leader>SR' .. first_session_key,
    ':AutoSession restore ' .. name .. '<CR>',
    { desc = '[S]ession [R]estore ' .. mnemonic .. '.', noremap = true, silent = true }
  )

  if make_two_sessions then
    local second_session_key = first_letter
    g_keymap(
      'n',
      '<leader>SQ' .. second_session_key,
      ':AutoSession save ' .. name .. '2<CR>:wqa<CR>',
      { desc = '[S]ession save as ' .. mnemonic .. '2, then w[Q]a.', noremap = true, silent = true }
    )
    g_keymap(
      'n',
      '<leader>SS' .. second_session_key,
      ':AutoSession save ' .. name .. '2<CR>',
      { desc = '[S]ession [S]ave as ' .. mnemonic .. '2.', noremap = true, silent = true }
    )
    g_keymap(
      'n',
      '<leader>SR' .. second_session_key,
      ':AutoSession restore ' .. name .. '2<CR>',
      { desc = '[S]ession [R]estore ' .. mnemonic .. '2.', noremap = true, silent = true }
    )
  end
end

RegisterAutosessionKeymap('main', true)
RegisterAutosessionKeymap('learn', true)
RegisterAutosessionKeymap('freelance', true)
RegisterAutosessionKeymap('config', false)
RegisterAutosessionKeymap('tempdir', false)

-- Other commands
g_keymap('n', '<leader>SD', ':AutoSession delete ', { desc = '[S]ession [D]elete...', noremap = true })
g_keymap('n', '<leader>Ss', ':AutoSession search<CR>', { desc = '[S]ession [S]earch.', noremap = true, silent = true })
g_keymap('n', '<leader>SP', ':AutoSession purgeOrphaned<CR>', { desc = '[S]ession [P]urge orphaned.', noremap = true, silent = true })
