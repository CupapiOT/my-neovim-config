return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>cc', group = '[C]ode [c]ompile', mode = { 'n' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]efactor' },
      { '<leader>rb', group = '[R]efactor extract [b]lock' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      -- { '<leader>g', group = 'Fu[g]itive' },
      { '<leader>C', group = 'Change [C]WD' },
      { '<leader>S', group = '[S]ession' },
      { '<leader>SQ', group = '[S]ession save as ..., then write-[Q]uit-all.' },
      { '<leader>SR', group = '[S]ession [R]estore...' },
      { '<leader>Ss', group = '[S]ession [s]ave as...' },
      { '<leader>o', group = '[O]pen with...' },
      { '<leader>ot', group = '[O]pen [t]est with...' },
      { '<leader>l', group = '[L]SP' },
      { '<leader>T', group = '[T]ab' },
      { '<leader>m', group = '[M]ake' },
    },
  },
}
