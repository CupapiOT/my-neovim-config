return {  -- Enables the "Improved Bookmarks" plugin (Harpoon).
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- Harpoon Config and Keymaps
    local harpoon = require 'harpoon'
    harpoon:setup() -- REQUIRED

    -- Basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<C-t>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [a]dd' })
    -- vim.keymap.set('n', '<C-m>', function()
    --   harpoon.ui:toggle_quick_menu(harpoon:list())
    -- end, { desc = 'Harpoon toggle quick [m]enu.' })
    vim.keymap.set('n', '<M-h>', function()
      harpoon:list():select(1)
    end, { desc = 'Select first in harpoon list.' })
    vim.keymap.set('n', '<M-j>', function()
      harpoon:list():select(2)
    end, { desc = 'Select second in harpoon list.' })
    vim.keymap.set('n', '<M-k>', function()
      harpoon:list():select(3)
    end, { desc = 'Select third in harpoon list.' })
    vim.keymap.set('n', '<M-l>', function()
      harpoon:list():select(4)
    end, { desc = 'Select fourth in harpoon list.' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():next()
    end)
  end,
}
