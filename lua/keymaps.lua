-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Miscellaneous Good Stuff
require 'keymaps.quality-of-life'
require 'keymaps.split-panes-tabs'

-- Mode/key-specific
require 'keymaps.alt-key'
require 'keymaps.insert-mode'
require 'keymaps.visual-mode'
require 'keymaps.code-fold'

-- Code convenience
require 'keymaps.compile'
require 'keymaps.open-files'
require 'keymaps.makefile'
require 'keymaps.refactor'
require 'keymaps.other-formatting'
require 'keymaps.terminal'

-- Tool-specific
require 'keymaps.toggles'
require 'keymaps.session'
require 'keymaps.lsp'
-- require 'keymaps.fugitive-unused'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
