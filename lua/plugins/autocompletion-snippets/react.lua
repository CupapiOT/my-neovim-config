-- local parse_snippet = require('luasnip').parser.parse_snippet
local ls = require 'luasnip'
-- local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fn = ls.function_node
-- local c = ls.choice_node
-- local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

-- Thank you u/KhaithangH on Reddit:
--   https://reddit.com/r/neovim/comments/wnxu3y/comment/ik85qve/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local ret_filename = function()
  return vim.fn.fnamemodify(vim.fn.expand '%<', ':t')
end

return {
  s(
    'rnfp - React Native Function with Props',
    fmt(
      [[
    import {{ View, Text }} from 'react-native'

    type {}Props = {{
      {}: {}
    }}

    export default function {}({{ {} }}: {}Props) {{
      return (
        {}
      );
    }}
    ]],
      {
        i(1, ret_filename()),
        i(2, 'prop1'),
        i(3, 'type1'),
        rep(1),
        rep(2),
        rep(1),
        i(0),
      }
    )
  ),
  --[[
    import { View, Text } from "react-native";

    type FileNameProps = {
      prop1: type1;
    };

    export default function FileName({ prop1 }: FileNameProps) {
      return (

      );
    }
  --]]
}
