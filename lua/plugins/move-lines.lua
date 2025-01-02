return {
  'kobbikobb/move-lines.nvim',
  config = function()
    require('move-lines').setup {
      move_down = '<C-j>',
      move_up = '<C-k>',
      move_left = '<C-h>',
      move_right = '<C-l>',
    }
  end,
}
