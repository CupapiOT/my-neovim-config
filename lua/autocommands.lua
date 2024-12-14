-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Colorcolumns with unobtrusive borders.
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi colorcolumn ctermbg=gray guibg=#20212D',
})

-- Unobtrusive split panel borders
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi WinSeparator guibg=None guifg=#3f3f3f',
})

-- Easier to see Line Numbers
vim.api.nvim_create_autocmd('VimEnter', { -- Absolute Line Numbers
  command = 'hi LineNr guifg=#606f99',
})
vim.api.nvim_create_autocmd('VimEnter', { -- Relative Line Numbers Above
  command = 'hi LineNrAbove guifg=#606f99',
})
vim.api.nvim_create_autocmd('VimEnter', { -- Relative Line Numbers Below
  command = 'hi LineNrBelow guifg=#606f99',
})

-- Easier to see Comments
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi Comment guifg=#606f99',
})

-- Relative line numbers on focus,...
vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
  pattern = '*',
  callback = function()
    vim.wo.relativenumber = true
    vim.wo.number = true
  end,
})
--  ...absolute line numbers on unfocus.
vim.api.nvim_create_autocmd({ 'BufLeave', 'WinLeave' }, {
  pattern = '*',
  callback = function()
    vim.wo.relativenumber = false
    vim.wo.number = true
  end,
})

-- For autocompletion's sake.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.js',
  command = 'set filetype=javascriptreact',
})

