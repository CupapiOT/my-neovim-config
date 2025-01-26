-- local parse_snippet = require('luasnip').parser.parse_snippet
local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
-- local c = ls.choice_node
-- local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
-- local rep = require('luasnip.extras').rep

return {
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
}
