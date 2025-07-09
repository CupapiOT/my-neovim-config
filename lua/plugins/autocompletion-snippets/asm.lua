local parse_snippet = require('luasnip').parser.parse_snippet
local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
-- local c = ls.choice_node
-- local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {
  parse_snippet(
    'nasm-default',
    [[
    section .data
    $1

    section .bss
    $2

    section .text
    global _start

    _start:
            $3

            ; return 0
            mov rax, 60
            xor rdi, rdi
            syscall
    ]]
  ),
  parse_snippet(
    'nasm-sys-exit',
    [[
    mov rax, 60
    xor rdi, rdi
    syscall
    ]]
  ),
  s(
    'nasm-sys-write',
    fmt(
      [[
      ; write(stdout, {}, {})
      mov rax, 1
      mov rdi, 1
      mov rsi, {}
      mov rdx, {}
      syscall
      ]],
      { rep(1), rep(2), i(1, 'msg'), i(2, 'len') }
    )
  ),

  -- AT&T Assembly
  parse_snippet(
    '!at&t-default',
    [[
    .section .data
    $1
    
    .section .bss
    $2

    .global _start

    _start:
            $3

            // exit
            mov \$60, %rax
            xor %rdi, %rdi
            syscall
    ]]
  ),
  parse_snippet(
    '!at&t-intel-default',
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
    '!at&t-sys-exit',
    [[
    // exit
    mov \$60, %rax
    xor %rdi, %rdi
    syscall
    ]]
  ),
}
