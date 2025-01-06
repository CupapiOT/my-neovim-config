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
        -- local t = ls.text_node
        local i = ls.insert_node
        local fmt = require('luasnip.extras.fmt').fmt
        local rep = require('luasnip.extras').rep

        ls.config.set_config {
          -- This tells luasnip to keep the last snippet, letting you jump
          -- back into it even after you leave it.
          history = true,
          updateevents = 'TextChanged, TextChangedI',
        }
        ls.add_snippets('python', {
          parse_snippet('ping', 'print("Ping!")'),
          parse_snippet('pong', 'print("Pong!")'),
          parse_snippet('before', 'print("===== BEFORE =====")'),
          parse_snippet('after', 'print("===== AFTER  =====")'),
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
          parse_snippet('ping', 'printf("Ping!\\n");'),
          parse_snippet('pong', 'printf("Pong!\\n");'),
          parse_snippet('before', 'printf("===== BEFORE =====\\n");'),
          parse_snippet('after', 'printf("===== AFTER  =====\\n");'),
          parse_snippet('newline', 'printf("\\n");'),
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
          s(
            'openfile',
            fmt(
              [[
            FILE *{};
            char {}[] = "{}";
            {} = fopen({}, "{}");
            if (!fptr) {{
              printf("Failed to open file: %s\n", {});
              return -1;
            }}

            {}

            fclose({});
              ]],
              { i(1, 'fptr'), i(2, 'FILE_NAME'), i(3, 'path/to/file'), rep(1), rep(2), i(4, 'mode'), rep(2), i(5, '//rest_of_your_code'), rep(1) }
            )
            --[[
            FILE *{fptr};
            char {FILE_NAME}[] = "{path/to/file}";
            {fptr} = fopen({FILE_NAME}, "{mode}");
            if (!fptr) {
              printf("Failed to open file: %s\n", {FILE_NAME});
              return -1;
            }

            {//rest_of_your_code}

            fclose({fptr});
            --]]
            -- ),
          ),
          s(
            'read-file-linebyline',
            fmt(
              [[
            char {}[{}];
            while (fgets({}, {}, {}) != NULL) {{
              {}
            }}

              ]],
              -- 256 is a common default buffer size.
              { i(1, 'line_buffer'), i(2, '256'), rep(1), rep(2), i(3, 'fptr'), i(4, '//rest_of_your_code') }
            )
            --[[
            char {line_buffer}[{256}];
            while (fgets({line_buffer}, {256}, {fptr}) != NULL) {
              {//rest_of_your_code}
            }

            --]]
          ),
          s(
            'print-array',
            fmt(
              [[
            for ({} {} = {}; {} {} {}; {}{}) {{
              printf("{}[%{}] = %{}\n", {}, {}[{}]);
            }}
              ]],
              { -- Ordered in terms of most to least considerable (to be important).
                i(8, 'size_t'),
                i(1, 'i'),
                i(5, '0'),
                rep(1),
                i(6, '<'),
                i(2, 'count'),
                rep(1),
                i(7, '++'),
                rep(3),
                i(0, 'zu'),
                i(4, 'd'),
                rep(1),
                i(3, 'ARR_NAME'),
                rep(1),
              }
            )
            --[[
            for ({size_t} {i} = {0}; {i} {<} {ARR_SIZE}; {i}{++}) {
              printf("{ARR_NAME}[%{zu}] = %{d}\n", {i}, {ARR_NAME}[{i}]);
            }
            --]]
          ),
          s(
            'print-multiline',
            fmt(
              [[
              printf("{} = \n\"\"\"\n%{}\n\"\"\"\n", {});
              ]],
              { rep(1), i(0, 's'), i(1, 'var') }
            )
            --[[
              printf("{var} = \n\"\"\"\n%{s}\n\"\"\"\n", {var});
            --]]
          ),
        })
        ls.add_snippets('html', {
          s(
            'html-boilerplate',
            fmt(
              [[
              <!doctype html>
              <html lang="{}">
                <head>
                  <meta charset="UTF-8" />
                  <title>{}</title>
                  <meta name="viewport" content="width=device-width,initial-scale=1" />
                  <meta name="description" content="{}" />
                  <meta http-equiv="X-UA-Compatible" content="ie=edge">
                  <link rel="icon" href="./{}" />
                  <link rel="stylesheet" href="./{}" />
                </head>
                <body>
                  <main>
                    {}
                  </main>
                  <script src="./{}"></script>
                </body>
              </html>
              ]],
              { -- Ordered top-down, save for the HTML language part.
                i(1, 'Title for Page'),
                i(2, 'DESCRIPTION'),
                i(3, 'favicon.ico'),
                i(4, 'css/style.css'),
                i(5, '<h1>Hello, world!</h1>'),
                i(6, 'js/script.js'),
                i(0, 'en'),
              }
            )
            --[[
            <!doctype html>
            <html lang="{en}">
              <head>
                <meta charset="UTF-8" />
                <title>{Hello, world!}</title>
                <meta name="viewport" content="width=device-width,initial-scale=1" />
                <meta name="description" content="{DESCRIPTION}" />
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <link rel="icon" href="./{favicon.ico}" />
                <link rel="stylesheet" href="./{css/style.css}" />
              </head>
              <body>
                <main>
                  {<h1>Hello, world!</h1>}
                </main>
                <script src="./{js/script.js}"></script>
              </body>
            </html>
            --]]
          ),
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
