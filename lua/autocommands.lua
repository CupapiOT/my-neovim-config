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

-- Auto-source python virtual environment.
-- * Checks for a virtual environment in the current project directory.
-- * Sources it automatically when the terminal opens.
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    -- Exclude terminals opened by LazyGit or other plugins
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname:match 'lazygit' or bufname:match 'floatterm' then
      return
    end

    local cwd = vim.fn.getcwd()
    local venv_path = ''

    if vim.fn.isdirectory(cwd .. '/venv') == 1 then
      venv_path = cwd .. '/venv/bin/activate'
    elseif vim.fn.isdirectory(cwd .. '/.venv') == 1 then
      venv_path = cwd .. '/.venv/bin/activate'
    end

    if venv_path ~= '' then
      -- Get the current buffer ID
      local term_buf = vim.api.nvim_get_current_buf()

      -- Wait for the terminal to fully initialize before sending commands
      vim.defer_fn(function()
        vim.fn.chansend(vim.api.nvim_buf_get_option(term_buf, 'channel'), 'source ' .. venv_path .. '\n')
      end, 100)
    end
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
