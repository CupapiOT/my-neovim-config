local parse_snippet = require('luasnip').parser.parse_snippet
local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {
  parse_snippet('ping', 'printf("Ping!\\n");'),
  parse_snippet('pong', 'printf("Pong!\\n");'),
  parse_snippet('pang', 'printf("Pang!\\n");'),
  parse_snippet('peng', 'printf("Peng!\\n");'),
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
  s('fflush-std', { t 'fflush(', c(1, { t 'stdout', t 'stderr', i(nil, 'FILE *stream') }), t ');' }),
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
}
