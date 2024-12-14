-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local g_keymap = vim.keymap.set -- "Global keymap."

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
g_keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
g_keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
g_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- g_keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- g_keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- g_keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- g_keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keymaps to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
g_keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
g_keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
g_keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
g_keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keymaps to make split resizing easier.
g_keymap('n', '<C-w>+', '3<C-w>+', { noremap = true, silent = true })
g_keymap('n', '<C-w>-', '3<C-w>-', { noremap = true, silent = true })
g_keymap('n', '<C-w>>', '5<C-w>>', { noremap = true, silent = true })
g_keymap('n', '<C-w><', '5<C-w><', { noremap = true, silent = true })
--  Use CTRL+SHIFT+<hjkl> to in/decrease window size.
--  Use CTRL+SHIFT+E to equalize window size.
--  Uncomment below if your terminal supports CTRL+SHIFT+<char> chords.
-- g_keymap('n', '<C-S-h>', '<C-w><', { desc = 'Decrease editor width.' })
-- g_keymap('n', '<C-S-l>', '<C-w>>', { desc = 'Increase editor width.' })
-- g_keymap('n', '<C-S-j>', '<C-w>-', { desc = 'Decrease editor height.' })
-- g_keymap('n', '<C-S-k>', '<C-w>+', { desc = 'Increase editor height.' })
-- g_keymap('n', '<C-S-e>', '<C-w>=', { desc = 'Equalize editor width and height.' })

-- Keymaps to make C-d and C-u, n and N easier to work with; for easier code scanning.
g_keymap('n', '<C-u>', '<C-u>zz', { desc = 'Make `<C-u>` center the cursor every time.', noremap = true, silent = true })
g_keymap('n', '<C-d>', '<C-d>zz', { desc = 'Make `<C-d>` center the cursor every time.', noremap = true, silent = true })
g_keymap('n', 'n', 'nzz', { desc = 'Make `n` center the cursor every time.', noremap = true, silent = true })
g_keymap('n', 'N', 'Nzz', { desc = 'Make `N` center the cursor every time.', noremap = true, silent = true })

-- Keymaps for common cd commands
g_keymap('n', '<leader>Cc', ':cd %:p:h<CR>', { desc = '[C]hange CWD to the dir of [c]urrent buffer.', noremap = true, silent = true })
g_keymap('n', '<leader>Cu', ':cd ..<CR>', { desc = '[C]hange CWD [u]pwards to parent dir.', noremap = true, silent = true })
g_keymap('n', '<leader>Ch', ':cd<CR>', { desc = '[C]hange CWD to the home dir.', noremap = true, silent = true })

-- Tabbing keymaps.
g_keymap('n', '<leader>TN', ':tabnew ', { desc = '[T]ab-[n]ew without carriage return.' })
g_keymap('n', '<leader>TC', ':tabclose<CR>', { desc = '[T]ab-[c]lose.', noremap = true, silent = true })

-- Keymaps for fugtitive.vim and lazygit
g_keymap('n', '<leader>ga', ':Git add .<CR>', { desc = 'Fu[g]itive [a]dd all files.' })
g_keymap('n', '<leader>gd', ':Gdiff<CR>', { desc = 'Fu[g]itive [d]iff.' })
g_keymap('n', '<leader>gw', ':Gwrite<CR>', { desc = 'Fu[g]itive [w]rite (stage).' })
g_keymap('n', '<leader>gr', ':Gread<CR>', { desc = 'Fu[g]itive [r]ead (unstage).' })
g_keymap('n', '<leader>gc', ':Git commit -S<CR>', { desc = 'Fu[g]itive [c]ommit.' })
g_keymap('n', '<leader>gp', ':Git push<CR>', { desc = 'Fu[g]itive [p]ush.' })
g_keymap('n', '<leader>gf', ':Git fetch<CR>', { desc = 'Fu[g]itive [f]etch.' })
g_keymap('n', '<leader>gP', ':Git pull<CR>', { desc = 'Fu[g]itive [P]ull.' })
g_keymap('n', '<leader>gR', ':Git rebase<CR>', { desc = 'Fu[g]itive [R]ebase.' })
g_keymap('n', '<leader>gs', ':Git<CR>', { desc = 'Fu[g]itive [s]tatus.' })
g_keymap('n', '<leader>gi', ':Git init<CR>', { desc = 'Fu[g]itive [I]nitiate.' })

