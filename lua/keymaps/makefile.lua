local g_keymap = vim.keymap.set -- "Global keymap."
require 'custom.plugins.term-toggle'

---@param command string
local function make_command(command)
  return function()
    TermToggle(15, true)
    vim.defer_fn(function()
      vim.api.nvim_feedkeys('make ' .. command .. vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', false)
    end, 0)
  end
end

--Make commands.
g_keymap('n', '<leader>mm', make_command '', { desc = '[M]ake.', noremap = true })
g_keymap('n', '<leader>ma', make_command 'all', { desc = '[M]ake [a]ll.', noremap = true })
g_keymap('n', '<leader>mr', make_command 'run', { desc = '[M]ake [r]un.', noremap = true })
g_keymap('n', '<leader>mb', make_command 'build', { desc = '[M]ake [b]uild.', noremap = true })
g_keymap('n', '<leader>md', make_command 'debug', { desc = '[M]ake [d]ebug.', noremap = true })
g_keymap('n', '<leader>mc', make_command 'clean', { desc = '[M]ake [c]lean.', noremap = true })
g_keymap('n', '<leader>mv', make_command 'V=1', { desc = '[M]ake [v]erbose.', noremap = true })
