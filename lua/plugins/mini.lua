return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup {
      custom_textobjects = {
        -- Current line.
        -- `vaL` = Select around entire line (starting from first column).
        -- `viL` = Select inside entire line (starting from first non-space character).
        L = { '^ *().*()' },

        -- Whole buffer
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line '$',
            col = math.max(vim.fn.getline('$'):len(), 1),
          }
          return { from = from, to = to }
        end,

        -- Code blocks:
        -- 1. Inline: ```Code block```
        -- 2. Multiline:
        --    ```language
        --    Code block
        --    ```
        c = function(ai_type)
          local cur = vim.api.nvim_win_get_cursor(0)[1]
          local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

          -- Find opening fence
          local start_line
          for l = cur, 1, -1 do
            if lines[l]:match '^```' then
              start_line = l
              break
            end
          end

          if not start_line then
            return nil
          end

          -- Find closing fence
          local end_line
          for l = start_line + 1, #lines do
            if lines[l]:match '^```%s*$' then
              end_line = l
              break
            end
          end

          if not end_line or cur > end_line then
            return nil
          end

          if ai_type == 'a' then
            return {
              from = { line = start_line, col = 1 },
              to = { line = end_line, col = math.max(#lines[end_line], 1) },
            }
          end

          -- inside
          return {
            from = { line = start_line + 1, col = 1 },
            to = { line = end_line - 1, col = math.max(#lines[end_line - 1], 1) },
          }
        end,
      },
respect_selection_type = true,
      n_lines = 500,
    }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      custom_surroundings = {
        -- ```language
        -- Code block
        -- ```
        c = {
          input = {
            '```[%w_-]*\n().*()\n```',
          },
          output = function()
            return {
              left = '```\n',
              right = '\n```',
            }
          end,
        },
      },
      n_lines = 500,
    }

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
