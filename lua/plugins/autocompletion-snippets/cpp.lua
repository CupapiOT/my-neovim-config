local parse_snippet = require('luasnip').parser.parse_snippet
-- local ls = require 'luasnip'
-- local s = ls.snippet
-- local i = ls.insert_node
-- local c = ls.choice_node
-- local t = ls.text_node
-- local fmt = require('luasnip.extras.fmt').fmt
-- local rep = require('luasnip.extras').rep

return {
  parse_snippet(
    'mainn',
    [[
    int main() {
      $1
      return 0;
    }
    ]]
  ),
  parse_snippet(
    'coutendl-flush',
    [[
    std::cout << $1 << std::endl;
    ]]
  )
}
