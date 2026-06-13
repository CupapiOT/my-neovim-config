local parse_snippet = require('luasnip').parser.parse_snippet
-- local ls = require 'luasnip'
-- local s = ls.snippet
-- local i = ls.insert_node
-- local c = ls.choice_node
-- local t = ls.text_node
-- local fmt = require('luasnip.extras.fmt').fmt
-- local rep = require('luasnip.extras').rep

return {
  parse_snippet('shebang-env', '#!/usr/bin/env bash'),
  parse_snippet('shebang-bin', '#!/bin/bash'),
  parse_snippet('#!/usr', '#!/usr/bin/env bash'),
  parse_snippet('#!/bin', '#!/bin/bash'),
}
