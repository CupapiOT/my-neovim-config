local g_keymap = vim.keymap.set -- "Global keymap."
require 'custom.plugins.term-toggle'

local function oo()
  local filename = vim.fn.expand '%:r'
  KeymapCommand('./' .. filename .. '.out')()
end

local function op()
  local filename = vim.fn.expand '%'
  KeymapCommand('python3 ' .. filename)()
end

local function otp()
  local filename = vim.fn.expand '%'
  KeymapCommand('python3 -m unittest -v ' .. filename)()
end

local function oj()
  local filename = vim.fn.expand '%'
  KeymapCommand('java ' .. filename)()
end

-- Opening files with specific apps/tools.
g_keymap('n', '<leader>ob', [[:!brave "$(wslpath -w "$(realpath '%')")"<CR>]], { desc = '[O]pen with [b]rave browser.', noremap = true, silent = true })
g_keymap('n', '<leader>oo', oo, { desc = '[O]pen .[o]ut executable file (removes file extension).', noremap = true })
g_keymap('n', '<leader>op', op, { desc = '[O]pen with [p]ython3.', noremap = true, silent = true })
g_keymap('n', '<leader>otp', otp, { desc = '[O]pen [t]est (verbose) with [p]ython3.', noremap = true, silent = true })
g_keymap('n', '<leader>oj', oj, { desc = '[O]pen [j]ava program.', noremap = true, silent = true })

-- Open Images with `feh`
--   Single image
g_keymap('n', '<leader>of', function()
  local file = vim.fn.expand '%:p'
  vim.fn.jobstart({ 'feh', file }, { detach = true })
end, { desc = '[O]pen image with [f]eh.', noremap = true, silent = true })
--   Entire folder
g_keymap('n', '<leader>oF', function()
  vim.fn.jobstart({ 'feh', '--browse', '.' }, { detach = true })
end, { desc = '[O]pen whole folder with [F]eh.', noremap = true, silent = true })

-- Open videos with `mpv`
g_keymap('n', '<leader>om', function()
  local file = vim.fn.expand '%:p'
  vim.fn.jobstart({ 'mpv', '--loop', file }, { detach = true })
end, { desc = '[O]pen video with [f]eh.', noremap = true, silent = true })
