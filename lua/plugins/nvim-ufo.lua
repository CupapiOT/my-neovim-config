return { -- Gives modern and automatic code-folding.
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    -- Fold settings
    vim.opt.foldcolumn = '1'
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true

    local ufo = require 'ufo'

    -- Keymaps
    vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
    vim.keymap.set('n', 'zk', function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = 'Peek Fold' })

    -- Setup UFO
    ufo.setup {
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == 'neo-tree' then
          return '' -- disable code-folding for nvim-tree.
        end
        return { 'lsp', 'indent' }
      end,
    }
  end,
}