-- Toggle keymaps
--  Neotree Toggle
g_keymap('n', '<leader>tt', ':Neotree toggle source=filesystem reveal=true position=left<CR>', { desc = '[T]oggle neo-[t]ree', noremap = true, silent = true })
--  Lazygit Toggle
g_keymap('n', '<leader>tl', ':LazyGit<CR>', { desc = '[T]oggle [l]azygit.', noremap = true, silent = true })
--  AutoSave Toggle
g_keymap('n', '<leader>tA', ':ASToggle<CR>', { desc = '[T]oggle [A]utoSave.', noremap = true, silent = true })
--  Line-wrap Toggle
g_keymap('n', '<M-z>', ':set wrap!<CR>', { desc = 'Toggle line wrap.', noremap = true, silent = true })
--  Undotree Toggle
g_keymap('n', '<leader>tu', ':UndotreeToggle<CR>', { desc = '[T]oggle [u]ndotree.', noremap = true, silent = true })

-- Make it so `x` outputs to the underscore register so it doesn't interfere.
g_keymap('n', 'x', '"_x', { desc = 'Delete character under cursor, outputs to underscore register.' })

-- Session keymaps.
g_keymap('n', '<leader>SQM', ':SessionSave main<CR>:wqa<CR>', { desc = '[S]ession save as [m]ain, then write-[Q]uit-all.', noremap = true, silent = true })
g_keymap('n', '<leader>SQC', ':SessionSave config<CR>:wqa<CR>', { desc = '[S]ession save as [c]onfig, then write-[Q]uit-all.', noremap = true, silent = true })
g_keymap('n', '<leader>SQL', ':SessionSave learn<CR>:wqa<CR>', { desc = '[S]ession save as [l]earn, then write-[Q]uit-all.', noremap = true, silent = true })
g_keymap(
  'n',
  '<leader>SQT',
  ':SessionSave tempdir<CR>:wqa<CR>',
  { desc = '[S]ession save as [t]empdir, then write-[Q]uit-all.', noremap = true, silent = true }
)
g_keymap('n', '<leader>SQ;', function()
  -- Prompt user for a session name
  local session_name = vim.fn.input 'Session name to quit as: '

  if session_name ~= '' then
    vim.cmd('SessionSave ' .. session_name)
    vim.cmd 'wqa'
  else
    print 'Session name cannot be empty.'
  end
end, { desc = '[S]ession save as ..., then write-[Q]uit-all.', noremap = true, silent = true })
-- g_keymap('n', '<leader>SW', ':wqa<CR>', { desc = '[S]ession not-save, just [W]rite-quit-all.', noremap = true, silent = true })
-- g_keymap('n', '<leader>Sw', ':wq<CR>', { desc = '[S]ession not-save, just [w]rite-quit current buffer.', noremap = true, silent = true })
-- g_keymap('n', '<leader>S!', ':qa!<CR>', { desc = '[S]ession not-save, just quit-all-[!] without saving.', noremap = true, silent = true })
g_keymap('n', '<leader>Ssm', ':SessionSave main<CR>', { desc = '[S]ession [s]ave as [m]ain.', noremap = true, silent = true })
g_keymap('n', '<leader>Ssc', ':SessionSave config<CR>', { desc = '[S]ession [s]ave as [c]onfig.', noremap = true, silent = true })
g_keymap('n', '<leader>Ssl', ':SessionSave learn<CR>', { desc = '[S]ession [s]ave as [l]earn.', noremap = true, silent = true })
g_keymap('n', '<leader>Sst', ':SessionSave tempdir<CR>', { desc = '[S]ession [s]ave as [t]empdir.', noremap = true, silent = true })
g_keymap('n', '<leader>Ss;', ':SessionSave ', { desc = '[S]ession [s]ave as...', noremap = true, silent = true })
g_keymap('n', '<leader>SD', ':SessionDelete ', { desc = '[S]ession [D]elete...', noremap = true, silent = true })
g_keymap('n', '<leader>SS', ':SessionSearch<CR>', { desc = '[S]ession [S]earch.', noremap = true, silent = true })
g_keymap('n', '<leader>SA', ':SessionToggleAutoSave<CR>', { desc = '[S]ession toggle [A]utosave.', noremap = true, silent = true })
g_keymap('n', '<leader>SRM', ':SessionRestore main<CR>', { desc = '[S]ession [R]estore [m]ain.', noremap = true, silent = true })
g_keymap('n', '<leader>SRC', ':SessionRestore config<CR>', { desc = '[S]ession [R]estore [c]onfig.', noremap = true, silent = true })
g_keymap('n', '<leader>SRL', ':SessionRestore learn<CR>', { desc = '[S]ession [R]estore [l]earn.', noremap = true, silent = true })
g_keymap('n', '<leader>SRT', ':SessionRestore tempdir<CR>', { desc = '[S]ession [R]estore [t]empdir.', noremap = true, silent = true })
g_keymap('n', '<leader>SP', ':SessionPurgeOrphaned<CR>', { desc = '[S]ession [P]urge orphaned.', noremap = true, silent = true })

