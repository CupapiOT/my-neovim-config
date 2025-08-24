return {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  require 'plugins.gitsigns',

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  -- Useful plugin to show you pending keybinds.
  require 'plugins.which-key',

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  -- Fuzzy Finder (files, LSP, etc)
  require 'plugins.telescope',

  -- LSP Plugins
  require 'plugins.lazydev',
  { 'Bilal2453/luvit-meta', lazy = true },
  --  Main LSP Configuration
  require 'plugins.nvim-lspconfig',

  -- Autoformat
  require 'plugins.autoformat',

  -- Autocompletion
  --   Specifically for Assembly and SQL from-buffer autocompletion. It's here and not in a list of deps in `autocompletion` or else it won't work.
  'hrsh7th/cmp-buffer',
  --   Actual auto-completion plugins.
  require 'plugins.autocompletion',

  -- Colorscheme Plugin
  require 'plugins.tokyonight',

  -- Highlight to-do, notes, etc in comments
  require 'plugins.todo-comments',

  -- Collection of various small independent plugins/modules
  require 'plugins.mini',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- My custom plugins start here.

  -- Adds context at the top of the buffer to help in knowing where my cursor is.
  { 'nvim-treesitter/nvim-treesitter-context' },

  -- Enables navigation within tmux panes.
  require 'plugins.nvim-tmux-navigation',

  -- Enables saving, auto-saving, and reloading multiple different sessions.
  require 'plugins.auto-session',

  -- -- Adds powerful git commands.
  -- { 'tpope/vim-fugitive' },

  -- Builds on top of mini.nvim's surrounding features.
  { 'tpope/vim-surround' },

  -- Enables autosaving. Some features needed to be disabled for this to work
  -- without annoying the user (aka me).
  { 'pocco81/autosave.nvim' },

  -- Visualizes Vim's undotree feature.
  { 'mbbill/undotree' },

  -- Adds a powerful git UI.
  { 'kdheepak/lazygit.nvim' },

  -- Shows colors next to various types of color codes/names.
  require 'plugins.vim-hexokinase',

  -- Enables the "Improved Bookmarks" plugin (Harpoon).
  require 'plugins.harpoon',

  -- Adds several more refactoring options.
  require 'plugins.refactoring',

  -- Add ability to move selected lines up or down in visual mode.
  require 'plugins.move-lines',

  -- Gives modern and automatic code-folding.
  require 'plugins.nvim-ufo',

  -- SQL Plugin
  require 'plugins.sql-vim-dadbod',

  -- Enables Live Server like in VS-code (Unused).
  -- {
  --   'barrett-ruth/live-server.nvim',
  --   build = 'pnpm add -g live-server',
  --   cmd = { 'LiveServerStart', 'LiveServerStop' },
  --   config = true;59;28mcpPG;60;28M;60;28U!  --
  -- },

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}
