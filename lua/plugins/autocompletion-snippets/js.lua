local parse_snippet = require('luasnip').parser.parse_snippet
local ls = require 'luasnip'
-- local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
-- local c = ls.choice_node
-- local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
-- local rep = require('luasnip.extras').rep

return {
  s(
    'constArrFuncAnyParam',
    fmt(
      [[
      const {} = ({}) => {{
        {}
      }}
      ]],
      { -- Ordered from left to right.
        i(1, 'funcName'),
        i(2, 'param'),
        i(0),
      }
    )
    --[[
      const funcName = () => {

      }
    --]]
  ),
  s(
    'constArrFuncOneParam',
    fmt(
      [[
      const {} = ({}: {}) => {{
        {}
      }}
      ]],
      { -- Ordered from left to right.
        i(1, 'funcName'),
        i(2, 'param'),
        i(3, 'type'),
        i(0),
      }
    )
    --[[
      const funcName = (param: type) => {

      }
    --]]
  ),
  s(
    'trycatchfinally',
    fmt(
      [[
      try {{
        {}
      }} catch ({}: {}) {{
        {}
      }} finally {{
        {}
      }}
      ]],
      { -- Ordered from left to right.
        i(1),
        i(2, 'error'),
        i(3, 'any'),
        i(4),
        i(0),
      }
    )
    --[[
      try {

      } catch (error: any) {

      } finally {

      }
    --]]
  ),
}
