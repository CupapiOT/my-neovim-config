return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip').filetype_extend('javascriptreact', { 'html' })
            require('luasnip').filetype_extend('html', { 'html' })
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      config = function()
        local ls = require 'luasnip'
        local parse_snippet = require('luasnip').parser.parse_snippet
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        -- local fmt = require('luasnip.extras.fmt').fmt

        ls.config.set_config {
          -- This tells luasnip to keep the last snippet, letting you jump
          -- back into it even after you leave it.
          history = true,
          updateevents = 'TextChanged, TextChangedI',
        }
        ls.add_snippets('python', {
          parse_snippet(
            'inem',
            [[
              def main():
                  $pass


              if __name__ == '__main__':
                  main()
            ]]
          ),
        })
        ls.add_snippets('c', {
          parse_snippet(
            'compg', -- Compare generic.
            'int compare_$1(const void *left, const void *right) {\n  if ($2)\n    return 1;\n  if ($0)\n    return -1;\n  return 0;\n}'
            --[[
              int compare_$1(const void *left, const void *right) {
                if ($2)
                  return 1;
                if ($0)
                  return -1;
                return 0;
              }
              --]]
          ),
          parse_snippet(
            'compint', -- Compare ints.
            'int compare_int(const void *left, const void *right) {\n  if (*(int *)left > *(int *)right)\n    return 1;\n  if (*(int *)left < *(int *)right)\n    return -1;\n  return 0;\n}'
            --[[
              int compare_int(const void *left, const void *right) {
              if (*(int *)left > *(int *)right) {
                return 1;
              }
              if (*(int *)left < *(int *)right) {
                return -1;
              }
              return 0;
              }
              --]]
          ),
          -- s("openfile", {
          --   t("FILE *"), i(1, "fptr"), t({";", ""}),  -- Placeholder for file pointer variable
          --   t('char '), i(2, "FILE_NAME"), t('[] = "'), i(3, "path/to/file"), t({ '";', "" }),
          --   t(""), i(1), t(" = fopen("), i(2), t(', "'), i(4, "r"), t('");'),  -- Placeholder for fopen
          --   t({"", "if (!"}), i(1), t({") {", "\tprintf(\"Failed to open file: %s\\n\", "}), i(2), t({");", "\treturn 1;", "}", ""}),
          --   t({"", "{rest_of_your_code}", ""}),  -- Placeholder for additional code
          --   t({"", "fclose("}), i(1), t({");", ""}),
          -- }
          --[[
            FILE *{fptr};
            char {FILE_NAME}[] = "{path/to/file}";
            {fptr} = fopen({FILE_NAME}, "{mode}");
            if (!fptr) {
              printf("Failed to open file: %s\n", {FILE_NAME});
              return -1;
            }

            {rest_of_your_code}

            fclose({fptr});
            --]]
          -- ),
        })
      end,
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<CR>'] = cmp.mapping.confirm { select = true },

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        --['<CR>'] = cmp.mapping.confirm { select = true },
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- This will expand the current line or jump to the next item within the snippet.
        ['<C-k>'] = cmp.mapping(function()
          if luasnip.expand() then
            luasnip.expand()
          end
        end, { 'i', 's' }),

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback() -- Acts as backspace if there is nothing to jump to.
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        {
          name = 'lazydev',
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}
