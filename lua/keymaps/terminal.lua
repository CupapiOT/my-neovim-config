local g_keymap = vim.keymap.set -- "Global keymap."

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
g_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Term Toggle Function
-- (
-- Thank you u/SlagTheRisen on Reddit
-- Link Credit:
-- https://www.reddit.com/r/vim/comments/8n5bzs/comment/ljkp8re/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- )
local term_buf = nil
local term_win = nil

function TermToggle(height)
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true) -- close the terminal window
    term_win = nil -- clear our state
    return
  else
    vim.cmd 'botright new'
    local new_buf = vim.api.nvim_get_current_buf()
    vim.cmd('resize ' .. height)
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.cmd('buffer ' .. term_buf) -- go to terminal buffer
      vim.cmd('bd ' .. new_buf) -- cleanup new buffer
    else
      vim.cmd 'terminal'
      term_buf = vim.api.nvim_get_current_buf()
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.signcolumn = 'no'
    end
    vim.cmd 'startinsert!'
    term_win = vim.api.nvim_get_current_win()
  end
end

-- Term Toggle Keymaps
g_keymap('n', '<M-t>', ':lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from normal mode.', noremap = true, silent = true })
g_keymap('i', '<M-t>', '<Esc>:lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from insert mode.', noremap = true, silent = true })
g_keymap('t', '<M-t>', '<C-\\><C-n>:lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from terminal mode.', noremap = true, silent = true })
