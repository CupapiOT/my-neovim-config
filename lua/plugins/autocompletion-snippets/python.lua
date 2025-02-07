local parse_snippet = require('luasnip').parser.parse_snippet
-- local ls = require 'luasnip'
-- local s = ls.snippet
-- local i = ls.insert_node
-- local c = ls.choice_node
-- local t = ls.text_node
-- local fmt = require('luasnip.extras.fmt').fmt
-- local rep = require('luasnip.extras').rep

return {
  parse_snippet('ping', 'print("Ping!")'),
  parse_snippet('pong', 'print("Pong!")'),
  parse_snippet('pang', 'print("Pang!")'),
  parse_snippet('peng', 'print("Peng!")'),
  parse_snippet('before', 'print("===== BEFORE =====")'),
  parse_snippet('after', 'print("===== AFTER  =====")'),
  parse_snippet(
    'inem',
    [[
    def main() -> None:
        $pass


    if __name__ == '__main__':
        main()
    ]]
  ),
}
