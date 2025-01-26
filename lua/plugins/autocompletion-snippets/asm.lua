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
    'at&t-default',
    [[
    .global _start

    _start:
        $1

        mov $60, %rax
        xor %rdi, %rdi
        syscall
    ]]
  ),
  parse_snippet(
    'intel-default',
    [[
    .global _start
    .intel_syntax noprefix

    _start:
        $1

        mov rax, 60
        xor rdi, rdi
        syscall
    ]]
  ),
  parse_snippet(
    'start-program-at&t',
    [[
    .global _start

    _start:
        
    ]]
  ),
  parse_snippet(
    'start-program-intel',
    [[
    .global _start
    .intel_syntax noprefix

    _start:
        
    ]]
  ),
  parse_snippet(
    'exit-program-intel',
    [[
    mov rax, 60
    xor rdi, rdi
    syscall
    ]]
  ),
  parse_snippet(
    'exit-program-intel',
    [[
    mov $60, %rax
    xor %rdi, %rdi
    syscall
    ]]
  ),
}
