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
    global  _start

    _start:
            $3

    end:
            ;   exit(error_code=0)
            xor rdi, rdi
            mov rax, 60
            syscall
    ]]
  ),
  parse_snippet(
    'nasm-sys-exit',
    [[
    ;   exit(error_code=0)
    xor rdi, rdi
    mov rax, 60
    syscall
    ]]
  ),
  s(
    'nasm-sys-write-stdout-print',
    fmt(
      [[
      ;   write(fd=stdout, buf={}, count={})
      mov rdi, 1
      mov rsi, {}
      mov rdx, {}
      mov rax, 1
      syscall
      ]],
      { rep(1), rep(2), i(1, 'buf'), i(2, 'count') }
    )
  ),
  s(
    'nasm-sys-read',
    fmt(
      [[
      ;   read(fd={}, buf={}, count={})
      mov rdi, {}
      mov rsi, {}
      mov rdx, {}
      mov rax, 0
      syscall
      ]],
      { rep(1), rep(2), rep(3), i(1, 'fd'), i(2, 'buf'), i(3, 'count') }
    )
  ),
  s(
    'nasm-sys-write',
    fmt(
      [[
      ;   write(fd={}, buf={}, count={})
      mov rdi, {}
      mov rsi, {}
      mov rdx, {}
      mov rax, 1
      syscall
      ]],
      { rep(1), rep(2), rep(3), i(1, 'fd'), i(2, 'buf'), i(3, 'count') }
    )
  ),
  s(
    'nasm-sys-open',
    fmt(
      [[
      ;   open(pathname={}, flags={})
      mov rdi, {}
      mov rsi, {}
      mov rax, 2
      syscall
      ]],
      { rep(1), rep(2), i(1, 'pathname'), i(2, 'flags') }
    )
  ),
  s(
    'nasm-sys-lseek',
    fmt(
      [[
      ;   lseek(fd={}, offset={}, whence={})
      mov rdi, {}
      mov rsi, {}
      mov rdx, {}
      mov rax, 8
      syscall
      ]],
      { rep(1), rep(2), rep(3), i(1, 'fd'), i(2, 'offset'), i(3, 'whence') }
    )
  ),

  -- -- AT&T Syntax
  -- parse_snippet(
  --   '!at&t-default',
  --   [[
  --   .section .data
  --   $1
  --
  --   .section .bss
  --   $2
  --
  --   .section .text
  --   .global  _start
  --
  --   _start:
  --           $3
  --
  --   end:
  --           //  exit with code 0
  --           xor %rdi, %rdi
  --           mov \$60, %rax
  --           syscall
  --   ]]
  -- ),
  -- parse_snippet(
  --   '!at&t-sys-exit',
  --   [[
  --   //  exit with code 0;
  --   xor %rdi, %rdi
  --   mov \$60, %rax
  --   syscall
  --   ]]
  -- ),
}
