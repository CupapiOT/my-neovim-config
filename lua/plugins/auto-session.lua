return {  -- Enables saving, auto-saving, and reloading multiple different sessions.
  'rmagatti/auto-session',
  lazy = false,

  config = function()
    require('auto-session').setup {
      log_level = 'info', -- Set to 'debug' if you want more verbose logging
      auto_session_suppress_dirs = { '~/Downloads' },
      pre_save_cmds = { 'silent! Neotree close', 'silent! UndotreeHide' },
      auto_restore_last_session = true,
    }
  end,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