-- Opening files with specific apps/tools.
g_keymap('n', '<leader>ob', [[:!brave "$(wslpath -w "$(realpath '%')")"<CR>]], { desc = '[O]pen with [b]rave browser.', noremap = true, silent = true })
g_keymap(
  'n',
  '<leader>cco',
  [[:!gcc -Wall -Wextra -Werror -O2 -pedantic -std=c99 % -o %.out<CR>]],
  { desc = '[C]ode [c]ompile [o]nefile with gcc (output: %.out).', noremap = true, silent = true }
)
g_keymap(
  'n',
  '<leader>ccO',
  [[:!gcc -Wall -Wextra -Werror -O2 -pedantic -std=c99 % -o ]],
  { desc = '[C]ode [c]ompile with gcc (specify [O]utput).', noremap = true, silent = true }
)
g_keymap('n', '<leader>op', [[:!python3 %<CR>]], { desc = '[O]pen with [p]ython3.', noremap = true, silent = true })

-- Refresh screen (redraw).
g_keymap('n', '<M-r>', ':mode<CR>', { desc = '[R]efreshes the screen.', noremap = true, silent = true })

-- Select all.
g_keymap('n', '<M-a>', 'ggVG', { desc = 'Selects [a]ll.' })

-- LSP keymaps
g_keymap('n', '<leader>li', ':LspInstall ', { desc = '[L]SP [i]nstall for...' })
g_keymap('n', '<leader>lI', ':LspInfo<CR>', { desc = '[L]SP show [I]nfo.', noremap = true, silent = true })
g_keymap('n', '<leader>ls', ':LspStart<CR>', { desc = '[L]SP [s]tart.', noremap = true, silent = true })
g_keymap('n', '<leader>lS', ':LspStop<CR>', { desc = '[L]SP [S]top.', noremap = true, silent = true })
g_keymap('n', '<leader>lr', ':LspRestart<CR>', { desc = '[L]SP [R]estart.', noremap = true, silent = true })
g_keymap('n', '<leader>lo', ':Mason<CR>', { desc = '[O]pen Mason.', noremap = true, silent = true })

-- Refactor Keymaps.
g_keymap('x', '<leader>re', ':Refactor extract ', { desc = '[R]efactor [e]xtract (will prompt).', noremap = true }) -- 'x' == visual mode
g_keymap('x', '<leader>rf', ':Refactor extract_to_file ', { desc = '[R]efactor [e]xtract to [f]ile (will prompt).', noremap = true })
--  Extract function supports only visual mode
g_keymap('x', '<leader>rv', ':Refactor extract_var ', { desc = '[R]efactor extract [v]ariable (will prompt).', noremap = true })
--  Extract variable supports only visual mode
g_keymap({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var ', { desc = '[R]efactor [i]nline variable (will prompt).' })
--  Inline func supports only normal mode
g_keymap('n', '<leader>rI', ':Refactor inline_func ', { desc = '[R]efactor [I]nline function (will prompt).', noremap = true })
g_keymap('n', '<leader>rbb', ':Refactor extract_block ', { desc = '[R]efactor extract [b]lock (will prompt).', noremap = true })
g_keymap('n', '<leader>rbf', ':Refactor extract_block_to_file ', { desc = '[R]efactor extract [b]lock to [f]ile (will prompt).', noremap = true })

-- Trigger vim-sleuth manually to fix tabs being 8 spaces.
g_keymap('n', '<M-s>', ':Sleuth<CR>', { desc = 'Trigger vim-[S]leuth', noremap = true, silent = true })

-- Remove `^M` end-of-line registers and preserve cursor position explicitly.
g_keymap(
  'n',
  '<leader>crc',
  function()
    -- Save the cursor position
    local pos = vim.api.nvim_win_get_cursor(0)
    -- Perform the substitution
    vim.cmd([[%s/\r//g]])
    -- Restore cursor position after 100ms
    vim.defer_fn(function()
      vim.api.nvim_win_set_cursor(0, pos)
    end, 100)
  end,
  { desc = '[C]ode [r]emove [c]arriage return.', noremap = true, silent = true }
)
--[[ 
g_keymap( -- Does not work consistently, so it's unused.
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
   { desc = '[C]ode [r]emove [c]arriage return.', noremap = true, silent = true }
)
--]]

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
    vim.cmd 'hide'
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
vim.keymap.set('n', '<M-t>', ':lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from normal mode.', noremap = true, silent = true })
vim.keymap.set('i', '<M-t>', '<Esc>:lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from insert mode.', noremap = true, silent = true })
vim.keymap.set('t', '<M-t>', '<C-\\><C-n>:lua TermToggle(15)<CR>', { desc = 'Toggles the [t]erminal from terminal mode.', noremap = true, silent = true })

