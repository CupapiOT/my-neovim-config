-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
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
local line_number_colors = '#788cbf'
vim.api.nvim_create_autocmd('VimEnter', { -- Absolute Line Numbers
  command = 'hi LineNr guifg=' .. line_number_colors,
})
vim.api.nvim_create_autocmd('VimEnter', { -- Relative Line Numbers Above
  command = 'hi LineNrAbove guifg=' .. line_number_colors,
})
vim.api.nvim_create_autocmd('VimEnter', { -- Relative Line Numbers Below
  command = 'hi LineNrBelow guifg=' .. line_number_colors,
})
--  Easier to see Comments
local comment_colors = '#788cbf'
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi Comment guifg=' .. comment_colors,
})
--  Easier to see Unnecessary Diagnostics.
local unnecessary_vars_color = '#707CAF'
vim.api.nvim_create_autocmd('VimEnter', {
  command = 'hi DiagnosticUnnecessary guifg=' .. unnecessary_vars_color,
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

-- Assembly should be 8-width tabs for alignment.
vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
  pattern = '*.asm',
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 8
    vim.bo.shiftwidth = 8
    vim.bo.softtabstop = 8
  end,
})

-- Auto-open images with feh
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = { '*.ppm', '*.png', '*.jpg', '*.jpeg', '*.webp', '*.svg', '*.bmp', '*.gif', '*.tiff' },
  callback = function()
    local file = vim.fn.expand '%:p'
    vim.fn.jobstart({ 'feh', file }, { detach = true })
  end,
})

-- Auto-open videos with mpv
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = {
    '*.mp4',
    '*.m4v',
    '*.mov',
    '*.mkv',
    '*.webm',
    '*.avi',
    '*.flv',
    '*.f4v',
    '*.wmv',
    '*.asf',
    '*.mpg',
    '*.mpeg',
    '*.mpe',
    '*.mpv',
    '*.3gp',
    '*.3g2',
    '*.ts',
    '*.m2ts',
    '*.mts',
    '*.vob',
    '*.ogv',
    '*.rm',
    '*.rmvb',
    '*.divx',
    '*.xvid',
    '*.y4m',
    '*.ivf',
    '*.nut',
  },
  callback = function()
    local file = vim.fn.expand '%:p'
    vim.fn.jobstart({ 'mpv', '--loop', file }, { detach = true })
  end,
})

vim.api.nvim_create_autocmd('ExitPre', {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == 'terminal' then
        local job = vim.b[buf].terminal_job_id
        if job then
          vim.fn.jobstop(job)
        end
      end
    end
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
