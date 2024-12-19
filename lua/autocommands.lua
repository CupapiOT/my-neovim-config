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

-- Highlighting Changes.
--  Color-columns with unobtrusive borders.
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi colorcolumn ctermbg=gray guibg=#20212D',
})
--  Unobtrusive split panel borders
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi WinSeparator guibg=None guifg=#3f3f3f',
})
--  Easier to see Line Numbers
vim.api.nvim_create_autocmd('VimEnter', { -- Absolute Line Numbers
  command = 'hi LineNr guifg=#7082b2',
})
vim.api.nvim_create_autocmd('VimEnter', { -- Relative Line Numbers Above
  command = 'hi LineNrAbove guifg=#7082b2',
})
vim.api.nvim_create_autocmd('VimEnter', { -- Relative Line Numbers Below
  command = 'hi LineNrBelow guifg=#7082b2',
})
--  Easier to see Comments
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi Comment guifg=#7082b2',
})
--  Easier to see Unnecessary Diagnostics.
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi DiagnosticUnnecessary guifg=#6873a5',
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

-- For auto-completion's sake.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.js',
  command = 'set filetype=javascriptreact',
})
