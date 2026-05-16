-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal float<CR>', desc = 'NeoTree reveal', silent = true },
    { '<M-b>', ':Neotree float buffers<CR>', desc = 'NeoTree show open buffers', silent = true },
    { '<M-g>', ':Neotree float git_status<CR>', desc = 'NeoTree show git statuses', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['U'] = 'navigate_up',
        },
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function(arg)
          vim.opt.relativenumber = true
          vim.opt.number = true
        end,
      },
    },
  },
}
