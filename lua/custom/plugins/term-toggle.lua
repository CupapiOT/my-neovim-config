-- Term Toggle Function
-- (
-- Thank you u/SlagTheRisen on Reddit
-- Link Credit:
-- https://www.reddit.com/r/vim/comments/8n5bzs/comment/ljkp8re/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- )
local term_buf = nil
local term_win = nil

---@param height integer
---@param keep_open boolean | nil
function TermToggle(height, keep_open)
  keep_open = keep_open or false

  if vim.bo.filetype == 'neo-tree' then
    vim.api.nvim_input 'q'
  end
  vim.defer_fn(function()
    if term_win and vim.api.nvim_win_is_valid(term_win) then
      if keep_open then
        vim.api.nvim_set_current_win(term_win)
        vim.cmd 'startinsert!'
        term_win = vim.api.nvim_get_current_win()
        return
      end
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
  end, 0)
end

---@param command string
---@param do_enter boolean | nil
function KeymapCommand(command, do_enter)
  if do_enter == nil then
    do_enter = true
  end
  return function()
    TermToggle(15, true)
    vim.defer_fn(function()
      if do_enter then
        vim.api.nvim_feedkeys(command .. vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', false)
      else
        vim.api.nvim_feedkeys(command, 'n', false)
      end
    end, 0)
  end
end
