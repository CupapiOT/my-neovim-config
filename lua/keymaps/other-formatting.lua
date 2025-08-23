local g_keymap = vim.keymap.set -- "Global keymap."

-- Remove `^M` end-of-line registers and preserve cursor position explicitly.
g_keymap('n', '<leader>crc', function()
  -- Save the cursor position
  local pos = vim.api.nvim_win_get_cursor(0)
  -- Perform the substitution
  vim.cmd [[%s/\r//g]]
  -- Restore cursor position after 100ms
  vim.defer_fn(function()
    vim.api.nvim_win_set_cursor(0, pos)
  end, 100)
end, { desc = '[C]ode [r]emove [c]arriage return.', noremap = true, silent = true })
--[[ 
g_keymap( -- Does not work consistently nor is it essential, so it's unused.
  'x',
  '<leader>crc',
  function()
    -- Save the cursor position
    local pos = vim.api.nvim_win_get_cursor(0)
    -- Save the visual selection range
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    -- Perform the substitution
    vim.cmd("%s/\r//g")
    -- Restore cursor position and selection after 100ms
    vim.defer_fn(function()
      vim.api.nvim_win_set_cursor(0, pos)
      vim.fn.setpos("'<", start_pos)
      vim.fn.setpos("'>", end_pos)
      vim.cmd('normal! gv') -- Reselect visual range
    end, 100)
  end,
{ desc = '[C]ode [r]emove [c]arriage return.', noremap = true, silent = true })
--]]
